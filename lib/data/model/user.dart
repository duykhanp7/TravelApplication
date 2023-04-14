// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'user.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'user.g.dart';

@freezed
class UserJson with _$UserJson {
  const factory UserJson(
      {int? id,
      String? username,
      String? email,
      String? provider,
      bool? confirmed,
      bool? blocked,
      String? createdAt,
      String? updatedAt,
      String? firstName,
      String? lastName}) = _UserJson;

  factory UserJson.fromJson(Map<String, Object?> json) =>
      _$UserJsonFromJson(json);
}