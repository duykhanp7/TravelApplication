
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:travel_booking_tour/features/profile/model/photo_json.dart';
import 'package:travel_booking_tour/res/app_inkwell.dart';
import 'package:travel_booking_tour/res/res.dart';

import '../router/routes.dart';

class AppPhotoView extends StatefulWidget {
  const AppPhotoView({super.key, required this.photoJson});

  final PhotoJson? photoJson;
  @override
  State<StatefulWidget> createState() {
    return _AppPhotoView();
  }
}

class _AppPhotoView extends State<AppPhotoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: AppColors.black,
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        color: AppColors.black,
                        height: kToolbarHeight + (kToolbarHeight),
                        child: AppInkWell(
                            voidCallBack: () => Routes.backTo(),
                            icon: AppIcons.icBack,
                            size: const Size(30, 30)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                          widget.photoJson?.name?.substring(0,
                                  widget.photoJson?.name?.lastIndexOf('.')) ??
                              '',
                          style: AppStyles.titleMedium
                              .copyWith(color: AppColors.white)),
                    )
                  ],
                ),
                Expanded(
                  child: PhotoView(
                    basePosition: Alignment.topCenter,
                    imageProvider: NetworkImage(widget.photoJson?.url ??
                        widget.photoJson?.uploadUrl ??
                        ''),
                    filterQuality: FilterQuality.high,
                    loadingBuilder: (context, event) =>
                        const AppLayoutShimmer(),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
