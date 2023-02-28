import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/features/auth/signin/blocs/bloc_sign_in_event.dart';
import 'package:travel_booking_tour/features/auth/signin/blocs/bloc_sign_in_screen.dart';
import 'package:travel_booking_tour/features/auth/signin/blocs/bloc_sign_in_state.dart';
import 'package:travel_booking_tour/res/background.dart';
import 'package:travel_booking_tour/res/res.dart';

import '../../../l10n/generated/l10n.dart';
import '../../../res/app_dialog.dart';
import '../../../res/button.dart';
import '../../../res/input_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  late SLocalization localization;
  final GlobalKey<FormState> signInGlobalKey = GlobalKey<FormState>();
  late BlocSignInScreen _blocSignInScreen;

  @override
  void initState() {
    _blocSignInScreen = BlocProvider.of<BlocSignInScreen>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    localization = SLocalization.of(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: GestureDetector(
        child: SingleChildScrollView(
          child: BlocListener<BlocSignInScreen, BlocSignInState>(
            listenWhen: (previous, current) =>
                current is BlocSignInStateValidateSuccess ||
                current is BlocSignInStateServerError,
            listener: (context, state) {
              if (state is BlocSignInStateValidateSuccess) {
                showDialog(
                  context: context,
                  builder: (context) => AppDialog(
                    typeDialog: TypeDialog.success,
                    content: 'Congratulation!\nSign up successfully.',
                    positiveAction: () => Navigator.of(context).pop(),
                  ),
                );
              } else if (state is BlocSignInStateServerError) {
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
              color: AppColors.primary,
              alignment: Alignment.center,
              child: AppBackground(
                  header: localization.sign_in, children: _buildBody()),
            ),
          ),
        ),
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      )),
    );
  }

  Widget _buildBody() {
    return Container(
      color: AppColors.white,
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
          BlocBuilder<BlocSignInScreen, BlocSignInState>(
            buildWhen: (previous, current) =>
                current is BlocSignInStateValidateLoading ||
                current is BlocSignInStateValidateSuccess ||
                current is BlocSignInStateValidateFail ||
                current is BlocSignInStateServerError,
            builder: (context, state) => PrimaryButton(
              text: localization.sign_in,
              isLoading: state is BlocSignInStateValidateLoading,
              onTap: () {
                _blocSignInScreen.add(BlocSignInEventSignInClick(
                    signInGlobalKey: signInGlobalKey));
              },
              allCaps: true,
            ),
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
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _blocSignInScreen.add(BlocSignInEventSignUpClick());
                    })
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
    return Form(
      key: signInGlobalKey,
      child: Container(
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
              validator: _blocSignInScreen.validateTextFieldEmail,
              onChange: (value) => _blocSignInScreen
                  .add(BlocSignInEventChangeEmail(email: value)),
            ),
            const SizedBox(
              height: 24,
            ),
            AppTextField(
              hintText: localization.password,
              obsecureText: true,
              labelText: localization.password,
              validator: AppValidator.validateTextFieldPaswordLogIn,
              onChange: (value) => _blocSignInScreen
                  .add(BlocSignInEventChangePassword(password: value)),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                alignment: Alignment.centerLeft,
                child: Material(
                  color: AppColors.transparent,
                  child: InkWell(
                    child: Text(
                      localization.forgot_password,
                      style: context.textStyle.titleSmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textByAgreeColor),
                    ),
                    onTap: () {
                      _blocSignInScreen.add(BlocSignInEventForgotPassword());
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
