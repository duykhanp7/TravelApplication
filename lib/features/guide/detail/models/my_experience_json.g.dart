// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_experience_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyExperienceJson _$$_MyExperienceJsonFromJson(Map<String, dynamic> json) =>
    _$_MyExperienceJson(
      destinationTitle: json['destinationTitle'] as String?,
      destinationName: json['destinationName'] as String?,
      dateStart: json['dateStart'] as String?,
      countLikes: json['countLikes'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_MyExperienceJsonToJson(_$_MyExperienceJson instance) =>
    <String, dynamic>{
      'destinationTitle': instance.destinationTitle,
      'destinationName': instance.destinationName,
      'dateStart': instance.dateStart,
      'countLikes': instance.countLikes,
      'images': instance.images,
    };
