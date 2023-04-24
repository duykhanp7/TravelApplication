import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

class ConvertStringToDateTime implements JsonConverter<DateTime, String> {
  const ConvertStringToDateTime();

  @override
  DateTime fromJson(String json) {
    return DateTime.tryParse(json) ?? DateTime.now();
  }

  @override
  String toJson(DateTime object) {
    return object.toString();
  }
}
