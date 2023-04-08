import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_booking_tour/res/app_appbar.dart';
import 'package:travel_booking_tour/res/colors.dart';

import '../../../common/app_constant.dart';
import '../../../res/button.dart';
import '../../../res/icons.dart';
import '../../../res/styles.dart';
import '../../../router/path.dart';
import '../../../router/routes.dart';
import '../model/booking_trip_json.dart';

class TripViewDetail extends StatefulWidget {
  const TripViewDetail({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TripViewDetal();
  }
}

class _TripViewDetal extends State<TripViewDetail> {
  late BookingTripJson bookingTripJson;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> datas =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    bookingTripJson = datas[AppConstant.data] as BookingTripJson;

    return Scaffold(
      appBar: const AppbarApp(
        title: 'Current Trip Detail',
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          _buildBodyTop(),
          const SizedBox(height: 4),
          _buildBodyBottom()
        ],
      ),
    );
  }

  Widget _buildBodyTop() {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset.zero,
                color: AppColors.transparent.withOpacity(0.1),
                blurRadius: 14)
          ],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          color: AppColors.white),
      child: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Image.asset(
                        bookingTripJson.url ?? '',
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.locationWhite),
                          const SizedBox(
                            width: 13,
                          ),
                          Text(
                            '${bookingTripJson.destination}',
                            style: AppStyles.titleSmall.copyWith(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                color: AppColors.white,
                                fontWeight: FontWeight.w100),
                          )
                        ],
                      )),
                  Positioned(
                      bottom: 5,
                      right: 16,
                      child: Container(
                        width: 60,
                        height: 60,
                        padding: const EdgeInsets.all(3),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          child: Image.asset(
                            bookingTripJson.urlTourGuide ?? '',
                          ),
                        ),
                      ))
                ],
              ),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, left: 12, right: 12, bottom: 15),
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Date',
                              style: AppStyles.titleMedium
                                  .copyWith(color: AppColors.black),
                            ),
                            const Spacer(),
                            Text(
                              bookingTripJson.departureDate ?? '00-00-0000',
                              textAlign: TextAlign.start,
                              style: AppStyles.titleMedium.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textOnboardingBrown),
                            )
                          ],
                        ),
                        const SizedBox(height: 9),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Time',
                              style: AppStyles.titleMedium
                                  .copyWith(color: AppColors.black),
                            ),
                            const Spacer(),
                            Text(
                              bookingTripJson.time ?? '8:00AM - 10:00AM',
                              textAlign: TextAlign.start,
                              style: AppStyles.titleMedium.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textOnboardingBrown),
                            )
                          ],
                        ),
                        const SizedBox(height: 9),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Guide',
                              style: AppStyles.titleMedium
                                  .copyWith(color: AppColors.black),
                            ),
                            const Spacer(),
                            Text(
                              bookingTripJson.nameTourGuide ?? '',
                              textAlign: TextAlign.start,
                              style: AppStyles.titleMedium.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primary),
                            )
                          ],
                        ),
                        const SizedBox(height: 9),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Number of travelers',
                              style: AppStyles.titleMedium
                                  .copyWith(color: AppColors.black),
                            ),
                            const Spacer(),
                            Text(
                              '19',
                              textAlign: TextAlign.start,
                              style: AppStyles.titleMedium.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textOnboardingBrown),
                            )
                          ],
                        ),
                        const SizedBox(height: 9),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Attractions',
                              style: AppStyles.titleMedium
                                  .copyWith(color: AppColors.black),
                            ),
                            const SizedBox(height: 5),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: 3,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: 50,
                                      crossAxisSpacing: 15),
                              itemBuilder: (context, index) => Chip(
                                  label: Container(
                                height: 30,
                                padding: const EdgeInsets.all(6),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.locationGreen),
                                    const SizedBox(width: 10),
                                    const Text('Pahm Duy KHang')
                                  ],
                                ),
                              )),
                            )
                          ],
                        ),
                        const SizedBox(height: 9),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Fee',
                              style: AppStyles.titleMedium.copyWith(
                                  color: AppColors.black, fontSize: 24),
                            ),
                            Text(
                              '\$100',
                              textAlign: TextAlign.start,
                              style: AppStyles.titleMedium.copyWith(
                                  color: AppColors.primary, fontSize: 24),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 260,
            decoration: const BoxDecoration(
                color: AppColors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            alignment: Alignment.center,
            child: Material(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: AppColors.transparent,
              child: InkWell(
                highlightColor: AppColors.white.withOpacity(0.1),
                splashColor: AppColors.white.withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                onTap: () {},
              ),
            ),
          ),
          Positioned(
              right: 12,
              top: 12,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    color: AppColors.transparent,
                    child: SvgPicture.asset(AppIcons.icMore),
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: AppColors.transparent,
                    child: Material(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.transparent,
                      child: InkWell(
                        splashColor: AppColors.white.withOpacity(0.1),
                        highlightColor: AppColors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        onTap: () {},
                      ),
                    ),
                  )
                ],
              )),
          Positioned(
              left: 16,
              top: 16,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 40,
                    alignment: Alignment.center,
                    child: Material(
                        color: AppColors.transparent,
                        borderRadius: BorderRadius.circular(100),
                        child: InkWell(
                          splashColor: AppColors.textSkipColor.withOpacity(0.1),
                          highlightColor:
                              AppColors.textSkipColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {},
                        )),
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildBodyBottom() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset.zero,
                color: AppColors.transparent.withOpacity(0.1),
                blurRadius: 14)
          ],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrimaryActiveButton(
            width: 75,
            height: 32,
            text: 'Detail',
            margin: EdgeInsets.zero,
            onTap: () {},
            allCaps: false,
            icon: Container(
              margin: const EdgeInsets.only(right: 3),
              child: SvgPicture.asset(AppIcons.icDetail),
            ),
            border: Border.all(color: AppColors.primary, width: 1),
            textStyle: AppStyles.titleSmall.copyWith(color: AppColors.primary),
            color: AppColors.white,
            ripple: AppColors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          PrimaryActiveButton(
            width: 75,
            height: 32,
            text: 'Chat',
            onTap: () {},
            margin: EdgeInsets.zero,
            allCaps: false,
            icon: Container(
              margin: const EdgeInsets.only(right: 3),
              child: SvgPicture.asset(AppIcons.icChat),
            ),
            ripple: AppColors.white.withOpacity(0.1),
            border: Border.all(color: AppColors.primary, width: 1),
            textStyle: AppStyles.titleSmall.copyWith(color: AppColors.primary),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          PrimaryActiveButton(
            width: 75,
            height: 32,
            text: 'Pay',
            onTap: () => Routes.navigateTo(
                AppPath.payment, {AppConstant.data: bookingTripJson}),
            margin: EdgeInsets.zero,
            ripple: AppColors.white.withOpacity(0.1),
            allCaps: false,
            icon: Container(
              margin: const EdgeInsets.only(right: 3),
              child: SvgPicture.asset(AppIcons.icPay),
            ),
            border: Border.all(color: AppColors.primary, width: 1),
            textStyle: AppStyles.titleSmall.copyWith(color: AppColors.primary),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(6),
          )
        ],
      ),
    );
  }
}
