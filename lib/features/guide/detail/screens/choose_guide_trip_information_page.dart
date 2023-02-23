import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/features/guide/detail/blocs/bloc_trip_information_event.dart';
import 'package:travel_booking_tour/features/guide/detail/blocs/bloc_trip_information_screen.dart';
import 'package:travel_booking_tour/features/guide/detail/widgets/destination_item.dart';
import 'package:travel_booking_tour/res/button.dart';
import 'package:travel_booking_tour/res/input_field.dart';
import 'package:travel_booking_tour/res/res.dart';

class ChooseGuideTripInformationScreen extends StatefulWidget {
  const ChooseGuideTripInformationScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChooseGuideTripInformationScreen();
  }
}

class _ChooseGuideTripInformationScreen
    extends State<ChooseGuideTripInformationScreen> {
  late BlocTripInformationScreen _blocTripInformationScreen;

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
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppbarAppWidget(
        title: 'Trip information',
      ),
      body: SafeArea(
          child: GestureDetector(
        child: SingleChildScrollView(
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
          PrimaryButton(
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
        const SizedBox(
          height: 20,
        ),
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
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Number of travelers',
            style: context.textStyle.titleMedium?.copyWith(
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
        )
      ],
    );
  }

  Widget _buidldAttractionsWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      alignment: Alignment.center,
      child: GridView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 2,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        children: List.generate(
            4,
            (index) => index == 0
                ? _buildWigetAddDestination()
                : const DestinationItem(
                    check: false,
                  )),
      ),
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
              border: Border.all(width: 1, color: AppColors.primary)),
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
