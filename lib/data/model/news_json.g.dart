// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsJson _$$_NewsJsonFromJson(Map<String, dynamic> json) => _$_NewsJson(
      id: json['id'] as int?,
      attributes: json['attributes'] == null
          ? null
          : AttributesJson.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NewsJsonToJson(_$_NewsJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

_$_AttributesJson _$$_AttributesJsonFromJson(Map<String, dynamic> json) =>
    _$_AttributesJson(
      title: json['title'] as String?,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const ConvertStringToDateTime().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updatedAt'], const ConvertStringToDateTime().fromJson),
      publishedAt: _$JsonConverterFromJson<String, DateTime>(
          json['publishedAt'], const ConvertStringToDateTime().fromJson),
      description: json['description'] as String?,
      images: json['Image'] == null
          ? null
          : ImageJson.fromJson(json['Image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AttributesJsonToJson(_$_AttributesJson instance) =>
    <String, dynamic>{
      'title': instance.title,
      'createdAt': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const ConvertStringToDateTime().toJson),
      'updatedAt': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const ConvertStringToDateTime().toJson),
      'publishedAt': _$JsonConverterToJson<String, DateTime>(
          instance.publishedAt, const ConvertStringToDateTime().toJson),
      'description': instance.description,
      'Image': instance.images,
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

_$_ImageJson _$$_ImageJsonFromJson(Map<String, dynamic> json) => _$_ImageJson(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ImageChildJson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ImageJsonToJson(_$_ImageJson instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_ImageChildJson _$$_ImageChildJsonFromJson(Map<String, dynamic> json) =>
    _$_ImageChildJson(
      id: json['id'] as int?,
      attributes: json['attributes'] == null
          ? null
          : ImageChildAttributesJson.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ImageChildJsonToJson(_$_ImageChildJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

_$_ImageChildAttributesJson _$$_ImageChildAttributesJsonFromJson(
        Map<String, dynamic> json) =>
    _$_ImageChildAttributesJson(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_ImageChildAttributesJsonToJson(
        _$_ImageChildAttributesJson instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
