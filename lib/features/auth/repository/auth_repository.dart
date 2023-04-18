import 'package:travel_booking_tour/data/dio/api_client.dart';

import '../../../data/model/user.dart';

class AuthRepository {
  final ApiService _apiService = ApiService();
  final String _authPath = '/api/auth';
  final String _signUpPath = '/api/auth/local/register';
  final String _signInPath = '/api/auth/local';
  final String _sendEmailResetPassword = '/api/auth/forgot-password';

  Future<UserJson?> signUp(Map<String, dynamic> data) async =>
      _apiService.postJson(
        data: data,
        endPoint: _signUpPath,
        converter: (data) => UserJson.fromJson(data),
      );

  Future<UserJson?> signIn(Map<String, dynamic> data) async =>
      _apiService.postJson(
        data: data,
        endPoint: _signInPath,
        converter: (data) => UserJson.fromJson(data),
      );

  Future<Map<String, dynamic>?> sendEmailResetPassword(String email) async =>
      _apiService.postJson(
        data: {"email": email},
        endPoint: _sendEmailResetPassword,
        converter: (data) => data,
      );

  Future<UserJson?> resetPassword(
          String token, String newPassword, String retypePassword) async =>
      _apiService.postJson(
        data: {
          "code": token,
          "password": newPassword,
          "passwordConfirmation": retypePassword
        },
        endPoint: '$_authPath/reset-password',
        converter: (data) => UserJson.fromJson(data),
      );
}
