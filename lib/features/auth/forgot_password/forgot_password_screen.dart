import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/features/auth/forgot_password/bloc/bloc_forgot_password_event.dart';
import 'package:travel_booking_tour/features/auth/forgot_password/bloc/bloc_forgot_password_screen.dart';
import 'package:travel_booking_tour/features/auth/forgot_password/bloc/bloc_forgot_password_state.dart';
import 'package:travel_booking_tour/l10n/generated/l10n.dart';
import 'package:travel_booking_tour/res/background.dart';
import 'package:travel_booking_tour/res/res.dart';

import '../../../../res/button.dart';
import '../../../../res/input_field.dart';
import '../../../res/app_dialog.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordScreen();
  }
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
  late SLocalization localization;
  late BlocForgotPasswordScreen _blocForgotPasswordScreen;

  @override
  void initState() {
    _blocForgotPasswordScreen =
        BlocProvider.of<BlocForgotPasswordScreen>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    localization = SLocalization.of(context);
    return BlocListener<BlocForgotPasswordScreen, BlocForgotPasswordState>(
        listenWhen: (previous, current) =>
            current is BlocChangePasswordStateSendEmailResult,
        listener: (context, state) {
          if (state is BlocChangePasswordStateSendEmailResult) {
            if (state.appResult.state == ResultState.fail) {
              showDialog(
                context: context,
                builder: (context) => DefaultDialog.warning(
                  content: Text(state.appResult.result),
                ),
              );
            }
          }
        },
        child: Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(
                child: Container(
                    alignment: Alignment.topCenter,
                    child: AppDeepBackground(
                        child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: AppBackground(
                          header: localization.forgot_password,
                          children: Form(
                              key: _blocForgotPasswordScreen
                                  .forgotPasswordGlobalKey,
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.only(
                                              left: 32, right: 32, top: 28),
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
                                                textInputType:
                                                    TextInputType.emailAddress,
                                                onChange: (value) =>
                                                    _blocForgotPasswordScreen.add(
                                                        BlocForgotPasswordEventChangeEmail(
                                                            email: value)),
                                                validator: AppValidator
                                                    .validateTextFieldEmail,
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 52,
                                        ),
                                        BlocBuilder<BlocForgotPasswordScreen,
                                            BlocForgotPasswordState>(
                                          buildWhen: (previous, current) => current
                                              is BlocChangePasswordStateSendEmailResult,
                                          builder: (context, state) {
                                            bool loading = false;

                                            if (state
                                                is BlocChangePasswordStateSendEmailResult) {
                                              if (state.appResult.state ==
                                                  ResultState.loading) {
                                                loading = true;
                                              } else if (state
                                                      .appResult.state ==
                                                  ResultState.success) {
                                                loading = false;
                                              } else if (state
                                                      .appResult.state ==
                                                  ResultState.fail) {
                                                loading = false;
                                              }
                                            }
                                            return PrimaryActiveButton(
                                              text: localization.send,
                                              isLoading: loading,
                                              onTap: () {
                                                BlocProvider.of<
                                                            BlocForgotPasswordScreen>(
                                                        context)
                                                    .add(
                                                        BlocForgotPasswordEventSendEmailClick());
                                              },
                                              allCaps: true,
                                            );
                                          },
                                        ),
                                        const SizedBox(
                                          height: 128,
                                        ),
                                        Container(
                                            alignment: Alignment.center,
                                            child: Text.rich(TextSpan(
                                                text: localization.back_to,
                                                style: AppStyles.titleSmall
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColors
                                                            .textByAgreeColor),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                          localization.sign_in,
                                                      style: AppStyles
                                                          .titleSmall
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .primary),
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              _blocForgotPasswordScreen
                                                                  .add(
                                                                      BlocForgotPasswordEventSignInClick());
                                                            })
                                                ])))
                                      ])))),
                    ))))));
  }

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        localization
            .input_your_email_we_will_send_you_an_instruction_to_reset_your_password,
        style: AppStyles.titleMedium.copyWith(
            fontWeight: FontWeight.w400, color: AppColors.textOnboardingBrown),
      ),
    );
  }
}
