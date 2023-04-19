import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:travel_booking_tour/res/res.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../common/app_constant.dart';
import '../../../common/enum/enums.dart';
import '../../../res/input_field.dart';
import '../../../router/routes.dart';

class EditingProfile extends StatefulWidget {
  const EditingProfile({super.key});

  @override
  State<StatefulWidget> createState() {
    return _EditingProfile();
  }
}

class _EditingProfile extends State<EditingProfile> {
  List<File>? filesMain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarApp(
        title: 'Edit Profile',
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
            onTap: () async {},
          ),
        ),
      ),
      backgroundColor: AppColors.white,
      body: _buildbody(),
    );
  }

  Widget _buildbody() {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(33, 30, 33, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(AppImages.emmy),
                  ),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 4),
                                    color: AppColors.black.withOpacity(0.15),
                                    blurRadius: 15)
                              ]),
                        ),
                        SvgPicture.asset(
                          AppIcons.camera,
                          color: AppColors.primary,
                        ),
                        Material(
                          color: AppColors.transparent,
                          child: InkWell(
                            splashColor: AppColors.black.withOpacity(0.1),
                            highlightColor: AppColors.black.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.transparent,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 4),
                                        color:
                                            AppColors.black.withOpacity(0.15),
                                        blurRadius: 15)
                                  ]),
                            ),
                            onTap: () {},
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
          const SizedBox(height: 41),
          _buildEditInputFields(),
        ],
      ),
    ));
  }

  Widget _buildEditInputFields() {
    return Column(
      children: [
        Row(children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 150,
            child: AppTextField(
              hintText: 'Nguyen',
              obsecureText: false,
              labelText: 'First Name',
              validator: AppValidator.validateTextFieldFirstName,
              onChange: (value) {},
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: 150,
            child: AppTextField(
                hintText: ' Van A',
                obsecureText: false,
                labelText: 'Last Name',
                validator: AppValidator.validateTextFieldLastName,
                onChange: (value) {}),
          )
        ]),
        const SizedBox(height: 40),
        Container(
            alignment: Alignment.centerLeft,
            child: AppTextField(
                hintText: '*********',
                obsecureText: true,
                labelText: "Password",
                validator: AppValidator.validateTextFieldPasword,
                onChange: (value) {})),
        const SizedBox(height: 24),
        Container(
          alignment: Alignment.centerLeft,
          child: InkWell(
              onTap: () => Routes.navigateTo(AppPath.settingChangePassword,
                  {AppConstant.data: PasswordMode.change}),
              child: Text(
                'Change password',
                style: AppStyles.titleSmall.copyWith(color: AppColors.primary),
              )),
        ),
      ],
    );
  }
}
