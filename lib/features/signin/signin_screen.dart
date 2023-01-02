import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/res/background.dart';
import 'package:travel_booking_tour/res/button.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';
import 'package:travel_booking_tour/res/input_field.dart';
import 'package:travel_booking_tour/res/res.dart';

import '../../l10n/generated/l10n.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  late SLocalization localization;

  @override
  Widget build(BuildContext context) {
    localization = SLocalization.of(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          color: AppColors.primary,
          alignment: Alignment.center,
          child: AppBackground(
              header: localization.sign_in, children: _buildBody()),
        ),
      )),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Column(
              children: [
                _buildTitle(),
                _buildInputFields(),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          PrimaryButton(
            text: localization.sign_in,
            onTap: () {},
            allCaps: true,
          ),
          const SizedBox(
            height: 34,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              localization.or_sign_in_with,
              style: context.textStyle.titleSmall!.copyWith(
                  fontSize: 12,
                  color: AppColors.inActiveRadioBorderColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          _buildSocialsWidget(),
          const SizedBox(
            height: 50,
          ),
          Container(
            alignment: Alignment.center,
            child: Text.rich(TextSpan(children: <TextSpan>[
              TextSpan(
                  text: localization.dont_have_an_account,
                  style: context.textStyle.titleSmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.textByAgreeColor)),
              TextSpan(
                  text: localization.sign_up,
                  style: context.textStyle.titleSmall!.copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.primary),
                  recognizer: TapGestureRecognizer()..onTap = () {})
            ])),
          )
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        '${localization.welcom_back}Yoo Jin',
        style: context.textStyle.titleLarge!.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: AppColors.primary),
      ),
    );
  }

  Widget _buildSocialsWidget() {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SocialButton(
            icon: AppIcons.facebook,
            background: AppColors.facebookBgColor,
            splash: const Color.fromARGB(255, 37, 105, 208),
            voidCallback: () {},
          ),
          const SizedBox(
            width: 20,
          ),
          SocialButton(
            icon: AppIcons.talk,
            background: AppColors.talkBgColor,
            splash: const Color.fromARGB(255, 233, 211, 6),
            voidCallback: () {},
          ),
          const SizedBox(
            width: 20,
          ),
          SocialButton(
            icon: AppIcons.line,
            background: AppColors.lineBgColor,
            splash: const Color.fromARGB(255, 50, 173, 2),
            voidCallback: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildInputFields() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextField(
            hintText: localization.email,
            obsecureText: false,
            labelText: localization.email,
            textInputType: TextInputType.emailAddress,
            validator: AppValidator.validateTextFieldEmail,
          ),
          const SizedBox(
            height: 24,
          ),
          AppTextField(
            hintText: localization.password,
            obsecureText: true,
            labelText: localization.password,
            validator: AppValidator.validateTextFieldPasword,
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
              alignment: Alignment.centerLeft,
              child: Text(
                localization.forgot_password,
                style: context.textStyle.titleSmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.textByAgreeColor),
              )),
        ],
      ),
    );
  }
}
