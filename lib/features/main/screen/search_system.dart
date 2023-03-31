import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/data/models/language_json.dart';
import 'package:travel_booking_tour/features/main/bloc/bloc_search_system_event.dart';
import 'package:travel_booking_tour/features/main/bloc/bloc_search_system_screen.dart';
import 'package:travel_booking_tour/features/main/bloc/bloc_search_system_state.dart';
import 'package:travel_booking_tour/features/main/model/type_filter_json.dart';
import 'package:travel_booking_tour/res/res.dart';

import '../../../data/models/tour_detail_json.dart';
import '../../../data/models/tour_guide_detail_json.dart';
import '../../../res/button.dart';
import '../../../res/input_field.dart';
import '../../../router/routes.dart';
import '../../explore/widgets/featured_tour_item.dart';
import '../../explore/widgets/tour_guide_item.dart';

class SearchSystem extends StatefulWidget {
  const SearchSystem({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchSystem();
  }
}

class _SearchSystem extends State<SearchSystem> {
  late BlocSearchSystemScreen _blocSearchSystemScreen;
  late String kerySearch = '';
  @override
  void initState() {
    _blocSearchSystemScreen = BlocProvider.of<BlocSearchSystemScreen>(context);
    _blocSearchSystemScreen.add(BlocSearchSystemEventInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Rebuild Search Syste,');
    return WillPopScope(
      onWillPop: () async {
        debugPrint('On Will Popo');
        _blocSearchSystemScreen.add(BlocSearchSystemEventClearSearch());
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const AppbarAppWidget(),
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
          child: Column(
            children: [
              _buildSearchView(),
              const SizedBox(height: 28),
              _buildBody(context)
            ],
          ),
        )),
      ),
    );
  }

  Widget _buildSearchView() {
    return BlocBuilder<BlocSearchSystemScreen, BlocSearchSystemState>(
      buildWhen: (previous, current) =>
          current is BlocSearchSystemStateSearchingSuccess ||
          current is BlocSearchSystemStateClearSearching,
      builder: (context, state) {
        bool visibilityFilter = false;
        if (state is BlocSearchSystemStateSearchingSuccess) {
          visibilityFilter = true;
        }
        return Container(
          alignment: Alignment.center,
          child: Hero(
              tag: AppConstant.heroSearchView,
              child: Material(
                type: MaterialType.transparency,
                child: AppSearchFilter(
                  hintText: 'Where do you want to explore?',
                  visibilityFilter: visibilityFilter,
                  autofocus: true,
                  onChange: (value) {
                    if (value.isEmpty) {
                      _blocSearchSystemScreen
                          .add(BlocSearchSystemEventClearSearch());
                    }
                  },
                  onClearText: () {
                    _blocSearchSystemScreen
                        .add(BlocSearchSystemEventClearSearch());
                  },
                  onEditingComplete: (value) {
                    if (value.isNotEmpty) {
                      kerySearch = value.trim().replaceAll(RegExp(r'\s+'), ' ');
                      _blocSearchSystemScreen
                          .add(BlocSearchSystemEventSearching());
                    }
                  },
                  onFilterClick: () async {
                    final data = await _showBottomSheetFilter(context);
                    debugPrint('Data Return : ${data ?? 'NUll Data'}');
                  },
                ),
              )),
        );
      },
    );
  }

