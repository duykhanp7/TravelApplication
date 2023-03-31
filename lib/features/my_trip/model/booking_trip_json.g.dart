// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_trip_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookingTripJson _$$_BookingTripJsonFromJson(Map<String, dynamic> json) =>
    _$_BookingTripJson(
      id: json['id'] as String?,
      destination: json['destination'] as String?,
      actractions: (json['actractions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      url: json['url'] as String?,
      state: json['state'] as String?,
      type: json['type'] as String?,
      departureDate: json['departureDate'] as String?,
      time: json['time'] as String?,
      urlTourGuide: json['urlTourGuide'] as String?,
      nameTourGuide: json['nameTourGuide'] as String?,
    );

Map<String, dynamic> _$$_BookingTripJsonToJson(_$_BookingTripJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'destination': instance.destination,
      'actractions': instance.actractions,
      'url': instance.url,
      'state': instance.state,
      'type': instance.type,
      'departureDate': instance.departureDate,
      'time': instance.time,
      'urlTourGuide': instance.urlTourGuide,
      'nameTourGuide': instance.nameTourGuide,
    };
