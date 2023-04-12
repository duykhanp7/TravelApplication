import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';

class PhotoItem extends StatefulWidget {
  const PhotoItem({super.key, required this.file, required this.selected});

  final File file;
  final bool selected;

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
            child: Image.file(
              widget.file,
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ),
          Material(
            color: AppColors.transparent,
            child: InkWell(
              splashColor: AppColors.black.withOpacity(0.2),
              highlightColor: AppColors.black.withOpacity(0.2),
              onTap: () => setState(() {
                selected = !selected;
              }),
              child: Container(
                color: AppColors.transparent,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Positioned(
              top: 10,
              right: 10,
              child: selected
                  ? SvgPicture.asset(AppIcons.icCheckWhite,
                      width: 26, height: 26)
                  : SvgPicture.asset(AppIcons.icUnCheckWhite,
                      width: 26, height: 26))
        ],
      ),
    );
  }
}
