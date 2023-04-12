import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/res/app_appbar.dart';
import 'package:travel_booking_tour/res/dotted_border/dotted_border.dart';
import 'package:travel_booking_tour/res/icons.dart';
import 'package:travel_booking_tour/router/routes.dart';

import '../../../res/colors.dart';
import '../../../res/input_field.dart';
import '../../../res/styles.dart';

class ProfileAddMoreJourneys extends StatefulWidget {
  const ProfileAddMoreJourneys({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileAddMoreJourneys();
  }
}

class _ProfileAddMoreJourneys extends State<ProfileAddMoreJourneys> {
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
                  onTap: () =>
                      Routes.backTo(arguments: {'a': 'Pham Duy Khang'})))),
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.fromLTRB(32, 30, 32, 30),
        child: Column(
          children: [
            AppTextField(
              hintText: 'Journey’s Name',
              obsecureText: false,
              labelText: 'Name',
              textInputType: TextInputType.emailAddress,
              validator: null,
              onChange: (value) => {},
            ),
            const SizedBox(height: 30),
            AppTextField(
              hintText: 'Location of Journey',
              obsecureText: false,
              labelText: 'Location',
              textInputType: TextInputType.emailAddress,
              validator: null,
              onChange: (value) => {},
            ),
            const SizedBox(height: 30),
            InkWell(
              splashColor: AppColors.black.withOpacity(0.1),
              highlightColor: AppColors.black.withOpacity(0.1),
              onTap: () {},
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
            )
          ],
        ),
      )),
    );
  }
}