  Future<T?> _showBottomSheetFilter<T>(BuildContext context) async {
    return await showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) => FractionallySizedBox(
        heightFactor: 2 / 3,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.transparent,
          appBar: AppbarAppWidget(
            background: AppColors.transparent,
            title: 'Filters',
            titleStyle: context.textStyle.titleMedium
                ?.copyWith(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                  left: 32, right: 32, top: 20, bottom: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<BlocSearchSystemScreen, BlocSearchSystemState>(
                    buildWhen: (previous, current) =>
                        current is BlocSearchSystemStateChooseTypeFilter,
                    builder: (context, state) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                              _blocSearchSystemScreen.typeFilters.length,
                              (index) {
                            if (_blocSearchSystemScreen.currentTypeFilter !=
                                null) {
                              final TypeFilterJson typeFilterJson =
                                  _blocSearchSystemScreen.typeFilters[index];
                              if (_blocSearchSystemScreen
                                      .currentTypeFilter!.id ==
                                  typeFilterJson.id) {
                                return PrimaryActiveButton(
                                    allCaps: false,
                                    width: 85,
                                    margin: const EdgeInsets.only(right: 16),
                                    text: typeFilterJson.name ?? '',
                                    onTap: () {
                                      _blocSearchSystemScreen.add(
                                          BlocSearchSystemEventChooseTypeFilter(
                                              typeFilter: typeFilterJson));
                                    });
                              }
                              return PrimaryInactiveButton(
                                  allCaps: false,
                                  width: 85,
                                  margin: const EdgeInsets.only(right: 16),
                                  text: typeFilterJson.name ?? '',
                                  onTap: () {
                                    _blocSearchSystemScreen.add(
                                        BlocSearchSystemEventChooseTypeFilter(
                                            typeFilter: typeFilterJson));
                                  });
                            }
                            return Container();
                          }),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  AppTextField(
                      hintText: 'mm/dd/yy',
                      obsecureText: false,
                      labelText: 'Date',
                      isDense: true,
                      onChange: (p0) {},
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 10, right: 5),
                        child: SvgPicture.asset(
                          AppIcons.icCalendar,
                          width: 20,
                          height: 20,
                        ),
                      ),
                      validator: null),
                  const SizedBox(height: 24),
                  Text(
                    '''Guide's language''',
                    style: context.textStyle.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                        fontStyle: FontStyle.normal),
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<BlocSearchSystemScreen, BlocSearchSystemState>(
                    buildWhen: (previous, current) =>
                        current is BlocSearchSystemStateChooseLanguageFilter,
                    builder: (context, state) {
                      return GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        childAspectRatio: 1 / .27,
                        mainAxisSpacing: 10,
                        children: List.generate(
                            _blocSearchSystemScreen.languages.length, (index) {
                          final LanguageJson languageJson =
                              _blocSearchSystemScreen.languages[index];
                          if (_blocSearchSystemScreen.currentLanguage != null &&
                              _blocSearchSystemScreen.currentLanguage!.id ==
                                  languageJson.id) {
                            return PrimaryActiveButton(
                                allCaps: false,
                                borderRadius: BorderRadius.circular(30),
                                height: 30,
                                margin: const EdgeInsets.only(right: 16),
                                text: languageJson.name ?? '',
                                onTap: () {
                                  _blocSearchSystemScreen.add(
                                      BlocSearchSystemEventChooseLanguageFilter(
                                          languageJson: languageJson));
                                });
                          }
                          return PrimaryInactiveButton(
                              allCaps: false,
                              height: 30,
                              borderRadius: BorderRadius.circular(30),
                              margin: const EdgeInsets.only(right: 16),
                              text: languageJson.name ?? '',
                              onTap: () {
                                _blocSearchSystemScreen.add(
                                    BlocSearchSystemEventChooseLanguageFilter(
                                        languageJson: languageJson));
                              });
                        }),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  AppTextField(
                      hintText: 'Fee',
                      obsecureText: false,
                      labelText: 'Fee',
                      isDense: true,
                      textInputType: TextInputType.number,
                      onChange: (value) {},
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 10, right: 5),
                        child: SvgPicture.asset(
                          AppIcons.icDollarCircle,
                          width: 20,
                          height: 20,
                        ),
                      ),
                      suffixIcon: Text(
                        '(\$/hour)',
                        style: context.textStyle.titleMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.black),
                      ),
                      validator: null),
                  const SizedBox(height: 50),
                  PrimaryActiveButton(
                    text: 'Apply Filters',
                    allCaps: true,
                    onTap: () {
                      Routes.backTo(arguments: {'data': 'Do NGu NGoc'});
                    },
                    margin: EdgeInsets.zero,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ).whenComplete(() {
      _blocSearchSystemScreen.currentLanguage = null;
      _blocSearchSystemScreen.currentTypeFilter =
          _blocSearchSystemScreen.typeFilters[0];
    });
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<BlocSearchSystemScreen, BlocSearchSystemState>(
      buildWhen: (previous, current) =>
          current is BlocSearchSystemStateSearching ||
          current is BlocSearchSystemStateSearchingSuccess ||
          current is BlocSearchSystemStateSearchingFail ||
          current is BlocSearchSystemStateClearSearching,
      builder: (context, state) {
        if (state is BlocSearchSystemStateSearching) {
          debugPrint('_buildLoadingWidget');
          return _buildLoadingWidget();
        } else if (state is BlocSearchSystemStateSearchingSuccess) {
          return _buildBodySuccess(state.itemTourGuides, state.itemsTours);
        } else if (state is BlocSearchSystemStateSearchingFail) {}
        debugPrint('_buildSuggestions');
        return _buildSuggestions();
      },
    );
  }

  Widget _buildBodySuccess(List<TourGuideDetailJson> itemTourGuides,
      List<TourDetailJson> itemsTours) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Guides',
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: context.textStyle.titleLarge?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textOnboardingBlack),
                ),
                const Spacer(),
                Container(
                  height: 20,
                  alignment: Alignment.center,
                  child: Material(
                    color: AppColors.transparent,
                    child: InkWell(
                      splashColor: AppColors.primary.withOpacity(0.1),
                      child: Text(
                        'SEE MORE',
                        style: context.textStyle.titleSmall
                            ?.copyWith(color: AppColors.primary),
                      ),
                      onTap: () {
                        //To do
                      },
                    ),
                  ),
                )
              ],
            ),
            itemTourGuides.isNotEmpty
                ? GridView.count(
                    crossAxisCount: 2,
                    padding: const EdgeInsets.only(top: 17),
                    semanticChildCount: 4,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    childAspectRatio: 1 / 1.35,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                    children: List.generate(
                        4,
                        (index) => TourGuideItem(
                            callback: () {},
                            tourGuideDetailJson: itemTourGuides[index])),
                  )
                : Container(),
            const SizedBox(height: 30),
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tours',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: context.textStyle.titleLarge?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textOnboardingBlack),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 20,
                  alignment: Alignment.center,
                  child: Material(
                    color: AppColors.transparent,
                    child: InkWell(
                      splashColor: AppColors.primary.withOpacity(0.1),
                      child: Text(
                        'SEE MORE',
                        style: context.textStyle.titleSmall
                            ?.copyWith(color: AppColors.primary),
                      ),
                      onTap: () {
                        //To do
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            itemsTours.isNotEmpty
                ? Container(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          itemsTours.length,
                          (index) => FeaturedTourItem(
                                callback: () {},
                                tourDetailJson: itemsTours[index],
                              )),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Expanded(
        child: Container(
      alignment: Alignment.center,
      child: const AppLayoutShimmer(),
    ));
  }

  Widget _buildSuggestions() {
    return Expanded(
      child: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular destinations',
              style: context.textStyle.titleSmall?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textOnboardingBrown),
            ),
            const SizedBox(height: 10),
            Chip(
              label: Text('Da Nang, Viet Nam',
                  style: context.textStyle.titleSmall?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textRadioItalicColor)),
              elevation: 4,
              backgroundColor: AppColors.white,
              shadowColor: AppColors.black.withOpacity(0.5),
            ),
            Chip(
              label: Text('Ho Chi Minh, Viet Nam',
                  style: context.textStyle.titleSmall?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textRadioItalicColor)),
              elevation: 4,
              backgroundColor: AppColors.white,
              shadowColor: AppColors.black.withOpacity(0.5),
            ),
            Chip(
              label: Text('Venice, Viet Nam',
                  style: context.textStyle.titleSmall?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textRadioItalicColor)),
              elevation: 4,
              backgroundColor: AppColors.white,
              shadowColor: AppColors.black.withOpacity(0.5),
            )
          ],
        ),
      ),
    );
  }
}
