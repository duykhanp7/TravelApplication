import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_booking_tour/data/model/news_json.dart';
import 'package:travel_booking_tour/features/explore/widget/bottom_sheet_news.dart';
import 'package:travel_booking_tour/features/profile/model/photo_json.dart';
import 'package:travel_booking_tour/res/app_photo_view.dart';

import '../../res/app_camera.dart';
import '../../res/app_layout_shimmer.dart';
import '../../res/button.dart';
import '../../res/colors.dart';
import '../../res/icons.dart';
import '../../res/styles.dart';
import '../../router/routes.dart';
import '../enum/enums.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textStyle => theme.textTheme;

  Future<XFile?> showCameraAndTakePhotos() async {
    try {
      final XFile? photo = await showModalBottomSheet(
        context: this,
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
        builder: (context) => AppCamera(
            cameras: Routes.cameras, cameraOrRecorder: CameraOrRecorder.camera),
      );
      return photo;
    } on Exception catch (ex) {
      debugPrint('showCameraAndTakePhoto Exception : ${ex.toString()}');
      return null;
    }
  }

  Future<void> showPhotoFullScreen(PhotoJson photoJson) async {
    try {
      await showModalBottomSheet(
        context: this,
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
        builder: (context) => AppPhotoView(
          photoJson: photoJson,
        ),
      );
    } on Exception catch (ex) {
      debugPrint('Exception showPhotoFullScreen : ${ex.toString()}');
    }
  }

  Future<void> showBottomSheetShare() async {
    await showCupertinoModalPopup(
      context: this,
      barrierDismissible: true,
      builder: (context) => CupertinoActionSheet(
        actions: [
          Container(
            color: AppColors.white,
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Material(
                    child: Text(
                      'Share on',
                      style: AppStyles.titleMedium.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 23),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Material(
                        child: SocialButton(
                          width: 60,
                          height: 60,
                          radius: 14,
                          title: 'Facebook',
                          icon: AppIcons.icFacebookFrame,
                          background: AppColors.facebookBgColor,
                          splash: AppColors.white.withOpacity(0.2),
                          voidCallback: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      Material(
                        child: SocialButton(
                          width: 60,
                          height: 60,
                          radius: 14,
                          title: 'Google',
                          icon: AppIcons.icGoogleFrame,
                          background: AppColors.googleBgColor,
                          splash: AppColors.white.withOpacity(0.2),
                          voidCallback: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      Material(
                        child: SocialButton(
                          width: 60,
                          height: 60,
                          radius: 14,
                          title: 'Kakao Talk',
                          icon: AppIcons.icTalkFrame,
                          background: AppColors.talkBgColor,
                          splash: AppColors.white.withOpacity(0.2),
                          voidCallback: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      Material(
                        child: SocialButton(
                          width: 60,
                          height: 60,
                          radius: 14,
                          title: 'Whatsapp',
                          icon: AppIcons.icWhatAppFrame,
                          background: AppColors.whatAppBgColor,
                          splash: AppColors.white.withOpacity(0.2),
                          voidCallback: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      Material(
                        child: SocialButton(
                          width: 60,
                          height: 60,
                          radius: 14,
                          title: 'Twitter',
                          icon: AppIcons.icTwitterFrame,
                          background: AppColors.twitterBgColor,
                          splash: AppColors.white.withOpacity(0.2),
                          voidCallback: () {},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
        cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancel',
              style: AppStyles.titleMedium.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.italic,
                  color: AppColors.primary),
            )),
      ),
    );
  }

  Future<void> showLoadingBottomSheet() async {
    showModalBottomSheet(
        context: this,
        isScrollControlled: true,
        isDismissible: false,
        enableDrag: false,
        backgroundColor: AppColors.transparent,
        builder: (context) => AppLayoutShimmer(
            loadingColor: AppColors.primary,
            title: Text(
              'Please wait a moment.....',
              style: AppStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.white),
            ),
            background: AppColors.black.withOpacity(0.3)));
  }

  Future<void> showBottomSheetNews(NewsJson newsJson) async {
    await showModalBottomSheet(
        context: this,
        isDismissible: false,
        enableDrag: false,
        isScrollControlled: true,
        backgroundColor: AppColors.transparent,
        builder: (context) => BottomSheetNews(
              newsJson: newsJson,
            ));
  }
}
