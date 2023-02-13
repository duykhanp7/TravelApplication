import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/res/input_field.dart';
import 'package:travel_booking_tour/res/res.dart';

class ChooseGuideTripInformationPage extends StatefulWidget {
  const ChooseGuideTripInformationPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChooseGuideTripInformationPage();
  }
}

class _ChooseGuideTripInformationPage
    extends State<ChooseGuideTripInformationPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemLightStatusBar);
    return Scaffold(
      appBar: const AppbarAppWidget(
        title: 'Trip information',
      ),
      body: GestureDetector(
        child: Container(
          padding: const EdgeInsets.fromLTRB(40, 30, 40, 50),
          color: AppColors.white,
          child: Column(
            children: [
              AppTextField(
                  hintText: 'mm/dd/yy',
                  obsecureText: false,
                  labelText: 'Date',
                  isDense: true,
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
                        hintText: 'From',
                        obsecureText: false,
                        labelText: 'Time',
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
                        hintText: 'To',
                        obsecureText: false,
                        labelText: '',
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
                  hintText: 'City',
                  obsecureText: false,
                  labelText: 'City',
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
            ],
          ),
        ),
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      ),
    );
  }
}
