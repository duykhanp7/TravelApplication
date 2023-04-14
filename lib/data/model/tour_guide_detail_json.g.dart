// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_guide_detail_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TourGuideDetailJson _$$_TourGuideDetailJsonFromJson(
        Map<String, dynamic> json) =>
    _$_TourGuideDetailJson(
      id: json['id'] as int?,
      coverImageUrl: json['coverImageUrl'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      name: json['name'] as String?,
      rating: json['rating'] as int?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      address: json['address'] as String?,
      description: json['description'] as String?,
      videoIntroductionUrl: json['videoIntroductionUrl'] as String?,
      prices: (json['prices'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewJson.fromJson(e as Map<String, dynamic>))
          .toList(),
      experiences: (json['experiences'] as List<dynamic>?)
          ?.map((e) => MyExperienceJson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TourGuideDetailJsonToJson(
        _$_TourGuideDetailJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coverImageUrl': instance.coverImageUrl,
      'profileImageUrl': instance.profileImageUrl,
      'name': instance.name,
      'rating': instance.rating,
      'languages': instance.languages,
      'address': instance.address,
      'description': instance.description,
      'videoIntroductionUrl': instance.videoIntroductionUrl,
      'prices': instance.prices,
      'reviews': instance.reviews,
      'experiences': instance.experiences,
    };
