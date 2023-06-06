// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_experiences_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserExperienceJson _$$_UserExperienceJsonFromJson(
        Map<String, dynamic> json) =>
    _$_UserExperienceJson(
      id: json['id'] as int?,
      name: json['name'] as String?,
      location: json['location'] as String?,
      multi:
          (json['multi'] as List<dynamic>?)?.map((e) => e as String).toList(),
      guideName: json['guideName'] as String?,
      guideUrl: json['guideUrl'] as String?,
    );

Map<String, dynamic> _$$_UserExperienceJsonToJson(
        _$_UserExperienceJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'multi': instance.multi,
      'guideName': instance.guideName,
      'guideUrl': instance.guideUrl,
    };
