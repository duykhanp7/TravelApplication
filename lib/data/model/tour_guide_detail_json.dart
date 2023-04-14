// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:travel_booking_tour/data/model/my_experience_json.dart';
import 'package:travel_booking_tour/data/model/review_json.dart';
// required: associates our `main.dart` with the code generated by Freezed
part 'tour_guide_detail_json.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'tour_guide_detail_json.g.dart';

@freezed
class TourGuideDetailJson with _$TourGuideDetailJson {
  const factory TourGuideDetailJson(
      {int? id,
      String? coverImageUrl,
      String? profileImageUrl,
      String? name,
      int? rating,
      List<String>? languages,
      String? address,
      String? description,
      String? videoIntroductionUrl,
      Map<String, String>? prices,
      List<ReviewJson>? reviews,
      List<MyExperienceJson>? experiences}) = _TourGuideDetailJson;

  factory TourGuideDetailJson.fromJson(Map<String, Object?> json) =>
      _$TourGuideDetailJsonFromJson(json);
}