import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/res/app_appbar.dart';

import '../../../res/colors.dart';
import '../../../res/input_field.dart';
import '../../../res/styles.dart';
import '../../../res/system.dart';
import '../../../res/validator.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChangePasswordScreen();
  }
}

class _ChangePasswordScreen extends State<ChangePasswordScreen> {
  Password mode = Password.change;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemLightStatusBar);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mode = (ModalRoute.of(context)?.settings.arguments as Map)[AppConstant.data]
        as Password;

    return Scaffold(
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
              onTap: () {},
            ),
          )),
      backgroundColor: AppColors.white,
      body: _buildBody(),
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
                onChange: (value) {}),
          ),
          const SizedBox(height: 30),
          Container(
            alignment: Alignment.centerLeft,
            child: AppTextField(
                hintText: '*********',
                obsecureText: true,
                labelText: "Retype New Password",
                validator: AppValidator.validateTextFieldPasword,
                onChange: (value) {}),
          ),
        ],
      ),
    ));
  }
}
