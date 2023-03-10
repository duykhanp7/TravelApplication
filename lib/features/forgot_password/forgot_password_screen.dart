import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/l10n/generated/l10n.dart';
import 'package:travel_booking_tour/res/background.dart';
import 'package:travel_booking_tour/res/button.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/input_field.dart';
import 'package:travel_booking_tour/res/res.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordScreen();
  }
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
  late SLocalization localization;

  @override
  Widget build(BuildContext context) {
    localization = SLocalization.of(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: AppBackground(
              header: localization.forgot_password,
              children: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.only(left: 32, right: 32, top: 28),
                      child: Column(
                        children: [
                          _buildTitle(),
                          const SizedBox(
                            height: 23,
                          ),
                          AppTextField(
                            hintText: localization.email,
                            obsecureText: false,
                            labelText: localization.email,
                            textInputType: TextInputType.emailAddress,
                            validator: AppValidator.validateTextFieldEmail,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 52,
                    ),
                    PrimaryButton(
                      text: localization.send,
                      onTap: () {},
                      allCaps: true,
                    ),
                    const SizedBox(
                      height: 128,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text.rich(TextSpan(
                          text: localization.back_to,
                          style: context.textStyle.titleSmall!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.textByAgreeColor),
                          children: <TextSpan>[
                            TextSpan(
                                text: localization.sign_in,
                                style: context.textStyle.titleSmall!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primary),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    //Todo
                                  })
                          ])),
                    )
                  ],
                ),
              )),
        ),
      )),
    );
  }

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        localization
            .input_your_email_we_will_send_you_an_instruction_to_reset_your_password,
        style: context.textStyle.titleMedium!.copyWith(
            fontWeight: FontWeight.w400, color: AppColors.textOnboardingBrown),
      ),
    );
  }
}
