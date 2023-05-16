import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:travel_booking_tour/base/base_repository.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/data/dio/api_client.dart';
import 'package:travel_booking_tour/data/local/app_storage.dart';
import 'package:travel_booking_tour/data/model/my_experience_json.dart';
import 'package:travel_booking_tour/data/model/user.dart';
import 'package:travel_booking_tour/features/profile/model/photo_json.dart';
import 'package:travel_booking_tour/features/profile/model/user_info.dart';

import '../../../common/enum/enums.dart';

class ProfileRepository extends BaseRepository {
  final ApiService _apiService = ApiService();
  final AppStorage _appStorage = AppStorage();
  final String userInfoEndPoint = '/api/users/';
  final String photoEndPoint = '/api/images';
  final String updateInfoEndPoint = '/api/users';
  final String deletePhotoEndPoint = '/api/users-permissions/deletePhoto';

  final String updateTraverlerAvatarEndPoint = '/api/traveler/avatar';
  final String updateTraverlerCoverEndPoint = '/api/traveler/cover';
  final String updateGuideAvatarEndPoint = '/api/guide/avatar';
  final String updateGuideCoverEndPoint = '/api/guide/cover';

  final String journeyEndPoint = '/api/journeys';

  Future<List<MyExperienceJson>> getMyJourneys() async {
    return [];
  }

  Future<UserInfoJson?> getUserInfo(String? id) async => _apiService.getJson(
      endPoint: '$userInfoEndPoint$id',
      queryParams: {'populate': '*'},
      converter: (data) => UserInfoJson.fromJson(data));

  Future<PhotoJson> postPhoto(File file) async => _apiService.postFile(
      file: file,
      endPoint: photoEndPoint,
      converter: (data) => PhotoJson.fromJson(data));

  Future<void> deletePhoto(String id) async => _apiService.deleteJson(
        endPoint: '$deletePhotoEndPoint/$id',
      );

  Future<UserInfoJson?> updateUserInfo(UserInfoJson? userInfoJson) async =>
      _apiService.putJson(
          endPoint: '$updateInfoEndPoint/${userInfoJson?.id}',
          data: userInfoJson?.toJson() ?? {},
          converter: (data) => UserInfoJson.fromJson(data));

  Future<UserInfoJson?> get userInfo async => UserInfoJson.fromJson(
      jsonDecode(await _appStorage.getData(AppConstant.info) ?? ''));

  Future<Map<dynamic, dynamic>?> updateAvatar(
          File file, UserType? type, int? id) async =>
      type == UserType.traverler
          ? _apiService.postFile(
              file: file,
              datas: {"id": id},
              endPoint: updateTraverlerAvatarEndPoint,
              converter: (data) => data)
          : _apiService.postFile(
              file: file,
              datas: {"id": id},
              endPoint: updateGuideAvatarEndPoint,
              converter: (data) => data);

  Future<Map<dynamic, dynamic>?> updateCover(
          File file, UserType? type, int? id) async =>
      type == UserType.traverler
          ? _apiService.postFile(
              file: file,
              datas: {"id": id},
              endPoint: updateTraverlerCoverEndPoint,
              converter: (data) => data)
          : _apiService.postFile(
              file: file,
              datas: {"id": id},
              endPoint: updateGuideCoverEndPoint,
              converter: (data) => data);

  Future<UserJson?> get user async => UserJson.fromJson(
      jsonDecode(await _appStorage.getData(AppConstant.user) ?? ''));

  Future<dynamic> postMyJourney(FormData data) async =>
      _apiService.postFormData(
        data: data,
        endPoint: journeyEndPoint,
      );

  @override
  void onInitialData() {}

  @override
  void reloadData() {}
}
