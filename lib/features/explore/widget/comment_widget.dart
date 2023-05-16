import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_booking_tour/common/extension/extenstion.dart';
import 'package:travel_booking_tour/data/dio/api_client.dart';
import 'package:travel_booking_tour/data/model/news_json.dart';
import 'package:travel_booking_tour/features/explore/widget/comment_item.dart';
import 'package:travel_booking_tour/res/app_inkwell.dart';
import 'package:travel_booking_tour/res/icons.dart';

import '../../../res/colors.dart';
import '../../../res/styles.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({super.key, required this.id});

  final int? id;

  @override
  State<StatefulWidget> createState() {
    return _CommentWidget();
  }
}

class _CommentWidget extends State<CommentWidget> {
  NewsJson? newsJson;
  bool isOpen = true;
  bool isClick = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getListComments(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            newsJson = snapshot.data;
          }
        } else if (snapshot.connectionState == ConnectionState.waiting &&
            !isClick) {
          return Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
                color: AppColors.brown,
                borderRadius: BorderRadius.circular(10)),
          );
        }
        return Column(
          children: [
            Row(children: [
              Text(
                  'Comments (${newsJson?.attributes?.comments?.data?.length ?? 0})',
                  style: AppStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: AppColors.black),
                  textAlign: TextAlign.start),
              const Spacer(),
              AppInkWell(
                  background: AppColors.transparent,
                  voidCallBack: () {
                    setState(() {
                      isClick = true;
                      isOpen = !isOpen;
                    });
                  },
                  iconTint: AppColors.primary,
                  iconSize: const Size(20, 20),
                  icon: isOpen ? AppIcons.icDropUp : AppIcons.icDropDown)
            ]),
            21.gapHeight,
            AnimatedSize(
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
              child: SizedBox(
                height: isOpen
                    ? (newsJson?.attributes?.comments?.data?.length ?? 0) * 130
                    : 0,
                child: Column(
                  children: List.generate(
                      newsJson?.attributes?.comments?.data?.length ?? 0,
                      (index) => CommentItem(
                          commentJson:
                              newsJson?.attributes?.comments?.data?[index])),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Future<NewsJson?> getListComments(int? id) async {
    ApiService apiService = ApiService();
    return await apiService.getJson(
      endPoint: '/api/blogs/$id',
      queryParams: {
        'populate[0]': 'comments',
        'populate[1]': 'comments.user',
        'populate[2]': 'comments.user.avatar'
      },
      converter: (data) {
        return NewsJson.fromJson(data['data']);
      },
    );
  }
}
