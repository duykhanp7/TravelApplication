// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_experience_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyExperienceJson _$$_MyExperienceJsonFromJson(Map<String, dynamic> json) =>
    _$_MyExperienceJson(
      id: json['id'] as int?,
      name: json['name'] as String?,
      location: json['location'] as String?,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const ConvertStringToDateTime().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updatedAt'], const ConvertStringToDateTime().fromJson),
      publishedAt: _$JsonConverterFromJson<String, DateTime>(
          json['publishedAt'], const ConvertStringToDateTime().fromJson),
      isFavorite: json['isFavorite'] as bool?,
      likes: json['likes'] as int?,
      multi: (json['multi'] as List<dynamic>?)
          ?.map((e) => PhotoJson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MyExperienceJsonToJson(_$_MyExperienceJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'createdAt': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const ConvertStringToDateTime().toJson),
      'updatedAt': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const ConvertStringToDateTime().toJson),
      'publishedAt': _$JsonConverterToJson<String, DateTime>(
          instance.publishedAt, const ConvertStringToDateTime().toJson),
      'isFavorite': instance.isFavorite,
      'likes': instance.likes,
      'multi': instance.multi,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
