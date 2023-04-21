import 'package:travel_booking_tour/base/base_repository.dart';
import 'package:travel_booking_tour/data/dio/api_client.dart';
import 'package:travel_booking_tour/data/model/my_experience_json.dart';
import 'package:travel_booking_tour/features/profile/model/user_info.dart';

class ProfileRepository extends BaseRepository {
  final ApiService _apiService = ApiService();

  final String userInfo = '/api/users/me';

  Future<List<String>> getMyPhotos() async {
    return [''];
  }

  Future<List<MyExperienceJson>> getMyJourneys() async {
    return [];
  }

  Future<UserInfoJson?> getUserInfo() async =>
      _apiService.getJson(endPoint: userInfo);

  @override
  void onInitialData() {}

  @override
  void reloadData() {}
}
