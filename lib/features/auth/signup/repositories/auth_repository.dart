import 'package:travel_booking_tour/data/dio/api_client.dart';
import 'package:travel_booking_tour/data/models/user.dart';

class AuthRepository {
  final ApiService _apiService = ApiService();
  final String _signUpPath = '/api/auth/local/register';
  final String _signInPath = '/api/auth/local';

  Future<UserJson?> signUp(Map<String, dynamic> data) => _apiService.postJson(
        data: data,
        endPoint: _signUpPath,
        converter: (data) => UserJson.fromJson(data),
      );

  Future<UserJson?> signIn(Map<String, dynamic> data) => _apiService.postJson(
        data: data,
        endPoint: _signInPath,
        converter: (data) => UserJson.fromJson(data),
      );
}
