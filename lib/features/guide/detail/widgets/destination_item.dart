import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/features/guide/detail/blocs/bloc_trip_information_event.dart';
import 'package:travel_booking_tour/features/guide/detail/blocs/bloc_trip_information_screen.dart';
import 'package:travel_booking_tour/features/guide/detail/blocs/bloc_trip_information_state.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';
import 'package:travel_booking_tour/res/images.dart';

class DestinationItem extends StatefulWidget {
  const DestinationItem({super.key, required this.check});

  final bool check;

  @override
  State<StatefulWidget> createState() {
    return _DestinationItem();
  }
}

class _DestinationItem extends State<DestinationItem> {
  bool check = false;
  @override
  void initState() {
    check = widget.check;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                AppImages.daNangBanaHoiAn,
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
              Container(
                color: AppColors.transparent,
                child: Material(
                  color: AppColors.transparent,
                  child: InkWell(
                    highlightColor: AppColors.white.withOpacity(0.2),
                    splashColor: AppColors.white.withOpacity(0.2),
                    onTap: () {
                      if (check) {
                        check = false;
                        BlocProvider.of<BlocTripInformationScreen>(context)
                            .add(BlocTripInformationEventUnCheckAttractions());
                      } else {
                        check = true;
                        BlocProvider.of<BlocTripInformationScreen>(context)
                            .add(BlocTripInformationEventCheckAttractions());
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        BlocBuilder<BlocTripInformationScreen, BlocTripInformationState>(
          builder: (context, state) => Positioned(
              top: 10,
              right: 10,
              child: Container(
                color: AppColors.transparent,
                child: SvgPicture.asset(
                  check ? AppIcons.icCheck : AppIcons.icUncheck,
                  width: 24,
                  height: 24,
                ),
              )),
        ),
      ],
    );
  }
}
