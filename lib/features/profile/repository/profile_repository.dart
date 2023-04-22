import 'dart:convert';
import 'dart:io';

import 'package:travel_booking_tour/base/base_repository.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/data/dio/api_client.dart';
import 'package:travel_booking_tour/data/local/app_storage.dart';
import 'package:travel_booking_tour/data/model/my_experience_json.dart';
import 'package:travel_booking_tour/features/profile/model/photo_json.dart';
import 'package:travel_booking_tour/features/profile/model/user_info.dart';

class ProfileRepository extends BaseRepository {
  final ApiService _apiService = ApiService();
  final AppStorage _appStorage = AppStorage();
  final String userInfoEndPoint = '/api/users/me';
  final String photoEndPoint = '/api/images';
  final String updateInfoEndPoint = '/api/users';

  Future<List<String>> getMyPhotos() async {
    return [''];
  }

  Future<List<MyExperienceJson>> getMyJourneys() async {
    return [];
  }

  Future<UserInfoJson?> getUserInfo() async => _apiService.getJson(
      endPoint: userInfoEndPoint,
      converter: (data) => UserInfoJson.fromJson(data));

  Future<PhotoJson> postPhoto(File file) async => _apiService.postFile(
      file: file,
      endPoint: photoEndPoint,
      converter: (data) => PhotoJson.fromJson(data));

  Future<UserInfoJson?> updateUserInfo(UserInfoJson? userInfoJson) async =>
      _apiService.putJson(
          endPoint: '$updateInfoEndPoint/${userInfoJson?.id}',
          data: userInfoJson?.toJson() ?? {},
          converter: (data) => UserInfoJson.fromJson(data));

  Future<UserInfoJson?> get userInfo async => UserInfoJson.fromJson(
      jsonDecode(await _appStorage.getData(AppConstant.info) ?? ''));

  @override
  void onInitialData() {}

  @override
  void reloadData() {}
}
