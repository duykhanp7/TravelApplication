import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/features/my_trip/model/booking_trip_json.dart';
import 'package:travel_booking_tour/res/button.dart';

import '../../../res/colors.dart';
import '../../../res/icons.dart';

class BookingTripItem extends StatefulWidget {
  const BookingTripItem({
    super.key,
    required this.callback,
    required this.bookingTripJson,
  });
  final VoidCallback callback;
  final BookingTripJson bookingTripJson;
  @override
  State<StatefulWidget> createState() {
    return _BookingTripItem();
  }
}

class _BookingTripItem extends State<BookingTripItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      borderOnForeground: true,
      semanticContainer: true,
      child: Container(
        height: 320,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: AppColors.white),
        child: Stack(
          children: [
            Column(
              children: [
                Flexible(
                    flex: 1,
                    child: Stack(
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
                              widget.bookingTripJson.url ?? '',
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
                                  '${widget.bookingTripJson.destination}',
                                  style: context.textStyle.titleSmall?.copyWith(
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w100),
                                )
                              ],
                            ))
                      ],
                    )),
                Flexible(
                    flex: 1,
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 10, left: 12, right: 12),
                          decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      widget.bookingTripJson.destination ?? '',
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textStyle.titleMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.calendarWhite,
                                    width: 14,
                                    height: 14,
                                  ),
                                  const SizedBox(
                                    width: 9,
                                  ),
                                  Text(
                                    widget.bookingTripJson.departureDate ??
                                        '00-00-0000',
                                    style: context.textStyle.titleSmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color:
                                                AppColors.textOnboardingBrown),
                                  )
                                ],
                              ),
                              const SizedBox(height: 9),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.clock,
                                    width: 14,
                                    height: 14,
                                  ),
                                  const SizedBox(
                                    width: 9,
                                  ),
                                  Text(
                                    '${widget.bookingTripJson.departureDate}',
                                    style: context.textStyle.titleSmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color:
                                                AppColors.textOnboardingBrown),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              const SizedBox(height: 9),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.icPerson,
                                    width: 14,
                                    height: 14,
                                  ),
                                  const SizedBox(
                                    width: 9,
                                  ),
                                  Text(
                                    '${widget.bookingTripJson.nameTourGuide}',
                                    style: context.textStyle.titleSmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color:
                                                AppColors.textOnboardingBrown),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                alignment: Alignment.center,
                                height: 40,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        child:
                                            SvgPicture.asset(AppIcons.icDetail),
                                      ),
                                      border: Border.all(
                                          color: AppColors.primary, width: 1),
                                      textStyle: context.textStyle.titleSmall!
                                          .copyWith(color: AppColors.primary),
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
                                        child:
                                            SvgPicture.asset(AppIcons.icChat),
                                      ),
                                      ripple: AppColors.white.withOpacity(0.1),
                                      border: Border.all(
                                          color: AppColors.primary, width: 1),
                                      textStyle: context.textStyle.titleSmall!
                                          .copyWith(color: AppColors.primary),
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    PrimaryActiveButton(
                                      width: 75,
                                      height: 32,
                                      text: 'Pay',
                                      onTap: () {},
                                      margin: EdgeInsets.zero,
                                      ripple: AppColors.white.withOpacity(0.1),
                                      allCaps: false,
                                      icon: Container(
                                        margin: const EdgeInsets.only(right: 3),
                                        child: SvgPicture.asset(AppIcons.icPay),
                                      ),
                                      border: Border.all(
                                          color: AppColors.primary, width: 1),
                                      textStyle: context.textStyle.titleSmall!
                                          .copyWith(color: AppColors.primary),
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(6),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            top: 13,
                            right: 16,
                            child: Container(
                              width: 60,
                              height: 60,
                              padding: const EdgeInsets.all(3),
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                                child: Image.asset(
                                  widget.bookingTripJson.urlTourGuide ?? '',
                                ),
                              ),
                            ))
                      ],
                    )),
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
                  onTap: widget.callback,
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
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(7),
                      width: 140,
                      height: 40,
                      decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                              color: AppColors.black.withOpacity(0.2),
                              width: 1)),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.icDone),
                          const SizedBox(width: 8),
                          Text(
                            'Mark Finshed',
                            style: context.textStyle.titleSmall,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 40,
                      alignment: Alignment.center,
                      child: Material(
                          color: AppColors.transparent,
                          borderRadius: BorderRadius.circular(100),
                          child: InkWell(
                            splashColor:
                                AppColors.textSkipColor.withOpacity(0.1),
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
      ),
    );
  }
}
