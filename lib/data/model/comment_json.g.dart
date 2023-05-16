// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentJson _$$_CommentJsonFromJson(Map<String, dynamic> json) =>
    _$_CommentJson(
      id: json['id'] as int?,
      attributes: json['attributes'] == null
          ? null
          : CommentAttributes.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CommentJsonToJson(_$_CommentJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

_$_CommentAttributes _$$_CommentAttributesFromJson(Map<String, dynamic> json) =>
    _$_CommentAttributes(
      content: json['content'] as String?,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const ConvertStringToDateTime().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updatedAt'], const ConvertStringToDateTime().fromJson),
      publishedAt: _$JsonConverterFromJson<String, DateTime>(
          json['publishedAt'], const ConvertStringToDateTime().fromJson),
      user: json['user'],
    );

Map<String, dynamic> _$$_CommentAttributesToJson(
        _$_CommentAttributes instance) =>
    <String, dynamic>{
      'content': instance.content,
      'createdAt': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const ConvertStringToDateTime().toJson),
      'updatedAt': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const ConvertStringToDateTime().toJson),
      'publishedAt': _$JsonConverterToJson<String, DateTime>(
          instance.publishedAt, const ConvertStringToDateTime().toJson),
      'user': instance.user,
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
