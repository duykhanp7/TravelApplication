import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/common/extension/context_extension.dart';
import 'package:travel_booking_tour/features/terms_and_conditions/bloc/bloc_terms_and_conditions_event.dart';
import 'package:travel_booking_tour/features/terms_and_conditions/bloc/bloc_terms_and_conditions_screen.dart';
import 'package:travel_booking_tour/features/terms_and_conditions/bloc/bloc_terms_and_conditions_state.dart';
import 'package:travel_booking_tour/res/app_appbar.dart';
import 'package:travel_booking_tour/res/app_layout_shimmer.dart';
import 'package:travel_booking_tour/res/colors.dart';

import '../../common/enum/enums.dart';
import '../../res/system.dart';
import '../../router/routes.dart';

class TermAndConditionScreen extends StatefulWidget {
  const TermAndConditionScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TermAndConditionScreen();
  }
}

class _TermAndConditionScreen extends State<TermAndConditionScreen> {
  late BlocTermsAndConditionsScreen _blocTermsAndConditionsScreen;

  @override
  void initState() {
    _blocTermsAndConditionsScreen =
        BlocProvider.of<BlocTermsAndConditionsScreen>(context);
    _blocTermsAndConditionsScreen.add(BlocTermsAndConditionsEventInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemStyle);
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppbarAppWidget(
        title: 'Terms and conditions',
        prefixWidget: Container(
          width: 25,
          height: 25,
          color: AppColors.transparent,
          child: Material(
            color: AppColors.transparent,
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              child: const Icon(
                Icons.close,
                color: AppColors.white,
                size: 25,
              ),
              onTap: () => Routes.backTo(),
            ),
          ),
        ),
        titleStyle: context.textStyle.titleMedium?.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            color: AppColors.white),
        background: AppColors.primary,
      ),
      body: SafeArea(
          child: Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        alignment: Alignment.center,
        child: BlocBuilder<BlocTermsAndConditionsScreen,
            BlocTermsAndConditionsState>(
          builder: (context, state) {
            if (state is BlocTermsAndConditionsStateLoading) {
              if (state.appResult.state == ResultState.success) {
                final termsAndConditions = state.appResult.result;
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: termsAndConditions.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: TextAlign.start,
                      '\u2022 ${termsAndConditions[index]}',
                      style: context.textStyle.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400, color: AppColors.white),
                    ),
                  ),
                );
              }
            }
            return const AppLayoutShimmer();
          },
        ),
      )),
    );
  }
}
