// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_booking_tour/common/enums/enums.dart';
import 'package:travel_booking_tour/res/app_dialog.dart';
import 'package:travel_booking_tour/res/res.dart';
import 'package:travel_booking_tour/router/routes.dart';
import 'package:video_player/video_player.dart';

class AppCamera extends StatefulWidget {
  final List<CameraDescription> cameras;
  final CameraOrRecorder cameraOrRecorder;

  const AppCamera(
      {super.key, required this.cameras, required this.cameraOrRecorder});

  @override
  State<AppCamera> createState() {
    return _AppCameraState();
  }
}

/// Returns a suitable camera icon for [direction].
IconData getCameraLensIcon(CameraLensDirection direction) {
  switch (direction) {
    case CameraLensDirection.back:
      return Icons.camera_rear;
    case CameraLensDirection.front:
      return Icons.camera_front;
    case CameraLensDirection.external:
      return Icons.camera;
  }
  // This enum is from a different package, so a new value could be added at
  // any time. The example should keep working if that happens.
  // ignore: dead_code
  return Icons.camera;
}

void _logError(String code, String? message) {
  // ignore: avoid_print
  print('Error: $code${message == null ? '' : '\nError Message: $message'}');
}

class _AppCameraState extends State<AppCamera>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController? controller;
  XFile? imageFile;
  XFile? videoFile;
  VideoPlayerController? videoController;
  VoidCallback? videoPlayerListener;
  bool enableAudio = true;
  double _maxAvailableExposureOffset = 0.0;
  double _currentExposureOffset = 0.0;
  late AnimationController _flashModeControlRowAnimationController;
  late Animation<double> _flashModeControlRowAnimation;
  late AnimationController _exposureModeControlRowAnimationController;
  late Animation<double> _exposureModeControlRowAnimation;
  late AnimationController _focusModeControlRowAnimationController;
  late Animation<double> _focusModeControlRowAnimation;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  double _currentScale = 1.0;
  double _baseScale = 1.0;
  CameraLensDirection cameraLensDirection = CameraLensDirection.front;
  final ImagePicker _imagePicker = ImagePicker();
  bool isEnableFlashMode = false;

  // Counting pointers (number of user fingers on screen)
  int _pointers = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemTransparentStatusBar);

    _flashModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _flashModeControlRowAnimation = CurvedAnimation(
      parent: _flashModeControlRowAnimationController,
      curve: Curves.easeInCubic,
    );
    _exposureModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _exposureModeControlRowAnimation = CurvedAnimation(
      parent: _exposureModeControlRowAnimationController,
      curve: Curves.easeInCubic,
    );
    _focusModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _focusModeControlRowAnimation = CurvedAnimation(
      parent: _focusModeControlRowAnimationController,
      curve: Curves.easeInCubic,
    );

    onNewCameraSelected(widget.cameras[0]);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _flashModeControlRowAnimationController.dispose();
    _exposureModeControlRowAnimationController.dispose();
    super.dispose();
  }

  // #docregion AppLifecycle
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
  }
  // #enddocregion AppLifecycle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _cameraPreviewWidget(),
          Container(
            child: widget.cameraOrRecorder == CameraOrRecorder.camera
                ? Positioned(
                    top: 40,
                    right: 10,
                    child: _modeControlTakeImageRowWidget(),
                  )
                : Positioned(
                    top: 40,
                    right: 10,
                    child: _modeControlRecorderRowWidget(),
                  ),
          ),
          Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  _captureControlRowWidget(),
                ],
              ))
        ],
      ),
    );
  }

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget() {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return const Text(
        'Tap a camera',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return Listener(
        onPointerDown: (_) => _pointers++,
        onPointerUp: (_) => _pointers--,
        child: CameraPreview(
          controller!,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onScaleStart: _handleScaleStart,
              onScaleUpdate: _handleScaleUpdate,
              onTapDown: (TapDownDetails details) =>
                  onViewFinderTap(details, constraints),
            );
          }),
        ),
      );
    }
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _baseScale = _currentScale;
  }

  Future<void> _handleScaleUpdate(ScaleUpdateDetails details) async {
    // When there are not exactly two fingers on screen don't scale
    if (controller == null || _pointers != 2) {
      return;
    }

    _currentScale = (_baseScale * details.scale)
        .clamp(_minAvailableZoom, _maxAvailableZoom);

    await controller!.setZoomLevel(_currentScale);
  }

  /// Display the thumbnail of the captured image or video.
  //
  /// Display a bar with buttons to change the flash and exposure modes
  Widget _modeControlTakeImageRowWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Material(
          color: AppColors.transparent,
          child: IconButton(
            splashColor: AppColors.white.withOpacity(0.2),
            splashRadius: 20,
            icon: controller?.value.flashMode == FlashMode.off
                ? const Icon(Icons.flash_off)
                : controller?.value.flashMode == FlashMode.auto
                    ? const Icon(Icons.flash_auto)
                    : controller?.value.flashMode == FlashMode.always
                        ? const Icon(Icons.flash_on)
                        : const Icon(Icons.highlight),
            color: AppColors.white,
            onPressed: controller != null ? onFlashModeButtonPressed : null,
          ),
        ),
        _flashModeControlRowWidget(),
      ],
    );
  }

  Widget _modeControlRecorderRowWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Material(
          color: AppColors.transparent,
          child: IconButton(
            splashColor: AppColors.white.withOpacity(0.2),
            splashRadius: 20,
            icon: Icon(enableAudio ? Icons.volume_up : Icons.volume_mute),
            color: enableAudio ? AppColors.primary : AppColors.white,
            onPressed: controller != null ? onAudioModeButtonPressed : null,
          ),
        ),
        Material(
          color: AppColors.transparent,
          child: IconButton(
            icon: const Icon(Icons.highlight),
            splashColor: AppColors.white.withOpacity(0.2),
            splashRadius: 20,
            color: controller?.value.flashMode == FlashMode.torch
                ? AppColors.primary
                : Colors.white,
            onPressed: controller != null
                ? () {
                    if (mounted) {
                      if (!isEnableFlashMode) {
                        isEnableFlashMode = true;
                        onSetFlashModeButtonPressed(FlashMode.torch);
                      } else {
                        isEnableFlashMode = false;
                        onSetFlashModeButtonPressed(FlashMode.off);
                      }
                    }
                  }
                : null,
          ),
        ),
        Material(
          color: AppColors.transparent,
          child: IconButton(
            icon: SvgPicture.asset(AppIcons.icGallery,
                width: 25, height: 25, color: AppColors.white),
            splashColor: AppColors.white.withOpacity(0.2),
            splashRadius: 20,
            color: Colors.white,
            onPressed: () async {
              final xFile = await pickVideo();
              videoFile = xFile;
              await Future.delayed(
                const Duration(seconds: 0),
                () => Navigator.of(context).pop(xFile),
              );
            },
          ),
        ),
        Material(
          color: AppColors.transparent,
          child: IconButton(
            icon: SvgPicture.asset(AppIcons.icSwitchCamera,
                width: 25, height: 25, color: AppColors.white),
            splashColor: AppColors.white.withOpacity(0.2),
            splashRadius: 20,
            color: Colors.white,
            onPressed: () {
              if (cameraLensDirection == CameraLensDirection.front) {
                cameraLensDirection = CameraLensDirection.back;
                onNewCameraSelected(widget.cameras[1]);
              } else {
                cameraLensDirection = CameraLensDirection.front;
                onNewCameraSelected(widget.cameras[0]);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _flashModeControlRowWidget() {
    return SizeTransition(
      sizeFactor: _flashModeControlRowAnimation,
      child: ClipRect(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Material(
                color: AppColors.transparent,
                child: IconButton(
                  splashColor: AppColors.white.withOpacity(0.2),
                  splashRadius: 20,
                  icon: const Icon(Icons.flash_off),
                  color: controller?.value.flashMode == FlashMode.off
                      ? AppColors.primary
                      : Colors.white,
                  onPressed: controller != null
                      ? () => onSetFlashModeButtonPressed(FlashMode.off)
                      : null,
                )),
            Material(
              color: AppColors.transparent,
              child: IconButton(
                splashColor: AppColors.white.withOpacity(0.2),
                splashRadius: 20,
                icon: const Icon(Icons.flash_auto),
                color: controller?.value.flashMode == FlashMode.auto
                    ? AppColors.primary
                    : Colors.white,
                onPressed: controller != null
                    ? () => onSetFlashModeButtonPressed(FlashMode.auto)
                    : null,
              ),
            ),
            Material(
              color: AppColors.transparent,
              child: IconButton(
                splashColor: AppColors.white.withOpacity(0.2),
                splashRadius: 20,
                icon: const Icon(Icons.flash_on),
                color: controller?.value.flashMode == FlashMode.always
                    ? AppColors.primary
                    : Colors.white,
                onPressed: controller != null
                    ? () => onSetFlashModeButtonPressed(FlashMode.always)
                    : null,
              ),
            ),
            Material(
              color: AppColors.transparent,
              child: IconButton(
                icon: const Icon(Icons.highlight),
                splashColor: AppColors.white.withOpacity(0.2),
                splashRadius: 20,
                color: controller?.value.flashMode == FlashMode.torch
                    ? AppColors.primary
                    : Colors.white,
                onPressed: controller != null
                    ? () => onSetFlashModeButtonPressed(FlashMode.torch)
                    : null,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Widget _exposureModeControlRowWidget() {
  //   final ButtonStyle styleAuto = TextButton.styleFrom(
  //     // ignore: deprecated_member_use
  //     primary: controller?.value.exposureMode == ExposureMode.auto
  //         ? Colors.orange
  //         : Colors.blue,
  //   );
  //   final ButtonStyle styleLocked = TextButton.styleFrom(
  //     // ignore: deprecated_member_use
  //     primary: controller?.value.exposureMode == ExposureMode.locked
  //         ? Colors.orange
  //         : Colors.blue,
  //   );

  //   return SizeTransition(
  //     sizeFactor: _exposureModeControlRowAnimation,
  //     child: ClipRect(
  //       child: Container(
  //         color: Colors.grey.shade50,
  //         child: Column(
  //           children: <Widget>[
  //             const Center(
  //               child: Text('Exposure Mode'),
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: <Widget>[
  //                 TextButton(
  //                   style: styleAuto,
  //                   onPressed: controller != null
  //                       ? () =>
  //                           onSetExposureModeButtonPressed(ExposureMode.auto)
  //                       : null,
  //                   onLongPress: () {
  //                     if (controller != null) {
  //                       controller!.setExposurePoint(null);
  //                       showInSnackBar('Resetting exposure point');
  //                     }
  //                   },
  //                   child: const Text('AUTO'),
  //                 ),
  //                 TextButton(
  //                   style: styleLocked,
  //                   onPressed: controller != null
  //                       ? () =>
  //                           onSetExposureModeButtonPressed(ExposureMode.locked)
  //                       : null,
  //                   child: const Text('LOCKED'),
  //                 ),
  //                 TextButton(
  //                   style: styleLocked,
  //                   onPressed: controller != null
  //                       ? () => controller!.setExposureOffset(0.0)
  //                       : null,
  //                   child: const Text('RESET OFFSET'),
  //                 ),
  //               ],
  //             ),
  //             const Center(
  //               child: Text('Exposure Offset'),
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: <Widget>[
  //                 Text(_minAvailableExposureOffset.toString()),
  //                 Slider(
  //                   value: _currentExposureOffset,
  //                   min: _minAvailableExposureOffset,
  //                   max: _maxAvailableExposureOffset,
  //                   label: _currentExposureOffset.toString(),
  //                   onChanged: _minAvailableExposureOffset ==
  //                           _maxAvailableExposureOffset
  //                       ? null
  //                       : setExposureOffset,
  //                 ),
  //                 Text(_maxAvailableExposureOffset.toString()),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _focusModeControlRowWidget() {
  //   final ButtonStyle styleAuto = TextButton.styleFrom(
  //     // ignore: deprecated_member_use
  //     primary: controller?.value.focusMode == FocusMode.auto
  //         ? Colors.orange
  //         : Colors.blue,
  //   );
  //   final ButtonStyle styleLocked = TextButton.styleFrom(
  //     // ignore: deprecated_member_use
  //     primary: controller?.value.focusMode == FocusMode.locked
  //         ? Colors.orange
  //         : Colors.blue,
  //   );

  //   return SizeTransition(
  //     sizeFactor: _focusModeControlRowAnimation,
  //     child: ClipRect(
  //       child: Container(
  //         color: Colors.grey.shade50,
  //         child: Column(
  //           children: <Widget>[
  //             const Center(
  //               child: Text('Focus Mode'),
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: <Widget>[
  //                 TextButton(
  //                   style: styleAuto,
  //                   onPressed: controller != null
  //                       ? () => onSetFocusModeButtonPressed(FocusMode.auto)
  //                       : null,
  //                   onLongPress: () {
  //                     if (controller != null) {
  //                       controller!.setFocusPoint(null);
  //                     }
  //                     showInSnackBar('Resetting focus point');
  //                   },
  //                   child: const Text('AUTO'),
  //                 ),
  //                 TextButton(
  //                   style: styleLocked,
  //                   onPressed: controller != null
  //                       ? () => onSetFocusModeButtonPressed(FocusMode.locked)
  //                       : null,
  //                   child: const Text('LOCKED'),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  /// Display the control bar with buttons to take pictures and record videos.
  Widget _captureControlRowWidget() {
    final CameraController? cameraController = controller;
    if (widget.cameraOrRecorder == CameraOrRecorder.camera) {
      return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  AppIcons.icSwitchCamera,
                  color: AppColors.white,
                  width: 30,
                  height: 30,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: AppColors.transparent,
                      borderRadius: BorderRadius.circular(30)),
                  child: Material(
                    color: AppColors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    child: InkWell(
                      splashColor: AppColors.white.withOpacity(0.2),
                      highlightColor: AppColors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                      onTap: cameraController != null &&
                              cameraController.value.isInitialized &&
                              !cameraController.value.isRecordingVideo
                          ? () {
                              if (cameraLensDirection ==
                                  CameraLensDirection.front) {
                                cameraLensDirection = CameraLensDirection.back;
                                onNewCameraSelected(widget.cameras[1]);
                              } else {
                                cameraLensDirection = CameraLensDirection.front;
                                onNewCameraSelected(widget.cameras[0]);
                              }
                            }
                          : null,
                    ),
                  ),
                )
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.camera,
                  size: 30,
                  color: AppColors.white,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: AppColors.transparent,
                      borderRadius: BorderRadius.circular(30)),
                  child: Material(
                    color: AppColors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    child: InkWell(
                      splashColor: AppColors.white.withOpacity(0.2),
                      highlightColor: AppColors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                      onTap: cameraController != null &&
                              cameraController.value.isInitialized &&
                              !cameraController.value.isRecordingVideo
                          ? onTakePictureButtonPressed
                          : null,
                    ),
                  ),
                )
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  AppIcons.icGallery,
                  color: AppColors.white,
                  width: 30,
                  height: 30,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: AppColors.transparent,
                      borderRadius: BorderRadius.circular(30)),
                  child: Material(
                    color: AppColors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    child: InkWell(
                      splashColor: AppColors.white.withOpacity(0.2),
                      highlightColor: AppColors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                      onTap: cameraController != null &&
                              cameraController.value.isInitialized &&
                              !cameraController.value.isRecordingVideo
                          ? () async {
                              //cameraController.dispose();
                              final xFile = await pickImageFromGallery();
                              imageFile = xFile;
                              await Future.delayed(
                                const Duration(seconds: 0),
                                () => Navigator.of(context).pop(imageFile),
                              );
                            }
                          : null,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Material(
          color: AppColors.transparent,
          child: IconButton(
            icon: const Icon(Icons.videocam),
            color: AppColors.white,
            splashColor: AppColors.white.withOpacity(0.2),
            splashRadius: 20,
            onPressed: cameraController != null &&
                    cameraController.value.isInitialized &&
                    !cameraController.value.isRecordingVideo
                ? onVideoRecordButtonPressed
                : null,
          ),
        ),
        Material(
          color: AppColors.transparent,
          child: IconButton(
            icon: cameraController != null &&
                    cameraController.value.isRecordingPaused
                ? const Icon(Icons.play_arrow)
                : const Icon(Icons.pause),
            color: AppColors.white,
            splashColor: AppColors.white.withOpacity(0.2),
            splashRadius: 20,
            onPressed: cameraController != null &&
                    cameraController.value.isInitialized &&
                    cameraController.value.isRecordingVideo
                ? (cameraController.value.isRecordingPaused)
                    ? onResumeButtonPressed
                    : onPauseButtonPressed
                : null,
          ),
        ),
        Material(
          color: AppColors.transparent,
          child: IconButton(
            icon: const Icon(Icons.stop),
            color: Colors.red,
            splashColor: AppColors.white.withOpacity(0.2),
            splashRadius: 20,
            onPressed: cameraController != null &&
                    cameraController.value.isInitialized &&
                    cameraController.value.isRecordingVideo
                ? onStopButtonPressed
                : null,
          ),
        ),
        // IconButton(
        //   icon: const Icon(Icons.pause_presentation),
        //   color:
        //       cameraController != null && cameraController.value.isPreviewPaused
        //           ? Colors.red
        //           : AppColors.white,
        //   onPressed:
        //       cameraController == null ? null : onPausePreviewButtonPressed,
        // ),
      ],
    );
  }

  /// Display a row of toggle to select the camera (or a message if no camera is available).
  // Widget _cameraTogglesRowWidget(List<CameraDescription> cameras) {
  //   final List<Widget> toggles = <Widget>[];

  //   void onChanged(CameraDescription? description) {
  //     if (description == null) {
  //       return;
  //     }

  //     onNewCameraSelected(description);
  //   }

  //   if (cameras.isEmpty) {
  //     SchedulerBinding.instance.addPostFrameCallback((_) async {
  //       () {
  //         showDialog(
  //             context: context,
  //             builder: (context) => AppDialog(
  //                 content: 'No cameras available',
  //                 typeDialog: TypeDialog.error,
  //                 positiveAction: () {
  //                   Routes.backTo();
  //                 }));
  //       };
  //     });
  //     return const Text('None');
  //   } else {
  //     for (final CameraDescription cameraDescription in cameras) {
  //       toggles.add(
  //         SizedBox(
  //           width: 90.0,
  //           child: RadioListTile<CameraDescription>(
  //             title: Icon(getCameraLensIcon(cameraDescription.lensDirection)),
  //             groupValue: controller?.description,
  //             value: cameraDescription,
  //             onChanged:
  //                 controller != null && controller!.value.isRecordingVideo
  //                     ? null
  //                     : onChanged,
  //           ),
  //         ),
  //       );
  //     }
  //   }

  //   return Row(children: toggles);
  // }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  // void showInSnackBar(String message) {
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text(message)));
  // }

  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    if (controller == null) {
      return;
    }

    final CameraController cameraController = controller!;

    final Offset offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    cameraController.setExposurePoint(offset);
    cameraController.setFocusPoint(offset);
  }

  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    final CameraController? oldController = controller;
    if (oldController != null) {
      // `controller` needs to be set to null before getting disposed,
      // to avoid a race condition when we use the controller that is being
      // disposed. This happens when camera permission dialog shows up,
      // which triggers `didChangeAppLifecycleState`, which disposes and
      // re-creates the controller.
      controller = null;
      await oldController.dispose();
    }

    final CameraController cameraController = CameraController(
      cameraDescription,
      kIsWeb ? ResolutionPreset.max : ResolutionPreset.ultraHigh,
      enableAudio: enableAudio,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    controller = cameraController;

    // If the controller is updated then update the UI.
    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (cameraController.value.hasError) {
        showDialog(
            context: context,
            builder: (context) => AppDialog(
                content:
                    'Camera error ${cameraController.value.errorDescription}',
                typeDialog: TypeDialog.error,
                positiveAction: () {
                  Routes.backTo();
                }));
      }
    });

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      switch (e.code) {
        case 'CameraAccessDenied':
          showDialog(
              context: context,
              builder: (context) => AppDialog(
                  content: 'You have denied camera access.',
                  typeDialog: TypeDialog.warning,
                  positiveAction: () {
                    Routes.backTo();
                  }));
          break;
        case 'CameraAccessDeniedWithoutPrompt':
          // iOS only
          showDialog(
              context: context,
              builder: (context) => AppDialog(
                  content: 'Please go to Settings app to enable camera access.',
                  typeDialog: TypeDialog.warning,
                  positiveAction: () {
                    Routes.backTo();
                  }));
          break;
        case 'CameraAccessRestricted':
          // iOS only
          showDialog(
              context: context,
              builder: (context) => AppDialog(
                  content: 'Camera access is restricted.',
                  typeDialog: TypeDialog.warning,
                  positiveAction: () {
                    Routes.backTo();
                  }));

          break;
        case 'AudioAccessDenied':
          showDialog(
              context: context,
              builder: (context) => AppDialog(
                  content: 'You have denied audio access.',
                  typeDialog: TypeDialog.warning,
                  positiveAction: () {
                    Routes.backTo();
                  }));
          break;
        case 'AudioAccessDeniedWithoutPrompt':
          // iOS only
          showDialog(
              context: context,
              builder: (context) => AppDialog(
                  content: 'Please go to Settings app to enable audio access.',
                  typeDialog: TypeDialog.warning,
                  positiveAction: () {
                    Routes.backTo();
                  }));
          break;
        case 'AudioAccessRestricted':
          showDialog(
              context: context,
              builder: (context) => AppDialog(
                  content: 'Audio access is restricted.',
                  typeDialog: TypeDialog.warning,
                  positiveAction: () {
                    Routes.backTo();
                  }));
          break;
        default:
          _showCameraException(e);
          break;
      }
    }

    if (mounted) {
      setState(() {});
    }
  }

  void onTakePictureButtonPressed() {
    takePicture().then((XFile? file) async {
      if (mounted) {
        imageFile = file;
        videoController?.dispose();
        videoController = null;
        if (imageFile != null) {
          debugPrint('Taske image not null');
          imageFile = await cropImage(imageFile);
          await Future.delayed(
            const Duration(seconds: 0),
            () => Navigator.of(context).pop(imageFile),
          );
        }
        setState(() {});
        // if (file != null) {
        //   showInSnackBar('Picture saved to ${file.path}');
        // }
      }
    });
  }

  Future<XFile?> pickImageFromGallery() async {
    final xFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    return cropImage(xFile);
  }

  Future<XFile?> pickVideo() async {
    return await _imagePicker.pickVideo(source: ImageSource.gallery);
  }

  Future<XFile?> cropImage(XFile? xFile) async {
    if (xFile != null) {
      final fileCropped = await ImageCropper().cropImage(
          sourcePath: xFile.path,
          compressQuality: 100,
          compressFormat: ImageCompressFormat.jpg,
          cropStyle: CropStyle.rectangle);
      return fileCropped != null ? XFile(fileCropped.path) : null;
    }
    return null;
  }

  void onFlashModeButtonPressed() {
    if (_flashModeControlRowAnimationController.value == 1) {
      _flashModeControlRowAnimationController.reverse();
    } else {
      _flashModeControlRowAnimationController.forward();
      _exposureModeControlRowAnimationController.reverse();
      _focusModeControlRowAnimationController.reverse();
    }
  }

  void onFocusModeButtonPressed() {
    if (_focusModeControlRowAnimationController.value == 1) {
      _focusModeControlRowAnimationController.reverse();
    } else {
      _focusModeControlRowAnimationController.forward();
      _flashModeControlRowAnimationController.reverse();
      _exposureModeControlRowAnimationController.reverse();
    }
  }

  void onAudioModeButtonPressed() {
    enableAudio = !enableAudio;
    if (controller != null) {
      onNewCameraSelected(controller!.description);
    }
  }

  void onSetFlashModeButtonPressed(FlashMode mode) {
    setFlashMode(mode).then((_) {
      if (mounted) {
        onFlashModeButtonPressed();
        setState(() {});
      }
      //showInSnackBar('Flash mode set to ${mode.toString().split('.').last}');
    });
  }

  void onSetExposureModeButtonPressed(ExposureMode mode) {
    setExposureMode(mode).then((_) {
      if (mounted) {
        setState(() {});
      }
      //showInSnackBar('Exposure mode set to ${mode.toString().split('.').last}');
    });
  }

  void onSetFocusModeButtonPressed(FocusMode mode) {
    setFocusMode(mode).then((_) {
      if (mounted) {
        setState(() {});
      }
      //showInSnackBar('Focus mode set to ${mode.toString().split('.').last}');
    });
  }

  void onVideoRecordButtonPressed() {
    startVideoRecording().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  void onStopButtonPressed() {
    stopVideoRecording().then((XFile? file) {
      if (mounted) {
        setState(() {});
      }
      if (file != null) {
        //showInSnackBar('Video recorded to ${file.path}');
        videoFile = file;
        Navigator.of(context).pop(videoFile);
      }
    });
  }

  Future<void> onPausePreviewButtonPressed() async {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      //showInSnackBar('Error: select a camera first.');
      return;
    }

    if (cameraController.value.isPreviewPaused) {
      await cameraController.resumePreview();
    } else {
      await cameraController.pausePreview();
    }

    if (mounted) {
      setState(() {});
    }
  }

  void onPauseButtonPressed() {
    pauseVideoRecording().then((_) {
      if (mounted) {
        setState(() {});
      }
      //showInSnackBar('Video recording paused');
    });
  }

  void onResumeButtonPressed() {
    resumeVideoRecording().then((_) {
      if (mounted) {
        setState(() {});
      }
      //showInSnackBar('Video recording resumed');
    });
  }

  Future<void> startVideoRecording() async {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      //showInSnackBar('Error: select a camera first.');
      return;
    }

    if (cameraController.value.isRecordingVideo) {
      // A recording is already started, do nothing.
      return;
    }

    try {
      await cameraController.startVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return;
    }
  }

  Future<XFile?> stopVideoRecording() async {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return null;
    }

    try {
      return cameraController.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  Future<void> pauseVideoRecording() async {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return;
    }

    try {
      await cameraController.pauseVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future<void> resumeVideoRecording() async {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return;
    }

    try {
      await cameraController.resumeVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future<void> setFlashMode(FlashMode mode) async {
    if (controller == null) {
      return;
    }

    try {
      await controller!.setFlashMode(mode);
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future<void> setExposureMode(ExposureMode mode) async {
    if (controller == null) {
      return;
    }

    try {
      await controller!.setExposureMode(mode);
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future<void> setExposureOffset(double offset) async {
    if (controller == null) {
      return;
    }

    setState(() {
      _currentExposureOffset = offset;
    });
    try {
      offset = await controller!.setExposureOffset(offset);
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future<void> setFocusMode(FocusMode mode) async {
    if (controller == null) {
      return;
    }

    try {
      await controller!.setFocusMode(mode);
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future<void> _startVideoPlayer() async {
    if (videoFile == null) {
      return;
    }

    final VideoPlayerController vController = kIsWeb
        ? VideoPlayerController.network(videoFile!.path)
        : VideoPlayerController.file(File(videoFile!.path));

    videoPlayerListener = () {
      if (videoController != null) {
        // Refreshing the state to update video player with the correct ratio.
        if (mounted) {
          setState(() {});
        }
        videoController!.removeListener(videoPlayerListener!);
      }
    };
    vController.addListener(videoPlayerListener!);
    await vController.setLooping(true);
    await vController.initialize();
    await videoController?.dispose();
    if (mounted) {
      setState(() {
        imageFile = null;
        videoController = vController;
      });
    }
    await vController.play();
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      //showInSnackBar('Error: select a camera first.');
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    _logError(e.code, e.description);
    showDialog(
        context: context,
        builder: (context) => AppDialog(
            content: 'Error: ${e.code}\n${e.description}',
            typeDialog: TypeDialog.error,
            positiveAction: () {
              Routes.backTo();
            }));
  }
}
