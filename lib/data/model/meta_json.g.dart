// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MetaJson _$$_MetaJsonFromJson(Map<String, dynamic> json) => _$_MetaJson(
      pagination: json['pagination'] == null
          ? null
          : PaginationJson.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MetaJsonToJson(_$_MetaJson instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
    };

_$_PaginationJson _$$_PaginationJsonFromJson(Map<String, dynamic> json) =>
    _$_PaginationJson(
      page: json['page'] as int?,
      pageSize: json['pageSize'] as int?,
      pageCount: json['pageCount'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$$_PaginationJsonToJson(_$_PaginationJson instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'pageCount': instance.pageCount,
      'total': instance.total,
    };
