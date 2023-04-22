import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/features/profile/bloc/edit_profile/bloc_edit_profile_state.dart';
import 'package:travel_booking_tour/features/profile/bloc/profile/bloc_profile_screen.dart';
import 'package:travel_booking_tour/features/profile/bloc/profile/bloc_profile_state.dart';
import 'package:travel_booking_tour/features/profile/model/user_info.dart';
import 'package:travel_booking_tour/features/profile/bloc/edit_profile/bloc_edit_profile_event.dart';
import 'package:travel_booking_tour/res/button.dart';

import 'package:travel_booking_tour/res/res.dart';
import '../../../common/enum/enums.dart';
import '../../../res/input_field.dart';
import '../bloc/edit_profile/bloc_edit_profile_screen.dart';

class EditingProfile extends StatefulWidget {
  const EditingProfile({super.key});

  @override
  State<StatefulWidget> createState() {
    return _EditingProfile();
  }
}

class _EditingProfile extends State<EditingProfile> {
  List<File>? filesMain;
  late BlocEditProfileScreen _blocEditProfileScreen;

  @override
  void initState() {
    _blocEditProfileScreen = BlocProvider.of<BlocEditProfileScreen>(context);
    _blocEditProfileScreen.setBuildContext(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarApp(
        title: 'Edit Profile',
      ),
      backgroundColor: AppColors.white,
      body: _buildbody(),
    );
  }

  Widget _buildbody() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(33, 30, 33, 0),
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
                                        color:
                                            AppColors.black.withOpacity(0.15),
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
                                highlightColor:
                                    AppColors.black.withOpacity(0.1),
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
                                            color: AppColors.black
                                                .withOpacity(0.15),
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
        ),
      ),
    );
  }

  Widget _buildEditInputFields() {
    return BlocBuilder<BlocProfileScreen, BlocProfileState>(
        buildWhen: (previous, current) =>
            current is BlocProfileStateLoadUserInforResult,
        builder: (context, state) {
          UserInfoJson? userInfoJson;
          if (state is BlocProfileStateLoadUserInforResult) {
            if (state.appResult.state == ResultState.success) {
              userInfoJson = state.appResult.result as UserInfoJson?;
              _blocEditProfileScreen.init(userInfoJson);
            }
          }
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
                    textEditingController:
                        _blocEditProfileScreen.firstNameTextEditingController,
                    validator: AppValidator.validateTextFieldFirstName,
                    onChange: (value) => _blocEditProfileScreen.add(
                        BlocEditProfileEventChangeFirstName(firstName: value)),
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
                      textEditingController:
                          _blocEditProfileScreen.lastNameTextEditingController,
                      validator: AppValidator.validateTextFieldLastName,
                      onChange: (value) => _blocEditProfileScreen.add(
                          BlocEditProfileEventChangeLastName(lastName: value))),
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
                    onTap: () => _blocEditProfileScreen
                        .add(BlocEditProfileEventClickButtonChangePassword()),
                    child: Text(
                      'Change password',
                      style: AppStyles.titleSmall
                          .copyWith(color: AppColors.primary),
                    )),
              ),
              const SizedBox(height: 30),
              BlocBuilder<BlocEditProfileScreen, BlocEditProfileState>(
                buildWhen: (previous, current) =>
                    current is BlocEditProfileStateResult,
                builder: (context, state) {
                  bool isLoading = false;
                  if (state is BlocEditProfileStateResult) {
                    if (state.appResult.state == ResultState.loading) {
                      isLoading = true;
                    } else {
                      isLoading = false;
                    }
                  }
                  return PrimaryActiveButton(
                    text: 'Save',
                    isLoading: isLoading,
                    onTap: () => _blocEditProfileScreen
                        .add(BlocEditProfileEventClickButtonSaveChange()),
                    margin: EdgeInsets.zero,
                    allCaps: true,
                  );
                },
              )
            ],
          );
        });
  }
}
