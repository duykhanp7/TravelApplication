// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_detail_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TourDetailJson _$$_TourDetailJsonFromJson(Map<String, dynamic> json) =>
    _$_TourDetailJson(
      id: json['id'] as int?,
      tourGuideId: json['tourGuideId'] as int?,
      destination: json['destination'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: (json['price'] as num?)?.toDouble(),
      saleOff: (json['saleOff'] as num?)?.toDouble(),
      rating: json['rating'] as int?,
      reviews: json['reviews'] as int?,
      likes: json['likes'] as int?,
      isFavorite: json['isFavorite'] as bool?,
      provider: json['provider'] == null
          ? null
          : TourProviderJson.fromJson(json['provider'] as Map<String, dynamic>),
      duration: json['duration'] as String?,
      description: json['description'] as String?,
      departureDate: json['departureDate'] as String?,
      departurePlace: json['departurePlace'] as String?,
      schedule: (json['schedule'] as List<dynamic>?)
          ?.map((e) => ScheduleJson.fromJson(e as Map<String, dynamic>))
          .toList(),
      prices: (json['prices'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$_TourDetailJsonToJson(_$_TourDetailJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tourGuideId': instance.tourGuideId,
      'destination': instance.destination,
      'images': instance.images,
      'price': instance.price,
      'saleOff': instance.saleOff,
      'rating': instance.rating,
      'reviews': instance.reviews,
      'likes': instance.likes,
      'isFavorite': instance.isFavorite,
      'provider': instance.provider,
      'duration': instance.duration,
      'description': instance.description,
      'departureDate': instance.departureDate,
      'departurePlace': instance.departurePlace,
      'schedule': instance.schedule,
      'prices': instance.prices,
    };
