import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/features/auth/change_password/bloc/bloc_change_password_event.dart';
import 'package:travel_booking_tour/features/auth/change_password/bloc/bloc_change_password_state.dart';
import 'package:travel_booking_tour/res/app_appbar.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../res/app_dialog.dart';
import '../../../res/colors.dart';
import '../../../res/input_field.dart';
import '../../../res/styles.dart';
import '../../../res/system.dart';
import '../../../res/validator.dart';
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
  Password mode = Password.change;
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
        as Password;

    return BlocListener<BlocChangePasswordScreen, BlocChangePasswordState>(
      listenWhen: (previous, current) =>
          current is BlocChangePasswordStateTokenResetPasswordInvalid,
      listener: (context, state) {
        showDialog(
          context: context,
          builder: (context) => AppDialog(
            typeDialog: TypeDialog.info,
            content: 'The reset password token is expired, try to resend email',
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
        appBar: AppbarApp(
            title: 'Change Password',
            suffixWidget: Container(
              alignment: Alignment.center,
              width: 42,
              height: 20,
              margin: const EdgeInsets.only(right: 16),
              child: InkWell(
                child: Text(
                  'SAVE',
                  style: AppStyles.titleMedium.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary),
                ),
                onTap: () => _blocChangePasswordScreen
                    .add(BlocChangePasswordEventClickButtonSave()),
              ),
            )),
        backgroundColor: AppColors.white,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(33, 41, 33, 41),
      child: Column(
        children: [
          mode == Password.change
              ? Container(
                  alignment: Alignment.centerLeft,
                  child: AppTextField(
                      hintText: '*********',
                      obsecureText: true,
                      labelText: "Current Password",
                      validator: AppValidator.validateTextFieldPasword,
                      onChange: (value) {}),
                )
              : Container(),
          mode == Password.change ? const SizedBox(height: 30) : Container(),
          Container(
            alignment: Alignment.centerLeft,
            child: AppTextField(
                hintText: '*********',
                obsecureText: true,
                labelText: "New Password",
                validator: AppValidator.validateTextFieldPasword,
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
                validator: AppValidator.validateTextFieldPasword,
                onChange: (value) => _blocChangePasswordScreen.add(
                    BlocChangePasswordEventChangeRetypeNewPassword(
                        retypePassword: value))),
          ),
        ],
      ),
    ));
  }
}
