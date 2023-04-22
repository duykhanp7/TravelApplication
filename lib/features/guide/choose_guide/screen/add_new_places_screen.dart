import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/features/guide/choose_guide/model/destination_json.dart';
import 'package:travel_booking_tour/features/guide/choose_guide/widget/destination_item.dart';
import 'package:travel_booking_tour/res/app_appbar.dart';
import 'package:travel_booking_tour/res/app_layout_shimmer.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';
import 'package:travel_booking_tour/res/input_field.dart';

import '../../../../common/enum/enums.dart';
import '../../../../res/styles.dart';
import '../bloc/bloc_edit_trip_information_event.dart';
import '../bloc/bloc_edit_trip_information_screen.dart';
import '../bloc/bloc_edit_trip_information_state.dart';

class AddNewPlacesScreen extends StatefulWidget {
  const AddNewPlacesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddNewPlacesScreen();
  }
}

class _AddNewPlacesScreen extends State<AddNewPlacesScreen> {
  final List<String> items = [];
  late BlocTripInformationScreen _blocTripInformationScreen;

  @override
  void initState() {
    items.add('Ha Noi');
    items.add('Ho Chi Minh');
    items.add('Da Nang');

    _blocTripInformationScreen =
        BlocProvider.of<BlocTripInformationScreen>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppbarApp(
          title: 'New Attraction',
          suffixWidget: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 5, right: 16),
            child: Text(
              'DONE',
              style: AppStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: AppColors.primary),
            ),
          ),
        ),
        body: GestureDetector(
          child: Container(
            color: AppColors.white,
            child: Stack(
              children: [_buildBody(), _buildSearchView()],
            ),
          ),
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
        ),
      ),
      onWillPop: () async {
        _blocTripInformationScreen.add(BlocTripInformationEventBack());
        return true;
      },
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: BlocBuilder<BlocTripInformationScreen, BlocTripInformationState>(
        buildWhen: (previous, current) =>
            current is BlocTripInformationStateSearchDestination ||
            current is BlocTripInformationStateClose,
        builder: (context, state) {
          if (state is BlocTripInformationStateSearchDestination) {
            if (state.appResult.state == ResultState.loading) {
              return Container(
                alignment: Alignment.center,
                color: AppColors.white,
                child: const AppLayoutShimmer(),
              );
            } else if (state.appResult.state == ResultState.success) {
              if (state.appResult.result.isNotEmpty) {
                List<DestinationJson> destinations =
                    state.appResult.result as List<DestinationJson>;
                return Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: const EdgeInsets.only(bottom: 50),
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                    children: List.generate(
                        state.appResult.result.length,
                        (index) => DestinationItem(
                              check: true,
                              destinationJson: destinations[index],
                              onClick: (value, check) {},
                            )),
                  ),
                );
              }
              return Container(
                alignment: Alignment.center,
                child: Text(
                  'No trip available, try to find others trip',
                  style: AppStyles.titleMedium
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              );
            }
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildSearchView() {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 30, right: 16),
      child: LayoutBuilder(
        builder: (context, constraint) => Autocomplete<String>(
          optionsBuilder: (textEditingValue) {
            String query = textEditingValue.text;
            if (query.isEmpty) {
              return items;
            }
            return items.where((element) =>
                element.toLowerCase().contains(query.toLowerCase()));
          },
          optionsViewBuilder: (context, onSelected, options) => Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              height: options.length > 4 ? 200 : options.length * 50,
              width: constraint.maxWidth,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.black.withOpacity(0.1),
                        blurRadius: 10,
                        blurStyle: BlurStyle.outer)
                  ]),
              child: ListView.builder(
                  itemExtent: 50,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: AppColors.transparent,
                            borderRadius: index == 0
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))
                                : index == options.length - 1
                                    ? const BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))
                                    : BorderRadius.zero),
                        child: Material(
                            borderRadius: index == 0
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))
                                : index == options.length - 1
                                    ? const BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))
                                    : BorderRadius.zero,
                            color: AppColors.transparent,
                            child: InkWell(
                              borderRadius: index == 0
                                  ? const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))
                                  : index == options.length - 1
                                      ? const BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15))
                                      : BorderRadius.zero,
                              splashColor: AppColors.black.withOpacity(0.2),
                              highlightColor: AppColors.black.withOpacity(0.2),
                              child: Container(
                                  padding: const EdgeInsets.only(left: 24),
                                  alignment: Alignment.centerLeft,
                                  height: 60,
                                  child: Text(options.elementAt(index))),
                              onTap: () {
                                onSelected(options.elementAt(index));
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                            )),
                      ),
                  itemCount: options.length),
            ),
          ),
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) =>
                  Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.black.withOpacity(0.1),
                      blurRadius: 10,
                      blurStyle: BlurStyle.outer)
                ]),
            child: Focus(
                onFocusChange: (value) {
                  if (!value) {
                    String text = textEditingController.text;
                    _blocTripInformationScreen.add(
                        BlocTripInformationEventSearchDestination(name: text));
                  }
                },
                child: AppTextField(
                  focusNode: focusNode,
                  textEditingController: textEditingController,
                  textStyle: AppStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.textOnboardingBlack),
                  inputDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(24, 15, 24, 15),
                      suffixIconConstraints:
                          const BoxConstraints(maxWidth: 40, maxHeight: 30),
                      suffixIcon: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primary,
                        ),
                        child: SvgPicture.asset(
                          AppIcons.icAddBlue,
                          color: AppColors.white,
                        ),
                      ),
                      hintStyle: AppStyles.titleMedium.copyWith(
                          color: AppColors.textHintColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      hintText: 'Type a place',
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0, color: AppColors.white),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0, color: AppColors.white),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 0, color: AppColors.white))),
                )),
          ),
        ),
      ),
    );
  }
}
