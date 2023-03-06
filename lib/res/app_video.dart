import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_viewer/video_viewer.dart';

import 'colors.dart';
import 'icons.dart';

class AppVideo extends StatefulWidget {
  const AppVideo(
      {super.key, required this.source, required this.videoViewerController});
  final Map<String, VideoSource> source;
  final VideoViewerController videoViewerController;
  @override
  State<StatefulWidget> createState() {
    return _AppVideo();
  }
}

class _AppVideo extends State<AppVideo> {
  @override
  Widget build(BuildContext context) {
    if (widget.source.isNotEmpty) {
      return Container(
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: VideoViewer(
              style: VideoViewerStyle(
                loading: Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  child: SvgPicture.asset(AppIcons.icPause),
                ),
                thumbnail: Container(
                  alignment: Alignment.center,
                  color: AppColors.transparent,
                  child: Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(30)),
                    child: SvgPicture.asset(
                      AppIcons.icPause,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                progressBarStyle: ProgressBarStyle(
                    bar: BarStyle.forward(
                        background: AppColors.white,
                        color: AppColors.primary,
                        identifier: AppColors.white)),
                playAndPauseStyle: PlayAndPauseWidgetStyle(
                    background: AppColors.transparent,
                    circleRadius: 50,
                    play: const Icon(
                      Icons.play_arrow,
                      color: AppColors.primary,
                      size: 30,
                    ),
                    pause: const Icon(
                      Icons.pause,
                      color: AppColors.primary,
                      size: 30,
                    )),
              ),
              enableFullscreenScale: false,
              onFullscreenFixLandscape: false,
              defaultAspectRatio: 3 / 2,
              rewindAmount: 5,
              forwardAmount: 5,
              language: VideoViewerLanguage.en,
              enableShowReplayIconAtVideoEnd: true,
              source: widget.source),
        ),
      );
    }
    return Container(
      width: 350,
      height: 200,
      color: AppColors.primary,
    );
  }
}
