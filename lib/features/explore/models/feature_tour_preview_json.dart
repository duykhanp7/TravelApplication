// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'feature_tour_preview_json.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'feature_tour_preview_json.g.dart';

@freezed
class FeatureTourJson with _$FeatureTourJson {
  const factory FeatureTourJson({
    String? destinationImageUrl,
    String? dateStart,
    String? address,
    int? ratings,
    int? likes,
    int? quantities,
    double? prices,
  }) = _FeatureTourJson;

  factory FeatureTourJson.fromJson(Map<String, Object?> json) =>
      _$FeatureTourJsonFromJson(json);
}
