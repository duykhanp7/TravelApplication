import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/extension/extenstion.dart';
import 'package:travel_booking_tour/data/model/comment_json.dart';
import 'package:travel_booking_tour/res/res.dart';

class CommentItem extends StatefulWidget {
  const CommentItem({super.key, required this.commentJson});

  final CommentJson? commentJson;

  @override
  State<StatefulWidget> createState() {
    return _CommentItem();
  }
}

class _CommentItem extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _buildWidgetInfo(),
      10.gapHeight,
      Text(widget.commentJson?.attributes?.content ?? '',
          style: AppStyles.titleMedium.copyWith(
              color: AppColors.inActiveRadioBorderColor,
              fontSize: 15,
              fontWeight: FontWeight.w400)),
      10.gapHeight,
      _buildWidgetReply()
    ]);
  }

  Widget _buildWidgetInfo() {
    return Row(
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: CircleAvatar(
              backgroundImage: NetworkImage(
                  widget.commentJson?.attributes?.user['data']['attributes']
                      ['avatar']['data']['attributes']['url'])),
        ),
        10.gapWidth,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                widget.commentJson?.attributes?.user['data']['attributes']
                        ['lastName'] +
                    ' ' +
                    widget.commentJson?.attributes?.user['data']['attributes']
                        ['firstName'],
                style: AppStyles.titleMedium
                    .copyWith(color: AppColors.inActiveRadioBorderColor)),
            2.gapHeight,
            Text(
                widget.commentJson?.attributes?.createdAt?.toyMMMdFormat() ??
                    DateTime.now().toyMMMdFormat(),
                style: AppStyles.titleMedium.copyWith(
                    color: AppColors.textHintColor,
                    fontWeight: FontWeight.w400))
          ],
        )
      ],
    );
  }

  Widget _buildWidgetReply() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.messageNone,
              color: AppColors.primary,
            ),
            10.gapWidth,
            Text(
              'Reply',
              style: AppStyles.titleSmall.copyWith(color: AppColors.primary),
            )
          ],
        ),
        10.gapHeight,
        const Divider(height: 1, color: AppColors.bgBLlur)
      ],
    );
  }
}
