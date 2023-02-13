// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_journey_preview_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TopJourneyJson _$$_TopJourneyJsonFromJson(Map<String, dynamic> json) =>
    _$_TopJourneyJson(
      destinationTitle: json['destinationTitle'] as String?,
      imageUrl: json['imageUrl'] as String?,
      dateStart: json['dateStart'] as String?,
      quantities: json['quantities'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      ratings: json['ratings'] as int?,
      likes: json['likes'] as int?,
    );

Map<String, dynamic> _$$_TopJourneyJsonToJson(_$_TopJourneyJson instance) =>
    <String, dynamic>{
      'destinationTitle': instance.destinationTitle,
      'imageUrl': instance.imageUrl,
      'dateStart': instance.dateStart,
      'quantities': instance.quantities,
      'price': instance.price,
      'ratings': instance.ratings,
      'likes': instance.likes,
    };
