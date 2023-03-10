// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewJson _$$_ReviewJsonFromJson(Map<String, dynamic> json) =>
    _$_ReviewJson(
      id: json['id'] as int?,
      ratersName: json['ratersName'] as String?,
      ratersImage: json['ratersImage'] as String?,
      rating: json['rating'] as int?,
      createdAt: json['createdAt'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$_ReviewJsonToJson(_$_ReviewJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ratersName': instance.ratersName,
      'ratersImage': instance.ratersImage,
      'rating': instance.rating,
      'createdAt': instance.createdAt,
      'content': instance.content,
    };
