import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/common/extension/context_extension.dart';
import 'package:travel_booking_tour/features/guide/detail/widget/my_experience_item.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_journeys/bloc_my_journeys_event.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_journeys/bloc_my_journeys_screen.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_journeys/bloc_my_journeys_state.dart';
import 'package:travel_booking_tour/res/app_inkwell.dart';
import 'package:travel_booking_tour/res/button.dart';
import 'package:travel_booking_tour/res/res.dart';
import 'package:travel_booking_tour/router/routes.dart';

class MyJourneysScreen extends StatefulWidget {
  const MyJourneysScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyJourneysScreen();
  }
}

class _MyJourneysScreen extends State<MyJourneysScreen> {
  late BlocMyJourneysScreen _blocMyJourneysScreen;

  @override
  void initState() {
    _blocMyJourneysScreen = BlocProvider.of<BlocMyJourneysScreen>(context);
    _blocMyJourneysScreen.add(BlocMyJourneysEventInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BlocMyJourneysScreen, BlocMyJourneysState>(
        listenWhen: (previous, current) =>
            current is BlocMyJourneysStateAddJourney ||
            current is BlocMyJourneysStateDeleteJourneys,
        listener: (context, state) async {
          if (state is BlocMyJourneysStateAddJourney) {
            if (state.appResult.state == ResultState.loading) {
              await context.showLoadingBottomSheet();
            } else if (state.appResult.state == ResultState.success) {}
          } else if (state is BlocMyJourneysStateDeleteJourneys) {
            if (state.appResult.state == ResultState.loading) {
              await context.showLoadingBottomSheet();
            } else if (state.appResult.state == ResultState.success) {
              Routes.backTo();
            }
          }
        },
        child: Scaffold(
          appBar: const AppbarApp(
              title: 'My Journeys',
              prefixWidget: AppInkWell(
                voidCallBack: Routes.backTo,
                icon: AppIcons.icBack,
                iconSize: Size(12, 20),
                background: AppColors.transparent,
                iconTint: AppColors.black,
              )),
          backgroundColor: AppColors.white,
          body: SafeArea(
              child: Container(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 32),
            child: Column(
              children: [
                PrimaryActiveButton(
                  text: 'Add Journey',
                  onTap: () => _blocMyJourneysScreen
                      .add(BlocMyJourneysEventClickButtonAddJourney()),
                  borderRadius: BorderRadius.circular(8),
                  height: 40,
                  icon: Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: SvgPicture.asset(AppIcons.icAddBlue,
                          width: 20, height: 20)),
                  textStyle:
                      AppStyles.titleSmall.copyWith(color: AppColors.primary),
                  margin: EdgeInsets.zero,
                  allCaps: false,
                  ripple: AppColors.black.withOpacity(0.1),
                  border: Border.all(width: 1, color: AppColors.primary),
                  color: AppColors.white,
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    child: BlocBuilder<BlocMyJourneysScreen,
                            BlocMyJourneysState>(
                        buildWhen: (previous, current) => checkState(current),
                        builder: (context, state) {
                          if (state is BlocMyJourneysStateLoadJourneys) {
                            if (state.appResult.state == ResultState.loading) {
                              return LayoutBuilder(
                                  builder: (context, constraint) =>
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                            maxHeight: constraint.maxHeight),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: const AppLayoutShimmer(),
                                        ),
                                      ));
                            } else if (state.appResult.state ==
                                ResultState.fail) {
                              return const AppEmptyPage();
                            }
                          }

                          return ListView.separated(
                            separatorBuilder: (context, index) => const Divider(
                              height: 20,
                            ),
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _blocMyJourneysScreen
                                    .userInfoJson?.journeys?.length ??
                                0,
                            itemBuilder: (context, index) => Dismissible(
                                key: UniqueKey(),
                                direction: DismissDirection.endToStart,
                                onDismissed: (direction) {
                                  _blocMyJourneysScreen.add(
                                      BlocMyJourneysEventDeleteJourney(
                                          myExperienceJson:
                                              _blocMyJourneysScreen.userInfoJson
                                                  ?.journeys?[index]));
                                },
                                child: MyExperienceItem(
                                    myExperienceJson: _blocMyJourneysScreen
                                        .userInfoJson?.journeys?[index],
                                    edited: true)),
                          );
                        }),
                  ),
                )
              ],
            ),
          )),
        ));
  }

  bool checkState(BlocMyJourneysState state) {
    if (state is BlocMyJourneysStateLoadJourneys) {
      return true;
    } else if (state is BlocMyJourneysStateDeleteJourneys) {
      if (state.appResult.state == ResultState.success) {
        return true;
      }
    }
    return false;
  }
}
