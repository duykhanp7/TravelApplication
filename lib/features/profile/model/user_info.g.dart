// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfoJson _$$_UserInfoJsonFromJson(Map<String, dynamic> json) =>
    _$_UserInfoJson(
      id: json['id'] as int?,
      username: json['username'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      avatar: json['avatar'] == null
          ? null
          : PhotoJson.fromJson(json['avatar'] as Map<String, dynamic>),
      cover: json['cover'] == null
          ? null
          : PhotoJson.fromJson(json['cover'] as Map<String, dynamic>),
      email: json['email'] as String?,
      provider: json['provider'] as String?,
      confirmed: json['confirmed'] as bool?,
      blocked: json['blocked'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      type: _$JsonConverterFromJson<String, UserType>(
          json['type'], const ConvertStringToUserType().fromJson),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => PhotoJson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserInfoJsonToJson(_$_UserInfoJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'avatar': instance.avatar,
      'cover': instance.cover,
      'email': instance.email,
      'provider': instance.provider,
      'confirmed': instance.confirmed,
      'blocked': instance.blocked,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'type': _$JsonConverterToJson<String, UserType>(
          instance.type, const ConvertStringToUserType().toJson),
      'images': instance.images,
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
