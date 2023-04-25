// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhotoJson _$$_PhotoJsonFromJson(Map<String, dynamic> json) => _$_PhotoJson(
      id: json['id'] as int?,
      token: json['token'] as String?,
      uploadUrl: json['uploadUrl'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      selected: json['selected'] as bool?,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const ConvertStringToDateTime().fromJson),
      publishedAt: _$JsonConverterFromJson<String, DateTime>(
          json['publishedAt'], const ConvertStringToDateTime().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updatedAt'], const ConvertStringToDateTime().fromJson),
    );

Map<String, dynamic> _$$_PhotoJsonToJson(_$_PhotoJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'uploadUrl': instance.uploadUrl,
      'name': instance.name,
      'url': instance.url,
      'selected': instance.selected,
      'createdAt': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const ConvertStringToDateTime().toJson),
      'publishedAt': _$JsonConverterToJson<String, DateTime>(
          instance.publishedAt, const ConvertStringToDateTime().toJson),
      'updatedAt': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const ConvertStringToDateTime().toJson),
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
