// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScheduleJson _$$_ScheduleJsonFromJson(Map<String, dynamic> json) =>
    _$_ScheduleJson(
      id: json['id'] as int?,
      name: json['name'] as String?,
      schedules: (json['schedules'] as List<dynamic>?)
          ?.map((e) => SchedulePointJson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ScheduleJsonToJson(_$_ScheduleJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'schedules': instance.schedules,
    };
