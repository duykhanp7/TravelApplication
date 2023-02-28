import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/features/auth/signup/blocs/bloc_sign_up_event.dart';
import 'package:travel_booking_tour/features/auth/signup/blocs/bloc_sign_up_screen.dart';
import 'package:travel_booking_tour/features/auth/signup/blocs/bloc_sign_up_state.dart';
import 'package:travel_booking_tour/l10n/generated/l10n.dart';
import 'package:travel_booking_tour/res/app_dialog.dart';
import 'package:travel_booking_tour/res/background.dart';
import 'package:travel_booking_tour/res/res.dart';

import '../../../../res/button.dart';
import '../../../../res/input_field.dart';
import '../../../../res/radio.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});
  final GlobalKey<FormState> signUpGlobalKey = GlobalKey<FormState>();

  @override
  State<StatefulWidget> createState() {
    return _SignUpScreen();
  }
}

class _SignUpScreen extends State<SignUpScreen> {
  int selectedRadioIndex = 0;

  late SLocalization localization;
  late BlocSignupScreen _blocSignInScreen;

  @override
  void initState() {
    _blocSignInScreen = BlocProvider.of<BlocSignupScreen>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    localization = SLocalization.of(context);
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemStyle);
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
          child: GestureDetector(
        child: SingleChildScrollView(
          child: Container(alignment: Alignment.center, child: _buildbody()),
        ),
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      )),
      resizeToAvoidBottomInset: true,
    );
  }

  Widget _buildbody() {
    return AppBackground(
        header: localization.sign_up,
        children: BlocListener<BlocSignupScreen, BlocSignUpState>(
          listenWhen: (previous, current) =>
              current is BlocSignUpStateValidateSuccess ||
              current is BlocSignUpStateServerError,
          listener: (context, state) {
            if (state is BlocSignUpStateValidateSuccess) {
              showDialog(
                context: context,
                builder: (context) => AppDialog(
                  typeDialog: TypeDialog.success,
                  content: 'Congratulation!\nSign up successfully.',
                  positiveAction: () => Navigator.of(context).pop(),
                ),
              );
            } else if (state is BlocSignUpStateServerError) {
              showDialog(
                context: context,
                builder: (context) => AppDialog(
                  typeDialog: TypeDialog.error,
                  content: 'Opp Sorry!\nSomething went wrong, try later!',
                  positiveAction: () => Navigator.of(context).pop(),
                ),
              );
            }
          },
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 32, right: 32),
                    child: _buildListRadioButton()),
                _buildFieldsInput(context)
              ],
            ),
          ),
        ));
  }

  Container _buildFieldsInput(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Form(
        key: widget.signUpGlobalKey,
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
                          onChange: (value) => _blocSignInScreen.add(
                              BlocSignUpEventChangeFirstName(firstName: value)),
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
                            onChange: (value) => _blocSignInScreen.add(
                                BlocSignUpEventChangeLastName(
                                    lastName: value))),
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
                        onChange: (value) => _blocSignInScreen
                            .add(BlocSignUpEventChangeCountry(country: value))),
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
                        validator: _blocSignInScreen.validateTextFieldEmail,
                        onChange: (value) => _blocSignInScreen
                            .add(BlocSignUpEventChangeEmail(email: value))),
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
                        onChange: (value) => _blocSignInScreen.add(
                            BlocSignUpEventChangePassword(password: value))),
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
                                value, _blocSignInScreen.password ?? ''),
                        onChange: (value) => _blocSignInScreen.add(
                            BlocSignUpEventChangeConfirmPassword(
                                confirmPassword: value))),
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
                                  _blocSignInScreen.add(
                                      BlocSignUpEventTermAndConditionsClick());
                                })
                        ])),
                  )
                ],
              ),
            ),
            BlocBuilder<BlocSignupScreen, BlocSignUpState>(
              buildWhen: (previous, current) =>
                  current is BlocSignUpStateValidateLoading ||
                  current is BlocSignUpStateValidateSuccess ||
                  current is BlocSignUpStateServerError ||
                  current is BlocSignUpStateValidateFail,
              builder: (context, state) => Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 14),
                child: PrimaryButton(
                  text: localization.sign_up,
                  isLoading: state is BlocSignUpStateValidateLoading,
                  onTap: () {
                    _blocSignInScreen.add(BlocSignUpEventValidate(
                        signUpGlobalKey: widget.signUpGlobalKey));
                  },
                  allCaps: true,
                  margin: const EdgeInsets.only(left: 33, right: 33),
                ),
              ),
            ),
            const SizedBox(
              height: 38,
            ),
            Container(
              alignment: Alignment.center,
              child: Text.rich(TextSpan(
                  text: localization.already_have_an_account,
                  style: context.textStyle.titleSmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: AppColors.textByAgreeColor),
                  children: <TextSpan>[
                    TextSpan(
                        text: localization.sign_in,
                        style: context.textStyle.titleSmall!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: AppColors.primary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _blocSignInScreen.add(BlocSignUpEventSignInClick());
                          })
                  ])),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListRadioButton() {
    return BlocBuilder<BlocSignupScreen, BlocSignUpState>(
      buildWhen: (previous, current) =>
          current is BlocSignUpStateChangeTypeAccount,
      builder: (context, state) => Container(
        padding: const EdgeInsets.only(top: 35),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            AppRadioButton(
              id: 0,
              text: localization.traveler,
              selectedId: _blocSignInScreen.typeAccount,
              onTap: (value) {
                _blocSignInScreen
                    .add(BlocSignUpEventChangeTypeAccount(typeAccount: value));
              },
            ),
            const SizedBox(
              width: 56,
            ),
            AppRadioButton(
              id: 1,
              text: localization.tour_guide,
              selectedId: _blocSignInScreen.typeAccount,
              onTap: (value) {
                _blocSignInScreen
                    .add(BlocSignUpEventChangeTypeAccount(typeAccount: value));
              },
            )
          ],
        ),
      ),
    );
  }
}
