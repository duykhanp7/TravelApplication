import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel_booking_tour/features/auth/signup/widget/timeline_widget.dart';
import 'package:travel_booking_tour/features/payment/bloc/bloc_payment_event.dart';
import 'package:travel_booking_tour/features/payment/bloc/bloc_payment_screen.dart';
import 'package:travel_booking_tour/features/payment/bloc/bloc_payment_state.dart';
import 'package:travel_booking_tour/res/button.dart';
import 'package:travel_booking_tour/res/res.dart';
import 'package:travel_booking_tour/router/routes.dart';

import '../../../common/app_constant.dart';
import '../../../res/input_field.dart';
import '../../../router/path.dart';
import '../../my_trip/model/booking_trip_json.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PaymentScreen();
  }
}

class _PaymentScreen extends State<PaymentScreen> {
  late BookingTripJson bookingTripJson;
  late BlocPaymentScreen _blocPaymentScreen;
  late FToast fToast;

  @override
  void initState() {
    _blocPaymentScreen = BlocProvider.of<BlocPaymentScreen>(context);
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> datas =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    bookingTripJson = datas[AppConstant.data] as BookingTripJson;

    return WillPopScope(
      onWillPop: () async {
        debugPrint('WillPopScope');
        if (_blocPaymentScreen.currentStep == 0) {
          Routes.backTo();
          _blocPaymentScreen.currentStep = 0;
          return true;
        }
        _blocPaymentScreen.add(
            BlocPaymentEventNextStep(step: --_blocPaymentScreen.currentStep));
        return false;
      },
      child: Scaffold(
        appBar: AppbarApp(
          title: 'Payment',
          voidCallBack: () {
            _blocPaymentScreen.add(BlocPaymentEventNextStep(step: 0));
            Routes.backToUntilPage(AppPath.mainScreen);
          },
        ),
        backgroundColor: AppColors.white,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 22, 32, 0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocBuilder<BlocPaymentScreen, BlocPaymentState>(
              buildWhen: (previous, current) =>
                  current is BlocPaymentStateNextStep,
              builder: (context, state) {
                return Column(
                  children: [
                    TimelineWidget(
                        paddingParent:
                            const EdgeInsets.only(left: 20, right: 20),
                        currentStep: _blocPaymentScreen.currentStep,
                        titles: const ['Payment Method', 'Preview & Check out'],
                        padding: const EdgeInsets.only(left: 10)),
                    const SizedBox(height: 35),
                    _blocPaymentScreen.currentStep == 0
                        ? _buildPaymentMethod()
                        : _buildPreviewAndCheckout(),
                    const SizedBox(height: 20),
                    PrimaryActiveButton(
                      text: _blocPaymentScreen.currentStep == 0
                          ? 'Next'
                          : 'Check out',
                      onTap: () {
                        if (_blocPaymentScreen.currentStep == 0) {
                          _blocPaymentScreen.add(BlocPaymentEventNextStep(
                              step: ++_blocPaymentScreen.currentStep));
                          debugPrint(
                              '_blocPaymentScreen.currentStep ${_blocPaymentScreen.currentStep}');
                        } else if (_blocPaymentScreen.currentStep == 1) {
                          _blocPaymentScreen
                              .add(BlocPaymentEventNextStep(step: 0));
                          Routes.backToUntilPage(AppPath.mainScreen);
                          fToast.showToast(
                              child: Container(
                                height: 50,
                                margin: const EdgeInsets.only(bottom: 250),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.success),
                                padding:
                                    const EdgeInsets.fromLTRB(20, 16, 20, 16),
                                child: Text(
                                  'Thanks! Check out successfully. Enjoy your trip!',
                                  style: AppStyles.titleSmall.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white),
                                ),
                              ),
                              gravity: ToastGravity.TOP,
                              toastDuration: const Duration(seconds: 3));
                        }
                      },
                      allCaps: true,
                      margin: EdgeInsets.zero,
                    )
                  ],
                );
              },
            ),
          ),
        )),
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppIcons.icCardInformation),
                  const SizedBox(width: 8),
                  Text(
                    'Card Information',
                    style: AppStyles.headlineLarge
                        .copyWith(fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(height: 42),
              AppTextField(
                hintText: 'Card Holder’s Name',
                obsecureText: false,
                labelText: 'Card Holder’s Name',
                textInputType: TextInputType.text,
                onChange: (value) {},
              ),
              const SizedBox(height: 26),
              AppTextField(
                hintText: '0000 0000 0000 0000',
                obsecureText: false,
                labelText: 'Card Number',
                textInputType: TextInputType.number,
                onChange: (value) {},
              ),
              const SizedBox(height: 26),
              Row(
                children: [
                  AppTextField(
                    width: 150,
                    hintText: 'mm/yy',
                    obsecureText: false,
                    labelText: 'Expiration Date',
                    textInputType: TextInputType.number,
                    onChange: (value) {},
                  ),
                  const Spacer(),
                  AppTextField(
                    width: 150,
                    hintText: '000',
                    obsecureText: false,
                    labelText: 'CVV',
                    textInputType: TextInputType.number,
                    onChange: (value) {},
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 61,
          )
        ],
      ),
    );
  }

  Widget _buildPreviewAndCheckout() {
    return Container(
      alignment: Alignment.center,
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
                                      mainAxisExtent: 45,
                                      crossAxisSpacing: 10),
                              itemBuilder: (context, index) => Chip(
                                  label: SizedBox(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.locationGreen),
                                    const SizedBox(width: 5),
                                    const Text('Pahm Duy KHang')
                                  ],
                                ),
                              )),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: AppStyles.headlineLarge.copyWith(
                      color: AppColors.black, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Text(
                  '\$200',
                  textAlign: TextAlign.start,
                  style: AppStyles.headlineLarge.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.primary),
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '50% payment',
                  style: AppStyles.titleMedium.copyWith(
                      color: AppColors.textByAgreeColor,
                      fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Text(
                  '\$200',
                  textAlign: TextAlign.start,
                  style: AppStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.primary),
                )
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '(You just need to pay upfront 50%)',
              style: AppStyles.titleSmall.copyWith(
                  color: AppColors.textByAgreeColor,
                  fontWeight: FontWeight.w400),
            )
          ],
        ));
  }
}
