import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_journeys/bloc_my_journeys_event.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_journeys/bloc_my_journeys_screen.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_journeys/bloc_my_journeys_state.dart';
import 'package:travel_booking_tour/res/dotted_border/dotted_border.dart';
import 'package:travel_booking_tour/res/res.dart';

import '../../../res/input_field.dart';

class ProfileAddMoreJourneys extends StatefulWidget {
  const ProfileAddMoreJourneys({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileAddMoreJourneys();
  }
}

class _ProfileAddMoreJourneys extends State<ProfileAddMoreJourneys> {
  late BlocMyJourneysScreen _blocMyJourneysScreen;

  @override
  void initState() {
    _blocMyJourneysScreen = BlocProvider.of<BlocMyJourneysScreen>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarApp(
          title: 'Add Journey',
          suffixWidget: Container(
              alignment: Alignment.center,
              height: 20,
              margin: const EdgeInsets.only(right: 16),
              child: InkWell(
                  child: Text(
                    'DONE',
                    style: AppStyles.titleMedium.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary),
                  ),
                  onTap: () => _blocMyJourneysScreen
                      .add(BlocMyJourneysEventClickButtonDone())))),
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.fromLTRB(32, 30, 32, 30),
        child: Form(
          key: _blocMyJourneysScreen.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                textEditingController:
                    _blocMyJourneysScreen.journeyNameEditingController,
                hintText: 'Journey’s Name',
                obsecureText: false,
                labelText: 'Name',
                textInputType: TextInputType.emailAddress,
                validator: _blocMyJourneysScreen.validateJourneyName,
                onChange: (value) => {},
              ),
              const SizedBox(height: 30),
              AppTextField(
                textEditingController:
                    _blocMyJourneysScreen.locationOfJourneyEditingController,
                hintText: 'Location of Journey',
                obsecureText: false,
                labelText: 'Location',
                textInputType: TextInputType.emailAddress,
                validator: _blocMyJourneysScreen.validateLocationOfJourneyName,
                onChange: (value) => {},
              ),
              const SizedBox(height: 30),
              InkWell(
                splashColor: AppColors.black.withOpacity(0.1),
                highlightColor: AppColors.black.withOpacity(0.1),
                onTap: () => _blocMyJourneysScreen
                    .add(BlocMyJourneysEventClickButtonUploadPhotos()),
                child: DottedBorder(
                    color: AppColors.primary,
                    dashPattern: const [4, 2],
                    radius: const Radius.circular(4),
                    borderType: BorderType.rRect,
                    child: Container(
                      color: AppColors.transparent,
                      height: 50,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.camera,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Upload Photos',
                            style: AppStyles.titleSmall
                                .copyWith(color: AppColors.primary),
                          )
                        ],
                      ),
                    )),
              ),
              const SizedBox(height: 10),
              BlocBuilder<BlocMyJourneysScreen, BlocMyJourneysState>(
                builder: (context, state) => Visibility(
                    visible: !_blocMyJourneysScreen.isPhotoLoaded,
                    child: Text(
                      '(*) Please upload your photos',
                      style: AppStyles.titleSmall.copyWith(
                          color: AppColors.error,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
