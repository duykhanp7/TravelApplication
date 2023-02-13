// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_tour_preview_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeatureTourJson _$$_FeatureTourJsonFromJson(Map<String, dynamic> json) =>
    _$_FeatureTourJson(
      destinationImageUrl: json['destinationImageUrl'] as String?,
      dateStart: json['dateStart'] as String?,
      address: json['address'] as String?,
      ratings: json['ratings'] as int?,
      likes: json['likes'] as int?,
      quantities: json['quantities'] as int?,
      prices: (json['prices'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_FeatureTourJsonToJson(_$_FeatureTourJson instance) =>
    <String, dynamic>{
      'destinationImageUrl': instance.destinationImageUrl,
      'dateStart': instance.dateStart,
      'address': instance.address,
      'ratings': instance.ratings,
      'likes': instance.likes,
      'quantities': instance.quantities,
      'prices': instance.prices,
    };
