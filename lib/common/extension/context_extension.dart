import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:travel_booking_tour/features/profile/model/photo_json.dart';
import 'package:travel_booking_tour/res/app_layout_shimmer.dart';
import 'package:travel_booking_tour/res/app_photo_view.dart';

import '../../res/app_camera.dart';
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
}
