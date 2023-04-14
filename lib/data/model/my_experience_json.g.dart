// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_experience_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyExperienceJson _$$_MyExperienceJsonFromJson(Map<String, dynamic> json) =>
    _$_MyExperienceJson(
      id: json['id'] as String?,
      name: json['name'] as String?,
      destination: json['destination'] as String?,
      createdAt: json['createdAt'] as String?,
      isFavorite: json['isFavorite'] as bool?,
      likes: json['likes'] as int?,
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_MyExperienceJsonToJson(_$_MyExperienceJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'destination': instance.destination,
      'createdAt': instance.createdAt,
      'isFavorite': instance.isFavorite,
      'likes': instance.likes,
      'photos': instance.photos,
    };
