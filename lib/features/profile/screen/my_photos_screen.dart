import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_photos/bloc_my_photos_event.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_photos/bloc_my_photos_screen.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_photos/bloc_my_photos_state.dart';
import 'package:travel_booking_tour/res/app_dialog.dart';
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
    return Scaffold(
      appBar: const AppbarApp(
        title: 'My Photos',
        prefixWidget: AppInkWell(
          voidCallBack: Routes.backTo,
          icon: AppIcons.icBack,
          iconSize: Size(12, 20),
          background: AppColors.transparent,
          iconTint: AppColors.black,
        ),
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: BlocListener<BlocMyPhotosScreen, BlocMyPhotosState>(
          listenWhen: (previous, current) =>
              current is BlocMyPhotosStateShowDialogRequestPermission,
          listener: (context, state) {
            showDialog(
              context: context,
              builder: (context) => AppDialog(
                typeDialog: TypeDialog.info,
                content:
                    'We need manage external storage to load your local photos',
                negativeTitle: 'Dismiss',
                positiveTitle: 'OK',
                positiveAction: () {
                  _blocMyPhotosScreen.add(BlocMyPhotosEventRequestPermission());
                  Routes.backTo();
                },
              ),
            );
          },
          child: BlocBuilder<BlocMyPhotosScreen, BlocMyPhotosState>(
              buildWhen: (previous, current) =>
                  current is BlocMyPhotosStateAddNewPhotos,
              builder: (context, state) {
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1,
                            crossAxisCount: 3,
                            mainAxisSpacing: 3,
                            crossAxisSpacing: 3),
                    shrinkWrap: false,
                    itemCount: _blocMyPhotosScreen.myPhotos.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => index == 0
                        ? _buildWidgetButtonAddPhotos()
                        : PhotoItem(
                            file: File(_blocMyPhotosScreen.myPhotos[index]),
                            selected: false,
                            enable: false,
                            onClick: (p0, p1) {}));
              }),
        ),
      ),
    );
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
