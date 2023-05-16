import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel_booking_tour/features/auth/signin/bloc/bloc_sign_in_event.dart';
import 'package:travel_booking_tour/features/auth/signin/bloc/bloc_sign_in_screen.dart';
import 'package:travel_booking_tour/features/auth/signin/bloc/bloc_sign_in_state.dart';
import 'package:travel_booking_tour/res/background.dart';
import 'package:travel_booking_tour/res/res.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../common/enum/enums.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../res/app_dialog.dart';
import '../../../res/button.dart';
import '../../../res/input_field.dart';
import '../../../router/routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  late SLocalization localization;
  late BlocSignInScreen _blocSignInScreen;
  late FToast fToast;

  @override
  void initState() {
    _blocSignInScreen = BlocProvider.of<BlocSignInScreen>(context);
    fToast = FToast();
    fToast.init(context);
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemStyle);
  }

  @override
  Widget build(BuildContext context) {
    localization = SLocalization.of(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: GestureDetector(
        child: AppDeepBackground(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocListener<BlocSignInScreen, BlocSignInState>(
            listenWhen: (previous, current) =>
                current is BlocSignInStateValidate,
            listener: (context, state) {
              if (state is BlocSignInStateValidate) {
                if (state.appResult.state == ResultState.success) {
                  Routes.navigateToAndRemoveUntil(AppPath.mainScreen, {});
                } else if (state.appResult.state == ResultState.error) {
                  showDialog(
                    context: context,
                    builder: (context) => const DefaultDialog.warning(
                      title: Text('Error Server'),
                      content:
                          Text('Opp Sorry!\nSomething went wrong, try later!'),
                    ),
                  );
                }
              }
            },
            child: Container(
              color: AppColors.white,
              alignment: Alignment.topCenter,
              child: AppBackground(
                  header: localization.sign_in, children: _buildBody()),
            ),
          ),
        )),
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
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
          BlocBuilder<BlocSignInScreen, BlocSignInState>(
              buildWhen: (previous, current) =>
                  current is BlocSignInStateValidate,
              builder: (context, state) {
                bool isLoading = state is BlocSignInStateValidate &&
                    state.appResult.state == ResultState.loading;
                return PrimaryActiveButton(
                  text: localization.sign_in,
                  isLoading: isLoading,
                  onTap: () async {
                    _blocSignInScreen.add(BlocSignInEventSignInClick());
                  },
                  allCaps: true,
                );
              }),
          const SizedBox(
            height: 34,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              localization.or_sign_in_with,
              style: AppStyles.titleSmall.copyWith(
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
                  style: AppStyles.titleSmall.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.textByAgreeColor)),
              TextSpan(
                  text: localization.sign_up,
                  style: AppStyles.titleSmall.copyWith(
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
        style: AppStyles.titleLarge.copyWith(
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
            icon: AppIcons.google,
            background: AppColors.black.withOpacity(0.1),
            splash: AppColors.white.withOpacity(0.5),
            voidCallback: () =>
                _blocSignInScreen.add(BlocSignInEventLoginWithGoogle()),
          ),
          const SizedBox(
            width: 10,
          ),
          SocialButton(
            icon: AppIcons.facebook,
            background: AppColors.facebookBgColor,
            splash: const Color.fromARGB(255, 37, 105, 208),
            voidCallback: () async =>
                _blocSignInScreen.add(BlocSignInEventLoginWithFacebook()),
          ),
        ],
      ),
    );
  }

  Widget _buildInputFields() {
    return Form(
      key: _blocSignInScreen.signInGlobalKey,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextField(
              hintText: localization.email,
              obsecureText: false,
              textEditingController: _blocSignInScreen.emailEditingController,
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
              textEditingController:
                  _blocSignInScreen.passwordEditingController,
              labelText: localization.password,
              validator: _blocSignInScreen.validateTextFieldPaswordLogIn,
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
                      style: AppStyles.titleSmall.copyWith(
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
