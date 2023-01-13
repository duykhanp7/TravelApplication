import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/res/button/button.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';
import 'package:travel_booking_tour/res/images.dart';
import 'package:travel_booking_tour/res/res.dart';
import 'package:travel_booking_tour/res/star/vertical_star_widget.dart';

import '../../../res/system.dart';

class GuideDescriptionScreen extends StatefulWidget {
  const GuideDescriptionScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GuideDescriptionScreen();
  }
}

class _GuideDescriptionScreen extends State<GuideDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemTransparentStatusBar);
    return Scaffold(
      body: Container(
        color: AppColors.white,
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            _buildBody(context),
            _buildHeader(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      height: 200,
      color: AppColors.transparent,
      child: Stack(children: [
        Container(
          alignment: Alignment.topCenter,
          child: Image.asset(
            AppImages.winterPicture,
            fit: BoxFit.cover,
            width: width,
          ),
        ),
        Positioned(
            left: 5,
            top: 50,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  color: AppColors.transparent,
                  child: SvgPicture.asset(
                    AppIcons.icBack,
                    width: 20,
                    height: 20,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.transparent),
                  child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.transparent,
                      child: InkWell(
                        highlightColor: AppColors.white.withOpacity(0.1),
                        splashColor: AppColors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: AppColors.transparent,
                        ),
                        onTap: () {},
                      )),
                )
              ],
            )),
        Positioned(
            bottom: 0,
            left: 16,
            child: Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(AppImages.tuanTran),
                    ),
                  )
                ],
              ),
            ))
      ]),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 200),
        alignment: Alignment.topCenter,
        child: Column(
          children: [_buildBodyInformation()],
        ),
      ),
    );
  }

  Widget _buildBodyInformation() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Flexible(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Tuan Tran',
                            style: context.textStyle.titleLarge?.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.w100,
                                color: AppColors.blackDefault,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const VerticalStarWidget(rating: 5),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '127 reviews',
                              style: context.textStyle.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.inActiveRadioBorderColor),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              Flexible(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: PrimaryButton(
                      text: 'Choose This Guide',
                      onTap: () {},
                      allCaps: true,
                      height: 50,
                      width: 160,
                      margin: const EdgeInsets.only(left: 8, right: 0),
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const AppListChipWidget(
              chips: <String>['Vietnamese', 'English', 'Korean']),
          const SizedBox(
            height: 8,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                SvgPicture.asset(
                  AppIcons.locationGreen,
                  width: 14,
                  height: 18,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  'Da Nang, Viet Nam',
                  style: context.textStyle.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.primary),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
          Text(
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
          Text(
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
          Text(
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
          Text(
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
          Text(
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
          Text(
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
          Text(
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
          Text(
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
          Text(
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
          Text(
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
          Text(
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
          Text(
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
          Text(
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
          Text(
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
          Text(
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
          Text(
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
          Text(
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
        ],
      ),
    );
  }
}
