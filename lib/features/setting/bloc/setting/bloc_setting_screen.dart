import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/services.dart';
import 'package:travel_booking_tour/data/local/app_storage.dart';

import '../../../../common/app_constant.dart';
import '../../../../common/enum/enums.dart';
import '../../../../res/icons.dart';
import '../../../../res/system.dart';
import '../../../../router/path.dart';
import '../../../../router/routes.dart';
import '../../model/setting_menu_item.dart';
import 'bloc_setting_event.dart';
import 'bloc_setting_state.dart';

class BlocSettingScreen extends Bloc<BlocSettingEvent, BlocSettingState> {
  BlocSettingScreen() : super(BlocSettingStateInitial()) {
    on<BlocSettingEvent>(mapStateToEvent, transformer: restartable());
  }

  void mapStateToEvent(
      BlocSettingEvent event, Emitter<BlocSettingState> emit) async {}

  void mapItemMenuAction(MenuItemID id) {
    switch (id) {
      case MenuItemID.notification:
        break;
      case MenuItemID.languages:
        break;
      case MenuItemID.payment:
        break;
      case MenuItemID.privacyAndPolicies:
        break;
      case MenuItemID.feedback:
        break;
      case MenuItemID.usage:
        break;
      case MenuItemID.logout:
        SystemChrome.setSystemUIOverlayStyle(AppSystem.systemStyle);
        AppStorage appStorage = AppStorage();
        appStorage.delete(AppConstant.user);
        appStorage.delete(AppConstant.password);
        appStorage.delete(AppConstant.token);
        Routes.navigateToAndRemoveUntil(AppPath.signInScreen, {});
        break;
      default:
    }
  }

  List<SettingMenuItem> menus = const [
    SettingMenuItem(
        id: MenuItemID.notification,
        leadingIcon: AppIcons.icNotificationSetting,
        name: 'Notifications'),
    SettingMenuItem(
        id: MenuItemID.languages,
        leadingIcon: AppIcons.icLanguage,
        name: 'Languages',
        endIcon: AppIcons.icArrowNext),
    SettingMenuItem(
        id: MenuItemID.payment,
        leadingIcon: AppIcons.icPayment,
        name: 'Payment',
        endIcon: AppIcons.icArrowNext),
    SettingMenuItem(
        id: MenuItemID.privacyAndPolicies,
        leadingIcon: AppIcons.icPolicy,
        name: 'Privacy & Policies',
        endIcon: AppIcons.icArrowNext),
    SettingMenuItem(
        id: MenuItemID.feedback,
        leadingIcon: AppIcons.icFeedBack,
        name: 'Feedback',
        endIcon: AppIcons.icArrowNext),
    SettingMenuItem(
        id: MenuItemID.usage,
        leadingIcon: AppIcons.icUsage,
        name: 'Usage',
        endIcon: AppIcons.icArrowNext),
    SettingMenuItem(
        id: MenuItemID.logout,
        leadingIcon: AppIcons.icLogOut,
        name: 'Log out',
        endIcon: AppIcons.icArrowNext),
  ];
}
