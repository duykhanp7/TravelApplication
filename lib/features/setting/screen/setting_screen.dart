import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/features/setting/model/setting_menu_item.dart';
import 'package:travel_booking_tour/res/app_switch.dart';
import 'package:travel_booking_tour/res/button.dart';
import 'package:travel_booking_tour/res/res.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../router/routes.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SettingScreen();
  }
}

class _SettingScreen extends State<SettingScreen> {
  late List<SettingMenuItem> menus;

  @override
  void initState() {
    menus = const [
      SettingMenuItem(
          leadingIcon: AppIcons.icNotificationSetting, name: 'Notifications'),
      SettingMenuItem(
          leadingIcon: AppIcons.icLanguage,
          name: 'Languages',
          endIcon: AppIcons.icArrowNext),
      SettingMenuItem(
          leadingIcon: AppIcons.icPayment,
          name: 'Payment',
          endIcon: AppIcons.icArrowNext),
      SettingMenuItem(
          leadingIcon: AppIcons.icPolicy,
          name: 'Privacy & Policies',
          endIcon: AppIcons.icArrowNext),
      SettingMenuItem(
          leadingIcon: AppIcons.icFeedBack,
          name: 'Feedback',
          endIcon: AppIcons.icArrowNext),
      SettingMenuItem(
          leadingIcon: AppIcons.icUsage,
          name: 'Usage',
          endIcon: AppIcons.icArrowNext),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarApp(
        title: 'Settings',
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: Column(
            children: [
              _buildHeaderSettings(),
              const SizedBox(height: 20),
              _buildBodySettings()
            ],
          ),
        ),
      )),
    );
  }

  Widget _buildBodySettings() {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Material(
              color: AppColors.transparent,
              child: InkWell(
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 16),
                  height: 55,
                  child: Row(
                    children: [
                      SvgPicture.asset(menus[index].leadingIcon!),
                      const SizedBox(width: 18),
                      Text(menus[index].name!,
                          style: AppStyles.titleMedium
                              .copyWith(fontWeight: FontWeight.w400)),
                      const Spacer(),
                      menus[index].endIcon == null
                          ? SizedBox(
                              width: 50,
                              height: 26,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: AppSwitch(
                                  state: true,
                                  onClick: (value) {
                                    debugPrint(
                                        'App Switch State Change : $value');
                                  },
                                ),
                              ),
                            )
                          : SvgPicture.asset(menus[index].endIcon!)
                    ],
                  ),
                ),
                onTap: () {},
              ),
            ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        separatorBuilder: (context, index) => const Divider(
              height: 1,
              color: AppColors.textHintColor,
            ),
        itemCount: menus.length);
  }

  Widget _buildHeaderSettings() {
    return Container(
      height: 95,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
                alignment: Alignment.center,
                width: 60,
                height: 60,
                child: Image.asset(AppImages.emmy)),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Yoo Jin',
                  style: AppStyles.headlineLarge.copyWith(
                      fontWeight: FontWeight.w100,
                      fontStyle: FontStyle.italic,
                      color: AppColors.white)),
              const SizedBox(height: 2),
              Text('Traveler',
                  style: AppStyles.titleSmall.copyWith(color: AppColors.white)),
            ],
          ),
          const Spacer(),
          PrimaryInactiveButton(
            text: 'Edit Profile',
            allCaps: true,
            margin: EdgeInsets.zero,
            width: 110,
            borderRadius: BorderRadius.circular(6),
            color: AppColors.primary,
            borderColor: AppColors.white,
            textStyle: AppStyles.titleSmall.copyWith(color: AppColors.white),
            height: 40,
            onTap: () => Routes.navigateTo(AppPath.editingProfile, {}),
          )
        ],
      ),
    );
  }
}
