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
      likes: json['likes'] == null
          ? null
          : LikeDataJson.fromJson(json['likes'] as Map<String, dynamic>),
      author: json['author'] == null
          ? null
          : AuthorJson.fromJson(json['author'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? null
          : CommentResponeJson.fromJson(
              json['comments'] as Map<String, dynamic>),
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
      'likes': instance.likes,
      'author': instance.author,
      'comments': instance.comments,
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

_$_LikeDataJson _$$_LikeDataJsonFromJson(Map<String, dynamic> json) =>
    _$_LikeDataJson(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LikeDataJsonData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LikeDataJsonToJson(_$_LikeDataJson instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_LikeDataJsonData _$$_LikeDataJsonDataFromJson(Map<String, dynamic> json) =>
    _$_LikeDataJsonData(
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$_LikeDataJsonDataToJson(_$_LikeDataJsonData instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

_$_AuthorJson _$$_AuthorJsonFromJson(Map<String, dynamic> json) =>
    _$_AuthorJson(
      data: json['data'] == null
          ? null
          : AuthorJsonData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AuthorJsonToJson(_$_AuthorJson instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_AuthorJsonData _$$_AuthorJsonDataFromJson(Map<String, dynamic> json) =>
    _$_AuthorJsonData(
      id: json['id'] as int?,
      attributes: json['attributes'] == null
          ? null
          : UserJson.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AuthorJsonDataToJson(_$_AuthorJsonData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

_$_CommentResponeJson _$$_CommentResponeJsonFromJson(
        Map<String, dynamic> json) =>
    _$_CommentResponeJson(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CommentJson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CommentResponeJsonToJson(
        _$_CommentResponeJson instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
