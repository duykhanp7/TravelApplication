import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/enums/enums.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/features/auth/signup/blocs/bloc_sign_up_tour_guide_information_event.dart';
import 'package:travel_booking_tour/features/auth/signup/blocs/bloc_sign_up_tour_guide_information_screen.dart';
import 'package:travel_booking_tour/features/auth/signup/blocs/bloc_sign_up_tour_guide_information_state.dart';
import 'package:travel_booking_tour/features/auth/signup/widgets/choose_date_widget.dart';
import 'package:travel_booking_tour/features/auth/signup/widgets/timeline_widget.dart';
import 'package:travel_booking_tour/res/app_dialog.dart';
import 'package:travel_booking_tour/res/background.dart';
import 'package:travel_booking_tour/res/button.dart';
import 'package:travel_booking_tour/res/dotted_border/dotted_border.dart';
import 'package:travel_booking_tour/res/input_field.dart';
import 'package:travel_booking_tour/res/res.dart';
import 'package:video_viewer/domain/entities/video_source.dart';

class SignUpTourGuideInformationScreen extends StatefulWidget {
  const SignUpTourGuideInformationScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignUpTourGuideInformationScreen();
  }
}

class _SignUpTourGuideInformationScreen
    extends State<SignUpTourGuideInformationScreen> {
  late BlocSignUpTourGuideInformationScreen
      _blocSignUpTourGuideInformationScreen;

  @override
  void initState() {
    _blocSignUpTourGuideInformationScreen =
        BlocProvider.of<BlocSignUpTourGuideInformationScreen>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemStyle);
    return WillPopScope(
      onWillPop: () async {
        if (_blocSignUpTourGuideInformationScreen.currentIndexStep == 0) {
          _blocSignUpTourGuideInformationScreen.clearDatas();
          _blocSignUpTourGuideInformationScreen
              .add(BlocSignUpTourGuideInformationEventClose());
          return true;
        } else {
          _blocSignUpTourGuideInformationScreen
              .add(BlocSignUpTourGuideInformationEventChangeStep(step: 0));
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
            child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          scrollDirection: Axis.vertical,
          child: GestureDetector(
            onTap: () {},
            child: BlocListener<BlocSignUpTourGuideInformationScreen,
                BlocSignUpTourGuideInformationState>(
              listenWhen: (previous, current) =>
                  current is BlocSignUpTourGuideInformationStatePickWrongFormat,
              listener: (context, state) {
                showDialog(
                  context: context,
                  builder: (context) => AppDialog(
                    content: 'Only support these file formats: .jpg, .png',
                    typeDialog: TypeDialog.warning,
                    positiveAction: () => Navigator.of(context).pop(),
                  ),
                );
              },
              child: Form(
                key: _blocSignUpTourGuideInformationScreen
                    .signUpTourGuideInformationGlobalKey,
                child: AppBackground(
                    header:
                        'Please finish your profile so that\nTravelers can find you easily!',
                    headerStyle: context.textStyle.titleMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal),
                    headerPadding: const EdgeInsets.only(top: 0, bottom: 30),
                    top: Container(
                      margin: const EdgeInsets.only(top: 32, left: 8),
                      child: Text(
                        'Welcome, Tuan',
                        style: context.textStyle.titleMedium?.copyWith(
                            fontSize: 34,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w100,
                            color: AppColors.white),
                      ),
                    ),
                    children: Container(
                      color: AppColors.white,
                      child: Column(
                        children: [
                          BlocBuilder<BlocSignUpTourGuideInformationScreen,
                              BlocSignUpTourGuideInformationState>(
                            buildWhen: (previous, current) => current
                                is BlocSignUpTourGuideInformationStateChangeStep,
                            builder: (context, state) => Container(
                              height: 50,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 20),
                              child: TimelineWidget(
                                  currentStep:
                                      _blocSignUpTourGuideInformationScreen
                                          .currentIndexStep,
                                  titles: const [
                                    'Background Info',
                                    'Fee & Time'
                                  ]),
                            ),
                          ),
                          const SizedBox(height: 30),
                          BlocBuilder<BlocSignUpTourGuideInformationScreen,
                              BlocSignUpTourGuideInformationState>(
                            buildWhen: (previous, current) => current
                                is BlocSignUpTourGuideInformationStateChangeStep,
                            builder: (context, state) {
                              if (state
                                  is BlocSignUpTourGuideInformationStateChangeStep) {
                                if (state.step == 0) {
                                  return _buildStep1();
                                } else if (state.step == 1) {
                                  return _buildStep2(context);
                                }
                              }
                              return _buildStep1();
                            },
                          )
                        ],
                      ),
                    )),
              ),
            ),
          ),
        )),
      ),
    );
  }

  Widget _buildStep1() {
    return Container(
      margin: const EdgeInsets.only(left: 32, right: 32, bottom: 30),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  BlocBuilder<BlocSignUpTourGuideInformationScreen,
                      BlocSignUpTourGuideInformationState>(
                    buildWhen: (previous, current) =>
                        current
                            is BlocSignUpTourGuideInformationStatePickProfileImageSuccess ||
                        current
                            is BlocSignUpTourGuideInformationStatePickProfileImageFail,
                    builder: (context, state) {
                      String filePath = _blocSignUpTourGuideInformationScreen
                              .imageProfile?.path ??
                          '';
                      if (state
                          is BlocSignUpTourGuideInformationStatePickProfileImageSuccess) {
                        filePath = state.file.path;
                      } else if (state
                          is BlocSignUpTourGuideInformationStatePickProfileImageFail) {
                        filePath = state.previousImagePicked?.path ?? '';
                      }

                      return Stack(
                        children: [
                          Container(
                            width: 85,
                            color: AppColors.primary,
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColors.transparent,
                                borderRadius: BorderRadius.circular(35),
                                border: Border.all(
                                    color: filePath.trim().isNotEmpty
                                        ? AppColors.transparent
                                        : AppColors.primary,
                                    width: filePath.trim().isNotEmpty ? 0 : 1)),
                            child: filePath.trim().isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(35),
                                    child: Image.file(
                                      File(filePath),
                                      filterQuality: FilterQuality.high,
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : SvgPicture.asset(AppIcons.icPersonal),
                          ),
                          Visibility(
                              visible: filePath.trim().isNotEmpty,
                              child: Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.icClose,
                                        width: 10,
                                        height: 10,
                                      ),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: AppColors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.transparent,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            onTap: () =>
                                                _blocSignUpTourGuideInformationScreen
                                                    .add(
                                                        BlocSignUpTourGuideInformationEventRemoveProfileImage()),
                                          ),
                                        ),
                                      )
                                    ],
                                  )))
                        ],
                      );
                    },
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.transparent,
                        borderRadius: BorderRadius.circular(35),
                        border:
                            Border.all(color: AppColors.transparent, width: 0)),
                    child: Material(
                      color: AppColors.transparent,
                      borderRadius: BorderRadius.circular(35),
                      child: InkWell(
                        splashColor: AppColors.black.withOpacity(0.1),
                        highlightColor: AppColors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(35),
                        onTap: () {
                          _blocSignUpTourGuideInformationScreen.add(
                              BlocSignUpTourGuideInformationEventPickProfileImage());
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          _buildInputFields(context)
        ],
      ),
    );
  }

  Widget _buildStep2(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 32, right: 32, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Set Fee',
            textAlign: TextAlign.left,
            style: context.textStyle.titleMedium?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.black),
          ),
          const SizedBox(height: 8),
          Text(
            'The price unit is US \$/hour',
            textAlign: TextAlign.left,
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400, color: AppColors.textHintColor),
          ),
          const SizedBox(height: 15),
          _buildTablePrices(),
          const SizedBox(height: 34),
          Text(
            'Set Available Time',
            textAlign: TextAlign.left,
            style: context.textStyle.titleMedium?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.black),
          ),
          const SizedBox(height: 8),
          Text(
            'The time you can work on Fellow4U as a Guide',
            textAlign: TextAlign.left,
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400, color: AppColors.textHintColor),
          ),
          const SizedBox(height: 21),
          BlocBuilder<BlocSignUpTourGuideInformationScreen,
              BlocSignUpTourGuideInformationState>(
            buildWhen: (previous, current) =>
                current is BlocSignUpTourGuideInformationStateChangeIndexDate,
            builder: (context, state) => ChooseDateWidget(
              current: _blocSignUpTourGuideInformationScreen.currentIndexDate,
              dates: const [
                'Monday',
                'Tuesday',
                'Wednesday',
                'Thursday',
                'Friday',
                'Saturday',
                'Sunday'
              ],
              onClick: (index) {
                _blocSignUpTourGuideInformationScreen.add(
                    BlocSignUpTourGuideInformationEventChangeIndexDateClick(
                        index: index));
              },
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: AppTextField(
                    hintText: 'From',
                    obsecureText: false,
                    isDense: true,
                    textInputType: TextInputType.number,
                    maxLength: 2,
                    textEditingController: _blocSignUpTourGuideInformationScreen
                        .textEditingControllerTimeFrom,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 10, right: 5),
                      child: SvgPicture.asset(
                        AppIcons.icClock,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    onChange: (value) => _blocSignUpTourGuideInformationScreen
                        .add(BlocSignUpTourGuideInformationEventChangeTimeFrom(
                            timeFrom: value)),
                    validator: null),
              ),
              const SizedBox(width: 15),
              Flexible(
                flex: 1,
                child: AppTextField(
                    hintText: 'To',
                    obsecureText: false,
                    isDense: true,
                    textInputType: TextInputType.number,
                    maxLength: 2,
                    textEditingController: _blocSignUpTourGuideInformationScreen
                        .textEditingControllerTimeTo,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 10, right: 5),
                      child: SvgPicture.asset(
                        AppIcons.icClock,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    onChange: (value) => _blocSignUpTourGuideInformationScreen
                        .add(BlocSignUpTourGuideInformationEventChangeTimeTo(
                            timeTo: value)),
                    validator: null),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            color: AppColors.transparent,
            width: 150,
            alignment: Alignment.center,
            child: Material(
              color: AppColors.transparent,
              child: InkWell(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.icAddBlue,
                      width: 13,
                      height: 13,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Add another time',
                      style: context.textStyle.titleSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: AppColors.primary),
                    )
                  ],
                ),
                onTap: () {},
              ),
            ),
          ),
          const SizedBox(height: 56),
          PrimaryButton(
            margin: EdgeInsets.zero,
            text: 'Finish',
            onTap: () {},
            allCaps: true,
          )
        ],
      ),
    );
  }

  Widget _buildTablePrices() {
    return Container(
      alignment: Alignment.center,
      child: Table(
        border: TableBorder(
            borderRadius: BorderRadius.circular(10),
            top: const BorderSide(width: 1, color: AppColors.tableBorder),
            right: const BorderSide(width: 1, color: AppColors.tableBorder),
            bottom: const BorderSide(width: 1, color: AppColors.tableBorder),
            left: const BorderSide(width: 1, color: AppColors.tableBorder),
            horizontalInside: const BorderSide(
              width: 1,
              color: AppColors.tableBorder,
            ),
            verticalInside:
                const BorderSide(width: 1, color: AppColors.tableBorder)),
        children: [
          TableRow(children: [
            Container(
              alignment: Alignment.center,
              height: 40,
              child: Text('1-3 Travelers',
                  textAlign: TextAlign.center,
                  style: context.textStyle.titleMedium?.copyWith(
                      color: AppColors.inActiveRadioBorderColor,
                      fontWeight: FontWeight.w500)),
            ),
            Container(
              alignment: Alignment.center,
              height: 40,
              child: AppTextField(
                textAlign: TextAlign.center,
                textInputType: TextInputType.number,
                textEditingController: _blocSignUpTourGuideInformationScreen
                    .textEditingControllerFee13,
                maxLength: 4,
                inputDecoration: InputDecoration(
                    hintText: 'Input the fee',
                    hintStyle: context.textStyle.titleMedium?.copyWith(
                        color: AppColors.textHintColor,
                        fontWeight: FontWeight.w400),
                    constraints: const BoxConstraints(maxHeight: 40),
                    contentPadding: const EdgeInsets.all(0),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 0, color: AppColors.transparent),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 0, color: AppColors.transparent),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 0, color: AppColors.transparent),
                        borderRadius: BorderRadius.circular(10))),
                onChange: (value) {
                  _blocSignUpTourGuideInformationScreen.add(
                      BlocSignUpTourGuideInformationEventChangeFee(
                          fee: value,
                          quantityTraveler:
                              QuantityTraveler.oneToThreeTravelers,
                          current: DateTime.now().millisecond));
                },
              ),
            )
          ]),
          TableRow(children: [
            Container(
              alignment: Alignment.center,
              height: 40,
              child: Text('4-6 Travelers',
                  textAlign: TextAlign.center,
                  style: context.textStyle.titleMedium?.copyWith(
                      color: AppColors.inActiveRadioBorderColor,
                      fontWeight: FontWeight.w500)),
            ),
            Container(
              alignment: Alignment.center,
              height: 40,
              child: AppTextField(
                  textAlign: TextAlign.center,
                  textInputType: TextInputType.number,
                  textEditingController: _blocSignUpTourGuideInformationScreen
                      .textEditingControllerFee46,
                  maxLength: 4,
                  inputDecoration: InputDecoration(
                      hintText: 'Input the fee',
                      hintStyle: context.textStyle.titleMedium?.copyWith(
                          color: AppColors.textHintColor,
                          fontWeight: FontWeight.w400),
                      constraints: const BoxConstraints(maxHeight: 40),
                      contentPadding: const EdgeInsets.all(0),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0, color: AppColors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0, color: AppColors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0, color: AppColors.transparent),
                          borderRadius: BorderRadius.circular(10))),
                  onChange: (value) => _blocSignUpTourGuideInformationScreen
                      .add(BlocSignUpTourGuideInformationEventChangeFee(
                          fee: value,
                          quantityTraveler: QuantityTraveler.fourToSixTravelers,
                          current: DateTime.now().millisecond))),
            )
          ]),
          TableRow(children: [
            Container(
              alignment: Alignment.center,
              height: 40,
              child: Text('7-9 Travelers',
                  textAlign: TextAlign.center,
                  style: context.textStyle.titleMedium?.copyWith(
                      color: AppColors.inActiveRadioBorderColor,
                      fontWeight: FontWeight.w500)),
            ),
            Container(
              alignment: Alignment.center,
              height: 40,
              child: AppTextField(
                  textAlign: TextAlign.center,
                  textInputType: TextInputType.number,
                  textEditingController: _blocSignUpTourGuideInformationScreen
                      .textEditingControllerFee79,
                  maxLength: 4,
                  inputDecoration: InputDecoration(
                      hintText: 'Input the fee',
                      hintStyle: context.textStyle.titleMedium?.copyWith(
                          color: AppColors.textHintColor,
                          fontWeight: FontWeight.w400),
                      constraints: const BoxConstraints(maxHeight: 40),
                      contentPadding: const EdgeInsets.all(0),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0, color: AppColors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0, color: AppColors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0, color: AppColors.transparent),
                          borderRadius: BorderRadius.circular(10))),
                  onChange: (value) => _blocSignUpTourGuideInformationScreen
                      .add(BlocSignUpTourGuideInformationEventChangeFee(
                          fee: value,
                          quantityTraveler:
                              QuantityTraveler.sevenToNineTravelers,
                          current: DateTime.now().millisecond))),
            )
          ]),
          TableRow(children: [
            Container(
              alignment: Alignment.center,
              height: 40,
              child: Text('10-14 Travelers',
                  textAlign: TextAlign.center,
                  style: context.textStyle.titleMedium?.copyWith(
                      color: AppColors.inActiveRadioBorderColor,
                      fontWeight: FontWeight.w500)),
            ),
            Container(
              alignment: Alignment.center,
              height: 40,
              child: AppTextField(
                  textAlign: TextAlign.center,
                  textInputType: TextInputType.number,
                  textEditingController: _blocSignUpTourGuideInformationScreen
                      .textEditingControllerFee1014,
                  maxLength: 4,
                  inputDecoration: InputDecoration(
                      hintText: 'Input the fee',
                      hintStyle: context.textStyle.titleMedium?.copyWith(
                          color: AppColors.textHintColor,
                          fontWeight: FontWeight.w400),
                      constraints: const BoxConstraints(maxHeight: 40),
                      contentPadding: const EdgeInsets.all(0),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0, color: AppColors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0, color: AppColors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0, color: AppColors.transparent),
                          borderRadius: BorderRadius.circular(10))),
                  onChange: (value) => _blocSignUpTourGuideInformationScreen
                      .add(BlocSignUpTourGuideInformationEventChangeFee(
                          fee: value,
                          quantityTraveler:
                              QuantityTraveler.tenToFourteenTravelers,
                          current: DateTime.now().millisecond))),
            )
          ])
        ],
      ),
    );
  }

  Widget _buildInputFields(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            hintText: 'Address',
            labelText: 'Address',
            textEditingController: _blocSignUpTourGuideInformationScreen
                .textEditingControllerAddress,
            hintTextStyle: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400, color: AppColors.textHintColor),
            validator: AppValidator.validateTextFieldAddress,
            onChange: (value) => _blocSignUpTourGuideInformationScreen.add(
                BlocSignUpTourGuideInformationEventChangeAddress(
                    address: value)),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Flexible(
                  flex: 1,
                  child: AppTextField(
                      hintText: 'City',
                      textEditingController:
                          _blocSignUpTourGuideInformationScreen
                              .textEditingControllerCity,
                      hintTextStyle: context.textStyle.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textHintColor),
                      validator: AppValidator.validateTextFieldCity,
                      onChange: (value) => _blocSignUpTourGuideInformationScreen
                          .add(BlocSignUpTourGuideInformationEventChangeCity(
                              city: value)))),
              const SizedBox(width: 20),
              Flexible(
                  flex: 1,
                  child: AppTextField(
                      hintText: 'Country',
                      textEditingController:
                          _blocSignUpTourGuideInformationScreen
                              .textEditingControllerCountry,
                      hintTextStyle: context.textStyle.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textHintColor),
                      validator: AppValidator.validateTextFieldCountry,
                      onChange: (value) => _blocSignUpTourGuideInformationScreen
                          .add(BlocSignUpTourGuideInformationEventChangeCountry(
                              country: value))))
            ],
          ),
          const SizedBox(height: 25),
          AppTextField(
              labelText: 'Phone number',
              hintText: 'Phone number',
              textEditingController: _blocSignUpTourGuideInformationScreen
                  .textEditingControllerPhoneNumber,
              prefixIcon: SizedBox(
                width: 80,
                child: SizedBox(
                  height: 40,
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '(+84)',
                            style: context.textStyle.titleSmall?.copyWith(
                                color: AppColors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 15),
                          SvgPicture.asset(AppIcons.icDropDown)
                        ],
                      )),
                ),
              ),
              validator: AppValidator.validateTextFieldPhoneNumber,
              contentPadding: const EdgeInsets.only(bottom: 0),
              hintTextStyle: context.textStyle.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.textHintColor),
              onChange: (value) => _blocSignUpTourGuideInformationScreen.add(
                  BlocSignUpTourGuideInformationEventChangePhoneNumber(
                      phoneNumber: value))),
          const SizedBox(height: 24),
          Text(
            'Guide License',
            textAlign: TextAlign.start,
            style: context.textStyle.titleMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.transparent,
                borderRadius: BorderRadius.circular(4)),
            child: Material(
              color: AppColors.transparent,
              borderRadius: BorderRadius.circular(4),
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () => _blocSignUpTourGuideInformationScreen.add(
                    BlocSignUpTourGuideInformationEventPickGuideLicenseImage()),
                child: BlocBuilder<BlocSignUpTourGuideInformationScreen,
                    BlocSignUpTourGuideInformationState>(
                  buildWhen: (previous, current) =>
                      current
                          is BlocSignUpTourGuideInformationStatePickGuideLicenseImageSuccess ||
                      current
                          is BlocSignUpTourGuideInformationStatePickGuideLicenseImageFail,
                  builder: (context, state) {
                    String filePath = _blocSignUpTourGuideInformationScreen
                            .imageGuideLicense?.path ??
                        '';
                    if (state
                        is BlocSignUpTourGuideInformationStatePickGuideLicenseImageSuccess) {
                      filePath = state.file.path;
                    } else if (state
                        is BlocSignUpTourGuideInformationStatePickGuideLicenseImageFail) {
                      filePath = state.previousImagePicked?.path ?? '';
                    }
                    if (filePath.trim().isNotEmpty) {
                      return AspectRatio(
                        aspectRatio: 3 / 1.5,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(filePath),
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                )),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      width: 12,
                                      height: 12,
                                      child: SvgPicture.asset(
                                        AppIcons.icClose,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          color:
                                              AppColors.black.withOpacity(0.4),
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(12.5),
                                              bottomLeft: Radius.circular(12))),
                                      child: InkWell(
                                        onTap: () =>
                                            _blocSignUpTourGuideInformationScreen
                                                .add(
                                                    BlocSignUpTourGuideInformationEventRemoveGuideLicenseImage()),
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      );
                    }
                    return DottedBorder(
                        color: AppColors.primary,
                        dashPattern: const [4, 2],
                        radius: const Radius.circular(4),
                        borderType: BorderType.rRect,
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppIcons.cameraFill),
                              const SizedBox(width: 8),
                              Text(
                                'Upload Photo',
                                style: context.textStyle.titleMedium?.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              )
                            ],
                          ),
                        ));
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Identify Card',
            textAlign: TextAlign.start,
            style: context.textStyle.titleMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.transparent,
                borderRadius: BorderRadius.circular(4)),
            child: Material(
              color: AppColors.transparent,
              borderRadius: BorderRadius.circular(4),
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () => _blocSignUpTourGuideInformationScreen.add(
                    BlocSignUpTourGuideInformationEventPickIdentityCardImage()),
                child: BlocBuilder<BlocSignUpTourGuideInformationScreen,
                    BlocSignUpTourGuideInformationState>(
                  buildWhen: (previous, current) =>
                      current
                          is BlocSignUpTourGuideInformationStatePickIdentityCardImageSuccess ||
                      current
                          is BlocSignUpTourGuideInformationStatePickIdentityCardImageFail,
                  builder: (context, state) {
                    String filePath = _blocSignUpTourGuideInformationScreen
                            .imageIdentityCard?.path ??
                        '';
                    if (state
                        is BlocSignUpTourGuideInformationStatePickIdentityCardImageSuccess) {
                      filePath = state.file.path;
                    } else if (state
                        is BlocSignUpTourGuideInformationStatePickIdentityCardImageFail) {
                      filePath = state.previousImagePicked?.path ?? '';
                    }
                    if (filePath.trim().isNotEmpty) {
                      return AspectRatio(
                        aspectRatio: 3 / 1.5,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(filePath),
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                )),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      width: 12,
                                      height: 12,
                                      child: SvgPicture.asset(
                                        AppIcons.icClose,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          color:
                                              AppColors.black.withOpacity(0.4),
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(12.5),
                                              bottomLeft: Radius.circular(12))),
                                      child: InkWell(
                                        onTap: () =>
                                            _blocSignUpTourGuideInformationScreen
                                                .add(
                                                    BlocSignUpTourGuideInformationEventRemoveIdentityCardImage()),
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      );
                    }
                    return DottedBorder(
                        color: AppColors.primary,
                        dashPattern: const [4, 2],
                        radius: const Radius.circular(4),
                        borderType: BorderType.rRect,
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppIcons.cameraFill),
                              const SizedBox(width: 8),
                              Text(
                                'Upload Photo',
                                style: context.textStyle.titleMedium?.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              )
                            ],
                          ),
                        ));
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          AppTextField(
              hintText: 'Languages you can use to guide',
              labelText: 'Languages',
              validator: AppValidator.validateTextFieldLanguage,
              textEditingController: _blocSignUpTourGuideInformationScreen
                  .textEditingControllerLanguages,
              onChange: (value) => _blocSignUpTourGuideInformationScreen.add(
                  BlocSignUpTourGuideInformationEventChangeLanguages(
                      languages: value))),
          const SizedBox(height: 24),
          AppTextField(
            maxLines: 10,
            labelText: 'Introdution',
            textEditingController: _blocSignUpTourGuideInformationScreen
                .textEditingControllerIntroduction,
            validator: AppValidator.validateTextFieldIntroduction,
            onChange: (value) => _blocSignUpTourGuideInformationScreen.add(
                BlocSignUpTourGuideInformationEventChangeIntroduction(
                    introduction: value)),
            inputDecoration: InputDecoration(
                hintText: 'Short introduction about yourself',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        width: 1, color: AppColors.underLineTextFieldColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        width: 1, color: AppColors.underLineTextFieldColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        width: 1, color: AppColors.underLineTextFieldColor))),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Text('Video Introduction',
                  style: context.textStyle.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w500)),
              const SizedBox(width: 22),
              Text('(Optional)',
                  style: context.textStyle.titleMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.colorOptional))
            ],
          ),
          const SizedBox(height: 11),
          Text(
            'A video introduction will more impress Travelers',
            style: context.textStyle.titleMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.textHintColor),
          ),
          const SizedBox(height: 16),
          BlocBuilder<BlocSignUpTourGuideInformationScreen,
              BlocSignUpTourGuideInformationState>(
            buildWhen: (previous, current) =>
                current is BlocSignUpTourGuideInformationStatePickVideoDone,
            builder: (context, state) {
              Map<String, VideoSource>? source =
                  _blocSignUpTourGuideInformationScreen.getSourceVideo(
                      _blocSignUpTourGuideInformationScreen.videoIntroduction);
              if (state is BlocSignUpTourGuideInformationStatePickVideoDone ||
                  source != null) {
                if (state is BlocSignUpTourGuideInformationStatePickVideoDone) {
                  source = state.source;
                }
                if (source != null) {
                  return Stack(
                    children: [
                      AppVideo(
                        source: source,
                        videoViewerController:
                            _blocSignUpTourGuideInformationScreen
                                .videoViewerController,
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 12,
                                height: 12,
                                child: SvgPicture.asset(
                                  AppIcons.icClose,
                                  color: AppColors.white,
                                ),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: AppColors.black.withOpacity(0.2),
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                                child: InkWell(
                                  onTap: () =>
                                      _blocSignUpTourGuideInformationScreen.add(
                                          BlocSignUpTourGuideInformationEventRemoveVideoIntroduction()),
                                ),
                              ),
                            ],
                          ))
                    ],
                  );
                }
              }
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.transparent,
                    borderRadius: BorderRadius.circular(4)),
                child: Material(
                  color: AppColors.transparent,
                  borderRadius: BorderRadius.circular(4),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () => _blocSignUpTourGuideInformationScreen.add(
                          BlocSignUpTourGuideInformationEventPickVideoIntroduction()),
                      child: DottedBorder(
                          color: AppColors.primary,
                          radius: const Radius.circular(4),
                          borderType: BorderType.rRect,
                          dashPattern: const [4, 2],
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppIcons.cameraFill),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Upload Video',
                                  style: context.textStyle.titleMedium
                                      ?.copyWith(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                )
                              ],
                            ),
                          ))),
                ),
              );
            },
          ),
          const SizedBox(height: 44),
          PrimaryButton(
            text: 'Next',
            allCaps: true,
            margin: EdgeInsets.zero,
            onTap: () => _blocSignUpTourGuideInformationScreen
                .add(BlocSignUpTourGuideInformationEventChangeStep(step: 1)),
          )
        ],
      ),
    );
  }
}
