import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../enum/enums.dart';

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

class ConvertStringToUserType implements JsonConverter<UserType, String> {
  const ConvertStringToUserType();

  @override
  UserType fromJson(String json) {
    return UserType.values.firstWhere((element) => element.name == json);
  }

  @override
  String toJson(UserType object) {
    return object.name;
  }
}
