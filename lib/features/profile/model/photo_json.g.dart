// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhotoJson _$$_PhotoJsonFromJson(Map<String, dynamic> json) => _$_PhotoJson(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      publishedAt: json['publishedAt'] as String?,
      token: json['token'] as String?,
      uploadUrl: json['uploadUrl'] as String?,
    );

Map<String, dynamic> _$$_PhotoJsonToJson(_$_PhotoJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'publishedAt': instance.publishedAt,
      'token': instance.token,
      'uploadUrl': instance.uploadUrl,
    };
