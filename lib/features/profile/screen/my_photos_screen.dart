import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/common/extension/context_extension.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_photos/bloc_my_photos_event.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_photos/bloc_my_photos_screen.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_photos/bloc_my_photos_state.dart';
import 'package:travel_booking_tour/features/profile/bloc/profile/bloc_profile_event.dart';
import 'package:travel_booking_tour/features/profile/bloc/profile/bloc_profile_screen.dart';
import 'package:travel_booking_tour/features/profile/model/photo_json.dart';
import 'package:travel_booking_tour/features/profile/model/user_info.dart';
import 'package:travel_booking_tour/res/app_dialog.dart';
import 'package:travel_booking_tour/res/button.dart';
import 'package:travel_booking_tour/res/res.dart';

import '../../../res/app_inkwell.dart';
import '../../../router/routes.dart';
import '../widget/photo_item.dart';

class MyPhotosScreen extends StatefulWidget {
  const MyPhotosScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyPhotosScreen();
  }
}

class _MyPhotosScreen extends State<MyPhotosScreen> {
  late BlocMyPhotosScreen _blocMyPhotosScreen;

  @override
  void initState() {
    _blocMyPhotosScreen = BlocProvider.of<BlocMyPhotosScreen>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserInfoJson? userInfoJson =
        (ModalRoute.of(context)?.settings.arguments as Map)[AppConstant.data]
            as UserInfoJson?;
    if (userInfoJson != null) {
      _blocMyPhotosScreen.myPhotos = [...userInfoJson.images ?? []];
      _blocMyPhotosScreen.myPhotos.sort(
        (a, b) => b.createdAt!.compareTo(a.createdAt!),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        if (_blocMyPhotosScreen.myPhotosMode == MyPhotosMode.delete) {
          _blocMyPhotosScreen
              .add(BlocMyPhotosEventChangeMode(mode: MyPhotosMode.watch));
        }
        return _blocMyPhotosScreen.myPhotosMode == MyPhotosMode.watch;
      },
      child: Scaffold(
        appBar: AppbarApp(
          title: 'My Photos',
          centerTitle: false,
          prefixWidget: BlocBuilder<BlocMyPhotosScreen, BlocMyPhotosState>(
            buildWhen: (previous, current) =>
                current is BlocMyPhotosStateChangeMode,
            builder: (context, state) {
              MyPhotosMode mode = MyPhotosMode.watch;
              if (state is BlocMyPhotosStateChangeMode) {
                mode = state.mode;
              }
              return AppInkWell(
                voidCallBack: mode == MyPhotosMode.watch
                    ? Routes.backTo
                    : () async {
                        _blocMyPhotosScreen.add(BlocMyPhotosEventChangeMode(
                            mode: MyPhotosMode.watch));
                      },
                icon: mode == MyPhotosMode.watch
                    ? AppIcons.icBack
                    : AppIcons.icClose,
                iconSize: const Size(12, 20),
                background: AppColors.transparent,
                iconTint: AppColors.black,
              );
            },
          ),
          suffixWidget: BlocBuilder<BlocMyPhotosScreen, BlocMyPhotosState>(
            buildWhen: (previous, current) =>
                current is BlocMyPhotosStateChangeMode,
            builder: (context, state) {
              MyPhotosMode mode = MyPhotosMode.watch;
              if (state is BlocMyPhotosStateChangeMode) {
                mode = state.mode;
              }
              return mode == MyPhotosMode.delete
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          AppInkWell(
                            voidCallBack: () => _blocMyPhotosScreen
                                .add(BlocMyPhotosEventCheckListPhotos()),
                            icon: AppIcons.icCheckList,
                            iconSize: const Size(23, 23),
                            background: AppColors.transparent,
                            iconTint: AppColors.black,
                          ),
                          const SizedBox(width: 5),
                          AppInkWell(
                            voidCallBack: () => _blocMyPhotosScreen
                                .add(BlocMyPhotosEventDeleteImage()),
                            icon: AppIcons.icDelete,
                            iconSize: const Size(23, 23),
                            background: AppColors.transparent,
                            iconTint: AppColors.black,
                          )
                        ],
                      ),
                    )
                  : Container();
            },
          ),
        ),
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: BlocListener<BlocMyPhotosScreen, BlocMyPhotosState>(
            listenWhen: (previous, current) =>
                current is BlocMyPhotosStateShowDialogRequestPermission ||
                current is BlocMyPhotosStateDeletePhotos,
            listener: (context, state) {
              if (state is BlocMyPhotosStateShowDialogRequestPermission) {
                showDialog(
                  context: context,
                  builder: (context) => DefaultDialog.warning(
                    content: const Text(
                        'We need manage external storage to load your local photos'),
                    actions: [
                      PrimaryActiveButton(
                        text: 'Open setting',
                        onTap: () {
                          _blocMyPhotosScreen
                              .add(BlocMyPhotosEventRequestPermission());
                          Routes.backTo();
                        },
                      )
                    ],
                  ),
                );
              } else if (state is BlocMyPhotosStateDeletePhotos) {
                if (state.appResult.state == ResultState.loading) {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      isDismissible: false,
                      enableDrag: false,
                      backgroundColor: AppColors.transparent,
                      builder: (context) => AppLayoutShimmer(
                          loadingColor: AppColors.primary,
                          title: Text(
                            'Please wait a moment.....',
                            style: AppStyles.titleMedium.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.white),
                          ),
                          background: AppColors.black.withOpacity(0.3)));
                } else {
                  Routes.backTo();
                }
              }
            },
            child: BlocBuilder<BlocMyPhotosScreen, BlocMyPhotosState>(
                buildWhen: (previous, current) =>
                    current is BlocMyPhotosStateAddNewPhotos ||
                    current is BlocMyPhotosStateChangeMode ||
                    current is BlocMyPhotosStateCheckListPhotos,
                builder: (context, state) {
                  if (state is BlocMyPhotosStateAddNewPhotos) {
                    if (state.appResult.state == ResultState.success) {
                      BlocProvider.of<BlocProfileScreen>(context)
                          .add(BlocProfileEventInitial());
                    }
                  }

                  if (_blocMyPhotosScreen.myPhotosMode == MyPhotosMode.delete) {
                    final PhotoJson first = _blocMyPhotosScreen.myPhotos.first;
                    if (first.id == -1) {
                      _blocMyPhotosScreen.myPhotos.removeAt(0);
                    }
                  } else {
                    int index = _blocMyPhotosScreen.myPhotos
                        .indexWhere((element) => element.id == -1);
                    if (index == -1) {
                      _blocMyPhotosScreen.myPhotos
                          .insert(0, const PhotoJson(id: -1));
                    }
                  }

                  return GridView.builder(
                      controller: _blocMyPhotosScreen.scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 1,
                              crossAxisCount: 3,
                              mainAxisSpacing: 3,
                              crossAxisSpacing: 3),
                      shrinkWrap: true,
                      itemCount: _blocMyPhotosScreen.myPhotos.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => _blocMyPhotosScreen
                                  .myPhotosMode ==
                              MyPhotosMode.watch
                          ? (index == 0
                              ? _buildWidgetButtonAddPhotos()
                              : _buildItem(_blocMyPhotosScreen.myPhotos[index]))
                          : _buildItem(_blocMyPhotosScreen.myPhotos[index]));
                }),
          ),
        ),
      ),
    );
  }

  PhotoItem _buildItem(PhotoJson photoJson) {
    return PhotoItem(
        key: UniqueKey(),
        url: photoJson.uploadUrl ?? photoJson.url ?? '',
        selected: photoJson.selected ?? false,
        isHttps: true,
        visibilityRadioButton:
            _blocMyPhotosScreen.myPhotosMode == MyPhotosMode.delete,
        enable: _blocMyPhotosScreen.myPhotosMode == MyPhotosMode.delete,
        onLongClick: (filePath, value) {
          if (_blocMyPhotosScreen.myPhotosMode != MyPhotosMode.delete) {
            _blocMyPhotosScreen
                .add(BlocMyPhotosEventChangeMode(mode: MyPhotosMode.delete));
          } else {
            _blocMyPhotosScreen.action(value, photoJson);
          }
        },
        onClick: (p0, value) {
          photoJson = photoJson.copyWith(selected: value);
          _blocMyPhotosScreen.action(value, photoJson);
        },
        onClickWhenDisable: (url) async =>
            await context.showPhotoFullScreen(photoJson));
  }

  Widget _buildWidgetButtonAddPhotos() {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.primary)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppIcons.icAddBlue,
                color: AppColors.primary,
              ),
              const SizedBox(height: 6),
              Text(
                'Add Photos',
                style: AppStyles.titleSmall.copyWith(color: AppColors.primary),
              )
            ],
          ),
        ),
        Material(
          color: AppColors.transparent,
          child: InkWell(
            onTap: () =>
                _blocMyPhotosScreen.add(BlocMyPhotosEventClickButtonAddPhoto()),
            child: Container(
              color: AppColors.transparent,
            ),
          ),
        )
      ],
    );
  }
}
