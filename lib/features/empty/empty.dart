import 'package:flutter/material.dart';
import 'package:travel_booking_tour/res/colors.dart';

import '../../res/styles.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        color: AppColors.primary,
        child: Text(
          'Something go wrong!',
          style: AppStyles.titleLarge.copyWith(color: AppColors.white),
        ),
      )),
    );
  }
}
