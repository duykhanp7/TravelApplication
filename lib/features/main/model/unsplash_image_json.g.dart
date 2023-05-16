// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unsplash_image_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnSplashResponeJson _$$_UnSplashResponeJsonFromJson(
        Map<String, dynamic> json) =>
    _$_UnSplashResponeJson(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => UnSplashResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnSplashResponeJsonToJson(
        _$_UnSplashResponeJson instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

_$_UnSplashResult _$$_UnSplashResultFromJson(Map<String, dynamic> json) =>
    _$_UnSplashResult(
      urls: json['urls'] == null
          ? null
          : UnSplashURL.fromJson(json['urls'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnSplashResultToJson(_$_UnSplashResult instance) =>
    <String, dynamic>{
      'urls': instance.urls,
    };

_$_UnSplashURL _$$_UnSplashURLFromJson(Map<String, dynamic> json) =>
    _$_UnSplashURL(
      raw: json['raw'] as String?,
      full: json['full'] as String?,
      regular: json['regular'] as String?,
      small: json['small'] as String?,
      thumb: json['thumb'] as String?,
      smallS3: json['smallS3'] as String?,
    );

Map<String, dynamic> _$$_UnSplashURLToJson(_$_UnSplashURL instance) =>
    <String, dynamic>{
      'raw': instance.raw,
      'full': instance.full,
      'regular': instance.regular,
      'small': instance.small,
      'thumb': instance.thumb,
      'smallS3': instance.smallS3,
    };
