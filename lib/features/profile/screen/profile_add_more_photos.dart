import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_photos/bloc_my_photos_event.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_photos/bloc_my_photos_screen.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_photos/bloc_my_photos_state.dart';
import 'package:travel_booking_tour/features/profile/widget/photo_item.dart';
import 'package:travel_booking_tour/res/res.dart';
import 'package:travel_booking_tour/router/routes.dart';

import '../../../res/app_dialog.dart';

class ProfileAddMorePhotos extends StatefulWidget {
  const ProfileAddMorePhotos({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileAddMorePhotos();
  }
}

class _ProfileAddMorePhotos extends State<ProfileAddMorePhotos> {
  late BlocMyPhotosScreen _blocMyPhotosScreen;

  @override
  void initState() {
    _blocMyPhotosScreen = BlocProvider.of<BlocMyPhotosScreen>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BlocMyPhotosScreen, BlocMyPhotosState>(
        listenWhen: (previous, current) =>
            current is BlocMyPhotosStateAddNewPhotos ||
            current is BlocMyPhotosStateShowDialogRequestCameraPermission,
        listener: (context, state) {
          if (state is BlocMyPhotosStateAddNewPhotos) {
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
          } else if (state
              is BlocMyPhotosStateShowDialogRequestCameraPermission) {
            showDialog(
              context: context,
              builder: (context) => AppDialog(
                typeDialog: TypeDialog.info,
                content:
                    '''You can't take photos if reject camera permission''',
                negativeTitle: 'Dismiss',
                positiveTitle: 'OK',
                positiveAction: () async {
                  bool requestState =
                      await _blocMyPhotosScreen.requestCameraPermission();
                  if (requestState) {
                    Routes.backTo();
                    showCameraAndTakePhoto();
                  }
                },
              ),
            );
          }
        },
        child: Scaffold(
          appBar: AppbarApp(
            title: 'Add Photos',
            voidCallBack: () async {
              await _blocMyPhotosScreen.removeAllPhotoSeleted();
              Routes.backTo();
            },
            suffixWidget: Container(
              alignment: Alignment.center,
              height: 20,
              margin: const EdgeInsets.only(right: 16),
              child: InkWell(
                child: Text(
                  'DONE',
                  style: AppStyles.titleMedium.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary),
                ),
                onTap: () => _blocMyPhotosScreen
                    .add(BlocMyPhotosEventClickButtonSelectPhotosDone()),
              ),
            ),
          ),
          backgroundColor: AppColors.white,
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
            child: BlocBuilder<BlocMyPhotosScreen, BlocMyPhotosState>(
              buildWhen: (previous, current) =>
                  current is BlocMyPhotosStateLoadLocalPhotos,
              builder: (context, state) {
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1,
                            crossAxisCount: 3,
                            mainAxisSpacing: 3,
                            crossAxisSpacing: 3),
                    shrinkWrap: false,
                    itemCount: _blocMyPhotosScreen.localFilePhotos.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => index == 0
                        ? _buildTakePhotoWidget()
                        : PhotoItem(
                            url: _blocMyPhotosScreen
                                    .localFilePhotos[index].url ??
                                '',
                            selected: _blocMyPhotosScreen
                                    .localFilePhotos[index].selected ??
                                false,
                            enable: true,
                            onClick: (filePath, selected) => selected
                                ? _blocMyPhotosScreen
                                    .addPhotoToMyPhotos(filePath)
                                : _blocMyPhotosScreen.remove(filePath),
                          ));
              },
            ),
          )),
        ));
  }

  Widget _buildTakePhotoWidget() {
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
                AppIcons.camera,
                color: AppColors.primary,
              ),
              const SizedBox(height: 6),
              Text(
                'Take Photo',
                style: AppStyles.titleSmall.copyWith(color: AppColors.primary),
              )
            ],
          ),
        ),
        Material(
          color: AppColors.transparent,
          child: InkWell(
            onTap: () async {
              final state =
                  await _blocMyPhotosScreen.isCameraPermissionGranted();
              if (state) {
                showCameraAndTakePhoto();
              } else {
                _blocMyPhotosScreen
                    .add(BlocMyPhotosEventRequestCameraPermission());
              }
            },
            child: Container(
              color: AppColors.transparent,
            ),
          ),
        )
      ],
    );
  }

  Future<void> showCameraAndTakePhoto() async {
    try {
      final XFile? photo = await showModalBottomSheet(
        context: context,
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
        builder: (context) => AppCamera(
            cameras: Routes.cameras, cameraOrRecorder: CameraOrRecorder.camera),
      );

      if (photo != null) {
        _blocMyPhotosScreen.newPhotos.add(photo.path);
        _blocMyPhotosScreen.add(BlocMyPhotosEventClickButtonSelectPhotosDone());
      } else {}
    } on Exception catch (ex) {
      debugPrint('showCameraAndTakePhoto Exception : ${ex.toString()}');
    }
  }
}
