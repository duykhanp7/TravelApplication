import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/features/signup/bloc/bloc_sign_up_event.dart';
import 'package:travel_booking_tour/features/signup/bloc/bloc_sign_up_screen.dart';
import 'package:travel_booking_tour/l10n/generated/l10n.dart';
import 'package:travel_booking_tour/res/background.dart';
import 'package:travel_booking_tour/res/res.dart';
import 'package:travel_booking_tour/res/system.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignUpScreen();
  }
}

class _SignUpScreen extends State<SignUpScreen> {
  int selectedRadioIndex = 0;

  late SLocalization localization;
  String password = '';

  @override
  Widget build(BuildContext context) {
    localization = SLocalization.of(context);
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemStyle);
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(alignment: Alignment.center, child: _buildbody()),
      )),
    );
  }

  Widget _buildbody() {
    return AppBackground(
        header: localization.sign_up,
        children: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 32, right: 32),
                  child: _buildListRadioButton()),
              _buildFieldsInput(context)
            ],
          ),
        ));
  }

  Container _buildFieldsInput(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Form(
        key: AppValidator.globalKeyFomrState,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 21, left: 30, right: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 150,
                        child: AppTextField(
                          hintText: localization.first_name,
                          obsecureText: false,
                          labelText: localization.first_name,
                          validator: AppValidator.validateTextFieldFirstName,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 150,
                        child: AppTextField(
                          hintText: localization.last_name,
                          obsecureText: false,
                          labelText: localization.last_name,
                          validator: AppValidator.validateTextFieldLastName,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: AppTextField(
                      hintText: localization.country,
                      obsecureText: false,
                      labelText: localization.country,
                      validator: AppValidator.validateTextFieldCountry,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: AppTextField(
                      hintText: localization.email,
                      obsecureText: false,
                      textInputType: TextInputType.emailAddress,
                      labelText: localization.email,
                      validator: AppValidator.validateTextFieldEmail,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: AppTextField(
                      hintText: localization.password,
                      obsecureText: true,
                      labelText: localization.password,
                      validator: AppValidator.validateTextFieldPasword,
                      onChange: (value) {
                        password = value;
                        debugPrint('Main password : $value');
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: AppTextField(
                      hintText: localization.confirm_password,
                      obsecureText: true,
                      labelText: localization.confirm_password,
                      validator: (value) =>
                          AppValidator.validateTextFieldConfirmPasword(
                              value, password),
                      onChange: (value) {
                        debugPrint('Confirm password :$value+a');
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text.rich(TextSpan(
                        text: localization.by_singing_up_you_agree_to_our,
                        style: context.textStyle.labelMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: AppColors.textByAgreeColor),
                        children: <TextSpan>[
                          TextSpan(
                              text: localization.tern_conditions,
                              style: context.textStyle.labelMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: AppColors.primary,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //Todo
                                })
                        ])),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 14),
              child: PrimaryButton(
                text: localization.sign_up,
                onTap: () {
                  BlocProvider.of<BlocSignupScreen>(context)
                      .add(BlocSignUpEventValidate());
                },
                allCaps: true,
                margin: const EdgeInsets.only(left: 33, right: 33),
              ),
            ),
            const SizedBox(
              height: 38,
            ),
            Container(
              alignment: Alignment.center,
              child: Text.rich(TextSpan(
                  text: localization.already_have_an_account,
                  style: context.textStyle.labelMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: AppColors.textByAgreeColor),
                  children: <TextSpan>[
                    TextSpan(
                        text: localization.sign_in,
                        style: context.textStyle.labelMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: AppColors.primary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //Todo
                          })
                  ])),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListRadioButton() {
    return Container(
      padding: const EdgeInsets.only(top: 35),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          AppRadioButton(
            id: 0,
            text: localization.traveler,
            selectedId: selectedRadioIndex,
            onTap: (value) {
              debugPrint('Traveler Selected');
              setState(() {
                selectedRadioIndex = value;
              });
            },
          ),
          const SizedBox(
            width: 56,
          ),
          AppRadioButton(
            id: 1,
            text: localization.tour_guide,
            selectedId: selectedRadioIndex,
            onTap: (value) {
              debugPrint('Tour guide Selected');
              setState(() {
                selectedRadioIndex = value;
              });
            },
          )
        ],
      ),
    );
  }
}
