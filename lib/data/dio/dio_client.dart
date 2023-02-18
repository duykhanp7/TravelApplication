import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/data/models/user.dart';
import 'package:travel_booking_tour/data/network/network_exception.dart';

class DioClient {
  final String _baseURL = 'https://be-travel.onrender.com';
  final String _register = '/api/auth/local/register';
  final Dio dio = Dio();

  Future<UserJson?> singUp() async {
    try {
      FormData formData = FormData.fromMap({
        'email': 'aa1a1a122@gmail.com',
        'username': 'aa1a1a122',
        'password': '1231d23123'
      });

      Response response = await dio.post(_baseURL + _register, data: formData);

      debugPrint('Respone Data ${response.toString()}');

      return UserJson.fromJson(response.data['user'] as Map<String, dynamic>);
    } catch (e) {
      throw NetworkException.getDioException(e);
    }
  }
}
