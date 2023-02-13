import 'package:flutter/material.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/res/colors.dart';

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
          style: context.textStyle.titleLarge?.copyWith(color: AppColors.white),
        ),
      )),
    );
  }
}
