import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/features/guide/choose_guide/model/destination_json.dart';
import 'package:travel_booking_tour/res/res.dart';

import '../bloc/bloc_edit_trip_information_event.dart';
import '../bloc/bloc_edit_trip_information_screen.dart';
import '../bloc/bloc_edit_trip_information_state.dart';

class DestinationItem extends StatefulWidget {
  const DestinationItem(
      {super.key, required this.check, required this.destinationJson});
  final bool check;
  final DestinationJson destinationJson;

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
                widget.destinationJson.url ?? '',
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
        Positioned(
            left: 10,
            bottom: 7,
            child: Text(
              widget.destinationJson.name ?? '',
              style: AppStyles.titleSmall.copyWith(color: AppColors.white),
            ))
      ],
    );
  }
}
