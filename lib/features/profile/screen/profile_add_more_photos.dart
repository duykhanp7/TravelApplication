import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/features/profile/bloc/bloc_profile_screen.dart';
import 'package:travel_booking_tour/features/profile/bloc/bloc_profile_state.dart';
import 'package:travel_booking_tour/features/profile/widget/photo_item.dart';
import 'package:travel_booking_tour/res/res.dart';

import '../bloc/bloc_profile_event.dart';

class ProfileAddMorePhotos extends StatefulWidget {
  const ProfileAddMorePhotos({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileAddMorePhotos();
  }
}

class _ProfileAddMorePhotos extends State<ProfileAddMorePhotos> {
  late BlocProfileScreen _blocProfileScreen;

  @override
  void initState() {
    _blocProfileScreen = BlocProvider.of<BlocProfileScreen>(context);
    _blocProfileScreen.add(BlocProfileEventLoadLocalImages());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarApp(
        title: 'Add Photos',
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
            onTap: () {},
          ),
        ),
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
        child: BlocBuilder<BlocProfileScreen, BlocProfileState>(
          buildWhen: (previous, current) =>
              current is BlocProfileStateLoadLocalImages,
          builder: (context, state) {
            List<File> files = [File('')];
            if (state is BlocProfileStateLoadLocalImages) {
              if (state.appResult.state == ResultState.success) {
                files.addAll(state.appResult.result as List<File>);
              }
            }
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1,
                    crossAxisCount: 3,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3),
                shrinkWrap: false,
                itemCount: files.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => index == 0
                    ? _buildTakePhotoWidget()
                    : PhotoItem(file: files[index], selected: false));
          },
        ),
      )),
    );
  }

  Widget _buildTakePhotoWidget() {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.primary)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppIcons.camera,
                color: AppColors.primary,
              ),
              const SizedBox(height: 6),
              Text(
                'Take Photo',
                style: AppStyles.titleSmall.copyWith(color: AppColors.primary),
              )
            ],
          ),
        ),
        Material(
          color: AppColors.transparent,
          child: InkWell(
            onTap: () {},
            child: Container(
              color: AppColors.transparent,
            ),
          ),
        )
      ],
    );
  }
}
