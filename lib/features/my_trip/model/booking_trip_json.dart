// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_trip_json.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'booking_trip_json.g.dart';

@freezed
class BookingTripJson with _$BookingTripJson {
  const factory BookingTripJson({
    String? id,
    String? destination,
    List<String>? actractions,
    String? url,
    String? state,
    String? type,
    String? departureDate,
    String? time,
    String? urlTourGuide,
    String? nameTourGuide,
  }) = _BookingTripJson;

  factory BookingTripJson.fromJson(Map<String, Object?> json) =>
      _$BookingTripJsonFromJson(json);
}
