import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/common/extension/context_extension.dart';
import 'package:travel_booking_tour/l10n/generated/l10n.dart';
import 'package:travel_booking_tour/res/background.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/images.dart';

import '../bloc/bloc_forgot_password_event.dart';
import '../bloc/bloc_forgot_password_screen.dart';

class CheckEmailScreen extends StatefulWidget {
  const CheckEmailScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CheckEmailScreen();
  }
}

class _CheckEmailScreen extends State<CheckEmailScreen> {
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
              header: localization.check_email,
              children: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 28, left: 32, right: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTitle(),
                    const SizedBox(
                      height: 40,
                    ),
                    _buildBody(),
                    const SizedBox(
                      height: 125,
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
                                    BlocProvider.of<BlocForgotPasswordScreen>(
                                            context)
                                        .add(
                                            BlocForgotPasswordEventSignInClick());
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
        localization.please_check_u_email,
        style: context.textStyle.titleMedium!.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.inActiveRadioBorderColor),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(AppImages.email),
    );
  }
}
