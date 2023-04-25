import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/features/profile/bloc/profile/bloc_profile_screen.dart';
import 'package:travel_booking_tour/features/profile/bloc/profile/bloc_profile_state.dart';
import 'package:travel_booking_tour/features/profile/model/user_info.dart';
import 'package:travel_booking_tour/res/app_switch.dart';
import 'package:travel_booking_tour/res/button.dart';
import 'package:travel_booking_tour/res/res.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../router/routes.dart';
import '../bloc/setting/bloc_setting_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SettingScreen();
  }
}

class _SettingScreen extends State<SettingScreen> {
  late BlocSettingScreen _blocSettingScreen;

  @override
  void initState() {
    _blocSettingScreen = BlocProvider.of<BlocSettingScreen>(context);

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
                      SvgPicture.asset(
                          _blocSettingScreen.menus[index].leadingIcon!),
                      const SizedBox(width: 18),
                      Text(_blocSettingScreen.menus[index].name!,
                          style: AppStyles.titleMedium
                              .copyWith(fontWeight: FontWeight.w400)),
                      const Spacer(),
                      _blocSettingScreen.menus[index].endIcon == null
                          ? SizedBox(
                              width: 50,
                              height: 26,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: AppSwitch(
                                  state: true,
                                  onClick: (value) {},
                                ),
                              ),
                            )
                          : SvgPicture.asset(
                              _blocSettingScreen.menus[index].endIcon!)
                    ],
                  ),
                ),
                onTap: () => _blocSettingScreen
                    .mapItemMenuAction(_blocSettingScreen.menus[index].id),
              ),
            ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        separatorBuilder: (context, index) => const Divider(
              height: 1,
              color: AppColors.textHintColor,
            ),
        itemCount: _blocSettingScreen.menus.length);
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
          BlocBuilder<BlocProfileScreen, BlocProfileState>(
            buildWhen: (previous, current) =>
                current is BlocProfileStateLoadUserInforResult,
            builder: (context, state) {
              UserInfoJson? userInfoJson;
              if (state is BlocProfileStateLoadUserInforResult) {
                if (state.appResult.state == ResultState.success) {
                  userInfoJson = state.appResult.result as UserInfoJson?;
                }
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                        '${userInfoJson?.lastName ?? ''} ${userInfoJson?.firstName ?? ''}',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: AppStyles.headlineLarge.copyWith(
                            fontWeight: FontWeight.w100,
                            fontStyle: FontStyle.italic,
                            color: AppColors.white)),
                  ),
                  const SizedBox(height: 2),
                  Text(
                      userInfoJson == null
                          ? ''
                          : userInfoJson.type == UserType.traverler
                              ? 'Traverler'
                              : 'Guide',
                      style: AppStyles.titleSmall
                          .copyWith(color: AppColors.white)),
                ],
              );
            },
          ),
          const Spacer(),
          PrimaryInactiveButton(
            text: 'Edit',
            allCaps: false,
            margin: EdgeInsets.zero,
            width: 90,
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
