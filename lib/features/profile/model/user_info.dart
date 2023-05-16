// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:travel_booking_tour/common/converter/utils.dart';
import 'package:travel_booking_tour/features/profile/model/photo_json.dart';

import '../../../common/enum/enums.dart';
import '../../../data/model/my_experience_json.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'user_info.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'user_info.g.dart';

@freezed
class UserInfoJson with _$UserInfoJson {
  const factory UserInfoJson(
      {int? id,
      String? username,
      String? firstName,
      String? lastName,
      PhotoJson? avatar,
      PhotoJson? cover,
      String? email,
      String? provider,
      bool? confirmed,
      bool? blocked,
      String? createdAt,
      String? updatedAt,
      @ConvertStringToUserType() UserType? type,
      List<PhotoJson>? images,
      List<MyExperienceJson>? journeys}) = _UserInfoJson;

  // To JSON
  const UserInfoJson._();

  factory UserInfoJson.fromJson(Map<String, Object?> json) =>
      _$UserInfoJsonFromJson(json);
}
