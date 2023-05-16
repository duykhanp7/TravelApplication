// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_guide_detail_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TourGuideDetailJson _$$_TourGuideDetailJsonFromJson(
        Map<String, dynamic> json) =>
    _$_TourGuideDetailJson(
      id: json['id'] as int?,
      attributes: json['attributes'] == null
          ? null
          : TourGuideDetailAttributes.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TourGuideDetailJsonToJson(
        _$_TourGuideDetailJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

_$_TourGuideDetailAttributes _$$_TourGuideDetailAttributesFromJson(
        Map<String, dynamic> json) =>
    _$_TourGuideDetailAttributes(
      introduction: json['Introduction'] as String?,
      city: json['city'] as String?,
      language: json['language'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      publishedAt: json['publishedAt'] as String?,
      availabletime: json['availabletime'] as String?,
      fee: json['fee'],
      videoIntroduction: json['videoIntroduction'],
      user: json['user'] == null
          ? null
          : TourGuideDetailAttributesUser.fromJson(
              json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TourGuideDetailAttributesToJson(
        _$_TourGuideDetailAttributes instance) =>
    <String, dynamic>{
      'Introduction': instance.introduction,
      'city': instance.city,
      'language': instance.language,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'publishedAt': instance.publishedAt,
      'availabletime': instance.availabletime,
      'fee': instance.fee,
      'videoIntroduction': instance.videoIntroduction,
      'user': instance.user,
    };

_$_TourGuideDetailAttributesUser _$$_TourGuideDetailAttributesUserFromJson(
        Map<String, dynamic> json) =>
    _$_TourGuideDetailAttributesUser(
      data: json['data'] == null
          ? null
          : TourGuideDetailAttributesUserData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TourGuideDetailAttributesUserToJson(
        _$_TourGuideDetailAttributesUser instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_TourGuideDetailAttributesUserData
    _$$_TourGuideDetailAttributesUserDataFromJson(Map<String, dynamic> json) =>
        _$_TourGuideDetailAttributesUserData(
          id: json['id'] as int?,
          attributes: json['attributes'] == null
              ? null
              : TourGuideDetailAttributesUserDataAttributes.fromJson(
                  json['attributes'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_TourGuideDetailAttributesUserDataToJson(
        _$_TourGuideDetailAttributesUserData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

_$_TourGuideDetailAttributesUserDataAttributes
    _$$_TourGuideDetailAttributesUserDataAttributesFromJson(
            Map<String, dynamic> json) =>
        _$_TourGuideDetailAttributesUserDataAttributes(
          username: json['username'] as String?,
          email: json['email'] as String?,
          provider: json['provider'] as String?,
          firstName: json['firstName'] as String?,
          lastName: json['lastName'] as String?,
          country: json['country'] as String?,
          avatar: json['avatar'] == null
              ? null
              : TourGuideDetailAttributesUserDataAttributesAvatar.fromJson(
                  json['avatar'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_TourGuideDetailAttributesUserDataAttributesToJson(
        _$_TourGuideDetailAttributesUserDataAttributes instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'provider': instance.provider,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'country': instance.country,
      'avatar': instance.avatar,
    };

_$_TourGuideDetailAttributesUserDataAttributesAvatar
    _$$_TourGuideDetailAttributesUserDataAttributesAvatarFromJson(
            Map<String, dynamic> json) =>
        _$_TourGuideDetailAttributesUserDataAttributesAvatar(
          data: json['data'] == null
              ? null
              : TourGuideDetailAttributesUserDataAttributesAvatarData.fromJson(
                  json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$$_TourGuideDetailAttributesUserDataAttributesAvatarToJson(
            _$_TourGuideDetailAttributesUserDataAttributesAvatar instance) =>
        <String, dynamic>{
          'data': instance.data,
        };

_$_TourGuideDetailAttributesUserDataAttributesAvatarData
    _$$_TourGuideDetailAttributesUserDataAttributesAvatarDataFromJson(
            Map<String, dynamic> json) =>
        _$_TourGuideDetailAttributesUserDataAttributesAvatarData(
          id: json['id'] as int?,
          attributes: json['attributes'] == null
              ? null
              : PhotoJson.fromJson(json['attributes'] as Map<String, dynamic>),
        );

Map<String,
    dynamic> _$$_TourGuideDetailAttributesUserDataAttributesAvatarDataToJson(
        _$_TourGuideDetailAttributesUserDataAttributesAvatarData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };
