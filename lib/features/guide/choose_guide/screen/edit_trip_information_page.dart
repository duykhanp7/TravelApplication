import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/features/guide/choose_guide/bloc/bloc_edit_trip_information_state.dart';
import 'package:travel_booking_tour/features/guide/choose_guide/model/destination_json.dart';
import 'package:travel_booking_tour/features/guide/choose_guide/widget/destination_item.dart';
import 'package:travel_booking_tour/res/button.dart';
import 'package:travel_booking_tour/res/input_field.dart';
import 'package:travel_booking_tour/res/res.dart';

import '../../../../common/enum/enums.dart';
import '../bloc/bloc_edit_trip_information_event.dart';
import '../bloc/bloc_edit_trip_information_screen.dart';

class EditTripInformationScreen extends StatefulWidget {
  const EditTripInformationScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _EditTripInformationScreen();
  }
}

class _EditTripInformationScreen extends State<EditTripInformationScreen> {
  late BlocTripInformationScreen _blocTripInformationScreen;
  EditTripInformationMode editTripInformationMode =
      EditTripInformationMode.createNewTrip;

  @override
  void initState() {
    _blocTripInformationScreen =
        BlocProvider.of<BlocTripInformationScreen>(context);
    _blocTripInformationScreen.add(BlocTripInformationEventInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemLightStatusBar);

    Map<String, dynamic> datas =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    editTripInformationMode =
        datas[AppConstant.tripInformationMode] as EditTripInformationMode;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppbarApp(
        title: editTripInformationMode ==
                EditTripInformationMode.editTripInformation
            ? 'Trip information'
            : 'Create New Trip',
      ),
      body: SafeArea(
          child: GestureDetector(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: _buildBody(),
        ),
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      )),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.fromLTRB(40, 30, 40, 50),
      color: AppColors.white,
      child: Column(
        children: [
          _buildFieldsInput(),
          _buidldAttractionsWidget(),
          const SizedBox(
            height: 40,
          ),
          PrimaryActiveButton(
            text: 'DONE',
            allCaps: true,
            margin: const EdgeInsets.all(0),
            onTap: () {
              _blocTripInformationScreen.add(BlocTripInformationEventDone());
            },
          )
        ],
      ),
    );
  }

  Widget _buildFieldsInput() {
    return Column(
      children: [
        Visibility(
            visible: editTripInformationMode ==
                EditTripInformationMode.createNewTrip,
            child: Column(
              children: [
                AppTextField(
                    textEditingController:
                        _blocTripInformationScreen.textEditingControllerDate,
                    hintText: '',
                    obsecureText: false,
                    labelText: 'Where do you want to explore?',
                    isDense: true,
                    onChange: (value) => _blocTripInformationScreen
                        .add(BlocTripInformationEventChangeDate(date: value)),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 10, right: 5),
                      child: SvgPicture.asset(
                        AppIcons.icLocationBorderBlack,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    validator: null),
                const SizedBox(
                  height: 20,
                )
              ],
            )),
        AppTextField(
            textEditingController:
                _blocTripInformationScreen.textEditingControllerDate,
            hintText: 'mm/dd/yy',
            obsecureText: false,
            labelText: 'Date',
            isDense: true,
            onChange: (value) => _blocTripInformationScreen
                .add(BlocTripInformationEventChangeDate(date: value)),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 5),
              child: SvgPicture.asset(
                AppIcons.icCalendar,
                width: 20,
                height: 20,
              ),
            ),
            validator: null),
        const SizedBox(height: 20),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: AppTextField(
                  textEditingController:
                      _blocTripInformationScreen.textEditingControllerTimeFrom,
                  hintText: 'From',
                  obsecureText: false,
                  labelText: 'Time',
                  onChange: (value) => _blocTripInformationScreen.add(
                      BlocTripInformationEventChangeTimeFrom(timeFrom: value)),
                  isDense: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 5),
                    child: SvgPicture.asset(
                      AppIcons.icClock,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  validator: null),
            ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
              flex: 1,
              child: AppTextField(
                  textEditingController:
                      _blocTripInformationScreen.textEditingControllerTimeTo,
                  hintText: 'To',
                  obsecureText: false,
                  labelText: '',
                  onChange: (value) => _blocTripInformationScreen
                      .add(BlocTripInformationEventChangeTimeTo(timeTo: value)),
                  isDense: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 5),
                    child: SvgPicture.asset(
                      AppIcons.icClock,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  validator: null),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Visibility(
            visible: editTripInformationMode ==
                EditTripInformationMode.editTripInformation,
            child: Column(
              children: [
                AppTextField(
                    textEditingController:
                        _blocTripInformationScreen.textEditingControllerCity,
                    hintText: 'City',
                    obsecureText: false,
                    labelText: 'City',
                    onChange: (value) => _blocTripInformationScreen
                        .add(BlocTripInformationEventChangeCity(city: value)),
                    isDense: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 10, right: 5),
                      child: SvgPicture.asset(
                        AppIcons.icLocationBorderBlack,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    validator: null),
                const SizedBox(
                  height: 24,
                )
              ],
            )),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Number of travelers',
            style: AppStyles.titleMedium.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.black),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.chipBg,
                      borderRadius: BorderRadius.circular(4)),
                  width: 40,
                  height: 35,
                  alignment: Alignment.center,
                  child: SvgPicture.asset(AppIcons.icDown),
                ),
                Container(
                  color: AppColors.transparent,
                  width: 40,
                  height: 35,
                  child: Material(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () => _blocTripInformationScreen.add(
                          BlocTripInformationEventSubtractNumberOfTravelers()),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              alignment: Alignment.center,
              width: 90,
              child: AppTextField(
                textEditingController: _blocTripInformationScreen
                    .textEditingControllerNumberOfTravelers,
                textAlign: TextAlign.center,
                onChange: (value) => _blocTripInformationScreen.add(
                    BlocTripInformationEventChangeNumberOfTravelers(
                        numberOfTravelers: value)),
                textInputType: TextInputType.number,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.chipBg,
                      borderRadius: BorderRadius.circular(4)),
                  width: 40,
                  height: 35,
                  alignment: Alignment.center,
                  child: SvgPicture.asset(AppIcons.icUp),
                ),
                Container(
                  color: AppColors.transparent,
                  width: 40,
                  height: 35,
                  child: Material(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () => _blocTripInformationScreen
                          .add(BlocTripInformationEventAddNumberOfTravelers()),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        Visibility(
            visible: editTripInformationMode ==
                EditTripInformationMode.createNewTrip,
            child: Column(
              children: [
                const SizedBox(height: 24),
                AppTextField(
                    hintText: 'Fee',
                    obsecureText: false,
                    labelText: 'Fee',
                    isDense: true,
                    textInputType: TextInputType.number,
                    onChange: (value) {},
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 10, right: 5),
                      child: SvgPicture.asset(
                        AppIcons.icDollarCircle,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    suffixIcon: Text(
                      '(\$/hour)',
                      style: AppStyles.titleMedium.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.black),
                    ),
                    validator: null),
                const SizedBox(height: 24),
                AppTextField(
                    textEditingController:
                        _blocTripInformationScreen.textEditingControllerDate,
                    hintText: '',
                    obsecureText: false,
                    labelText: 'Guide’s Language',
                    isDense: true,
                    onChange: (value) => _blocTripInformationScreen
                        .add(BlocTripInformationEventChangeDate(date: value)),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 10, right: 5),
                      child: SvgPicture.asset(
                        AppIcons.icEarth,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    validator: null),
              ],
            ))
      ],
    );
  }

  Widget _buidldAttractionsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Attractions',
            style: AppStyles.titleMedium.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.black),
          ),
        ),
        BlocBuilder<BlocTripInformationScreen, BlocTripInformationState>(
          buildWhen: (previous, current) =>
              current is BlocTripInformationStateLoadDestination,
          builder: (context, state) {
            if (state is BlocTripInformationStateLoadDestination) {
              if (state.appResult.state == ResultState.success) {
                List<DestinationJson> items =
                    state.appResult.result as List<DestinationJson>;
                if (items.isNotEmpty) {
                  return Container(
                      margin: const EdgeInsets.only(top: 16),
                      alignment: Alignment.center,
                      child: GridView(
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 3 / 2,
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        children: List.generate(
                            4,
                            (index) => index == 0
                                ? _buildWigetAddDestination()
                                : DestinationItem(
                                    check: false,
                                    destinationJson: items[index],
                                  )),
                      ));
                } else {
                  return Container(
                    alignment: Alignment.centerLeft,
                    width: 150,
                    height: 100,
                    child: _buildWigetAddDestination(),
                  );
                }
              } else if (state.appResult.state == ResultState.fail) {
                return Container(
                  alignment: Alignment.centerLeft,
                  width: 150,
                  height: 100,
                  child: _buildWigetAddDestination(),
                );
              }
            }
            return const SizedBox(
              height: 200,
              child: AppLayoutShimmer(),
            );
          },
        )
      ],
    );
  }

  Widget _buildWigetAddDestination() {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: AppColors.chipBg)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.icAddBlue),
              const SizedBox(
                width: 8,
              ),
              const Text(
                'Add New',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          color: AppColors.transparent,
          child: Material(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.transparent,
            child: InkWell(
              highlightColor: AppColors.white.withOpacity(0.5),
              splashColor: AppColors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                _blocTripInformationScreen
                    .add(BlocTripInformationEventChangeAddNewAttractions());
              },
            ),
          ),
        )
      ],
    );
  }
}
