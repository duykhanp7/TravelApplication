import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/l10n/generated/l10n.dart';
import 'package:travel_booking_tour/res/icons.dart';
import 'package:travel_booking_tour/res/res.dart';

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

  @override
  Widget build(BuildContext context) {
    localization = SLocalization.of(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Stack(
            children: [_buildBackground(), _buildBody(context)],
          ),
        ),
      )),
    );
  }

  Positioned _buildBody(BuildContext context) {
    return Positioned(
      child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 140,
              child: ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  color: AppColors.white,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: AppColors.white,
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 32),
                    child: Text(
                      localization.sign_up,
                      style: context.textStyle.titleLarge!.copyWith(
                          fontSize: 34,
                          fontWeight: FontWeight.w100,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 32, right: 32),
                      child: _buildListRadioButton()),
                  _buildFieldsInput(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildFieldsInput(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 21, left: 32, right: 32),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 60,
                      width: 150,
                      child: AppTextField(
                        hintText: localization.first_name,
                        obsecureText: false,
                        labelText: localization.first_name,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 60,
                      width: 145,
                      child: AppTextField(
                        hintText: localization.last_name,
                        obsecureText: false,
                        labelText: localization.last_name,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 60,
                  child: AppTextField(
                    hintText: localization.country,
                    obsecureText: false,
                    labelText: localization.country,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 60,
                  child: AppTextField(
                    hintText: localization.email,
                    obsecureText: false,
                    textInputType: TextInputType.emailAddress,
                    labelText: localization.email,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 60,
                  child: AppTextField(
                    hintText: localization.password,
                    obsecureText: true,
                    labelText: localization.password,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 60,
                  child: AppTextField(
                    hintText: localization.confirm_password,
                    obsecureText: true,
                    labelText: localization.confirm_password,
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
              onTap: () {},
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

  Widget _buildBackground() {
    return Container(
      height: 150,
      padding: const EdgeInsets.only(top: 10, left: 20),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.appLogo,
                        width: 32, height: 38, color: AppColors.primary),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppIcons.point,
                          width: 4,
                          height: 4,
                          color: AppColors.primary,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        SvgPicture.asset(AppIcons.point,
                            width: 4, height: 4, color: AppColors.primary)
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: SvgPicture.asset(
                  AppIcons.plane,
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 100,
            child: SvgPicture.asset(
              AppIcons.wavePlan,
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            left: 100,
            right: 0,
            top: 50,
            child: SvgPicture.asset(
              AppIcons.cloudyBlur2,
              alignment: Alignment.center,
              width: 57,
              height: 25,
            ),
          )
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(size.width, size.height);
    path0.quadraticBezierTo(size.width * 0.8531583, size.height * 0.6825143,
        size.width * 0.4986083, size.height * 0.6457143);
    path0.quadraticBezierTo(
        size.width * 0.1302417, size.height * 0.6974857, 0, size.height);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
