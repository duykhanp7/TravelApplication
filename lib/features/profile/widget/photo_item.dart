import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';

import '../../../res/app_layout_shimmer.dart';

class PhotoItem extends StatefulWidget {
  const PhotoItem(
      {super.key,
      required this.url,
      required this.selected,
      this.enable,
      required this.onClick,
      this.isHttps,
      this.onLongClick});

  final String url;
  final bool selected;
  final bool? enable;
  final bool? isHttps;
  final Function(String, bool) onClick;
  final Function()? onLongClick;

  @override
  State<StatefulWidget> createState() {
    return _PhotoItem();
  }
}

class _PhotoItem extends State<PhotoItem> {
  bool selected = false;

  @override
  void initState() {
    selected = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.transparent,
      child: Stack(
        children: [
          Container(
            color: AppColors.transparent,
            width: double.infinity,
            height: double.infinity,
            child: (widget.isHttps == null || !widget.isHttps!)
                ? Image.file(
                    File(widget.url),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  )
                : CachedNetworkImage(
                    imageUrl: widget.url,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    height: 150,
                    fadeInCurve: Curves.linearToEaseOut,
                    fadeOutCurve: Curves.bounceInOut,
                    errorWidget: (context, url, error) =>
                        SvgPicture.asset(AppIcons.icErrorImage),
                    placeholder: (context, url) => const AppLayoutShimmer(),
                  ),
          ),
          Material(
            color: AppColors.transparent,
            child: InkWell(
              splashColor: AppColors.black.withOpacity(0.2),
              highlightColor: AppColors.black.withOpacity(0.2),
              onTap: () {
                if (widget.enable ?? false) {
                  setState(() {
                    selected = !selected;
                    widget.onClick(widget.url, selected);
                  });
                }
              },
              onLongPress: widget.onLongClick,
              child: Container(
                color: AppColors.transparent,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Visibility(
              visible: widget.enable ?? false,
              child: Positioned(
                  top: 10,
                  right: 10,
                  child: selected
                      ? SvgPicture.asset(AppIcons.icCheckWhite,
                          width: 26, height: 26)
                      : SvgPicture.asset(AppIcons.icUnCheckWhite,
                          width: 26, height: 26)))
        ],
      ),
    );
  }
}
