import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/data/model/news_json.dart';

import '../../../common/enum/enums.dart';
import '../../../data/model/tour_detail_json.dart';
import '../../../data/model/tour_guide_detail_json.dart';

abstract class BlocExploreEvent extends Equatable {}

class BlocExploreEventInitial extends BlocExploreEvent {
  final List<TypeDestination>? objects;
  BlocExploreEventInitial({required this.objects});
  @override
  List<Object?> get props => [objects];
}

class BlocExploreEventReloadData extends BlocExploreEvent {
  @override
  List<Object?> get props => [];
}

class BlocExploreEventOnTourClick extends BlocExploreEvent {
  BlocExploreEventOnTourClick({required this.tourDetailJson});
  final TourDetailJson tourDetailJson;
  @override
  List<Object?> get props => [tourDetailJson];
}

class BlocExploreEventOnBestGuideClick extends BlocExploreEvent {
  BlocExploreEventOnBestGuideClick({required this.tourGuideDetailJson});
  final TourGuideDetailJson tourGuideDetailJson;
  @override
  List<Object?> get props => [tourGuideDetailJson];
}

class BlocExploreEventOnSeeMoreClick extends BlocExploreEvent {
  BlocExploreEventOnSeeMoreClick({required this.seeMoreType});
  final SeeMoreType seeMoreType;
  @override
  List<Object?> get props => [seeMoreType];
}

class BlocExploreEventOnNewsClick extends BlocExploreEvent {
  BlocExploreEventOnNewsClick(this.context, this.isShow,
      {required this.newsJson});
  final NewsJson newsJson;
  final BuildContext context;
  final bool isShow;
  @override
  List<Object?> get props => [newsJson, context];
}

class BlocExploreEventLoadDetailNews extends BlocExploreEvent {
  BlocExploreEventLoadDetailNews({required this.newsJson});
  final NewsJson newsJson;
  @override
  List<Object?> get props => [newsJson];
}
