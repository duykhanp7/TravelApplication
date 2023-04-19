import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/features/auth/change_password/bloc/bloc_change_password_event.dart';
import 'package:travel_booking_tour/features/auth/change_password/bloc/bloc_change_password_state.dart';
import 'package:travel_booking_tour/res/app_appbar.dart';
import 'package:travel_booking_tour/res/button.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../res/app_dialog.dart';
import '../../../res/colors.dart';
import '../../../res/input_field.dart';
import '../../../res/styles.dart';
import '../../../res/system.dart';
import '../../../router/routes.dart';
import 'bloc/bloc_change_password_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChangePasswordScreen();
  }
}

class _ChangePasswordScreen extends State<ChangePasswordScreen> {
  PasswordMode mode = PasswordMode.change;
  late FToast fToast;
  late BlocChangePasswordScreen _blocChangePasswordScreen;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemLightStatusBar);
    fToast = FToast();
    fToast.init(context);
    _blocChangePasswordScreen =
        BlocProvider.of<BlocChangePasswordScreen>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mode = (ModalRoute.of(context)?.settings.arguments as Map)[AppConstant.data]
        as PasswordMode;

    _blocChangePasswordScreen.setModePassword(mode);

    return WillPopScope(
      onWillPop: () async {
        _blocChangePasswordScreen.currentPasswordController.text = '';
        return true;
      },
      child: BlocListener<BlocChangePasswordScreen, BlocChangePasswordState>(
        listenWhen: (previous, current) =>
            current is BlocChangePasswordStateTokenResetPasswordInvalid,
        listener: (context, state) {
          showDialog(
            context: context,
            builder: (context) => AppDialog(
              typeDialog: TypeDialog.info,
              content:
                  'The reset password token is expired, try to resend email',
              negativeTitle: 'Dismiss',
              positiveTitle: 'OK',
              positiveAction: () {
                Routes.backTo();
                Routes.navigateToAndRemoveUntil(AppPath.forgotPassword, {});
              },
            ),
          );
        },
        child: Scaffold(
          appBar: const AppbarApp(title: 'Change Password'),
          backgroundColor: AppColors.white,
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(33, 41, 33, 41),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _blocChangePasswordScreen.formKeyChangePassword,
          child: Column(
            children: [
              mode == PasswordMode.change
                  ? Container(
                      alignment: Alignment.centerLeft,
                      child: AppTextField(
                          hintText: '*********',
                          textEditingController: _blocChangePasswordScreen
                              .currentPasswordController,
                          obsecureText: true,
                          labelText: "Current Password",
                          validator: _blocChangePasswordScreen
                              .validateTextFieldCurrentPasword,
                          onChange: (value) => _blocChangePasswordScreen.add(
                              BlocChangePasswordEventChangeCurrentPassword(
                                  currentPassword: value))),
                    )
                  : Container(),
              mode == PasswordMode.change
                  ? const SizedBox(height: 30)
                  : Container(),
              Container(
                alignment: Alignment.centerLeft,
                child: AppTextField(
                    hintText: '*********',
                    obsecureText: true,
                    labelText: "New Password",
                    validator:
                        _blocChangePasswordScreen.validateTextFieldNewPasword,
                    onChange: (value) => _blocChangePasswordScreen.add(
                        BlocChangePasswordEventChangeNewPassword(
                            newPassword: value))),
              ),
              const SizedBox(height: 30),
              Container(
                alignment: Alignment.centerLeft,
                child: AppTextField(
                    hintText: '*********',
                    obsecureText: true,
                    labelText: "Retype New Password",
                    validator:
                        _blocChangePasswordScreen.validateTextFieldRePasword,
                    onChange: (value) => _blocChangePasswordScreen.add(
                        BlocChangePasswordEventChangeRetypeNewPassword(
                            retypePassword: value))),
              ),
              const SizedBox(height: 30),
              BlocBuilder<BlocChangePasswordScreen, BlocChangePasswordState>(
                builder: (context, state) {
                  bool isLoading = false;
                  if (state is BlocChangePasswordStateResult) {
                    if (state.appResult.state == ResultState.loading) {
                      isLoading = true;
                    } else if (state.appResult.state == ResultState.success ||
                        state.appResult.state == ResultState.fail) {
                      isLoading = false;
                    }
                  }
                  return PrimaryActiveButton(
                    text: 'Save',
                    allCaps: false,
                    isLoading: isLoading,
                    margin: EdgeInsets.zero,
                    textStyle:
                        AppStyles.titleMedium.copyWith(color: AppColors.white),
                    onTap: () => _blocChangePasswordScreen
                        .add(BlocChangePasswordEventClickButtonSave()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
