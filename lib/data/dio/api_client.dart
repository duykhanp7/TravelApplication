import 'dart:io';

import 'package:dio/dio.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/data/dio/api_interface.dart';
import 'package:travel_booking_tour/data/dio/dio_interceptor.dart';
import 'package:travel_booking_tour/data/local/app_storage.dart';
import 'package:travel_booking_tour/data/network/network_exception.dart';
// import 'package:http_parser/http_parser.dart';

class ApiService implements ApiInterface {
  //final String _baseURL = 'https://be-travel.onrender.com';
  final String _baseURL = 'http://10.0.2.2:1337';
  // final BaseOptions _baseOptions = BaseOptions();
  final Dio dio = Dio();
  final AppStorage _appStorage = AppStorage();

  ApiService() {
    //_baseOptions.baseUrl = _baseURL;
    // _baseOptions.connectTimeout = const Duration(seconds: 10);
    // _baseOptions.sendTimeout = const Duration(seconds: 10);
    // _baseOptions.receiveTimeout = const Duration(seconds: 10);
    // _baseOptions.contentType = 'application/json';
    // _baseOptions.headers = {'Content-Type': 'application/json'};
    // dio.options = _baseOptions;
    dio.interceptors.add(DioInterceptor());
  }

  @override
  Future<T> postJson<T>(
      {required Json data,
      required String endPoint,
      Json? queryParams,
      Converter<T>? converter}) async {
    try {
      final response = await dio.post(
        _baseURL + endPoint,
        data: FormData.fromMap(data),
        queryParameters: queryParams,
      );
      return NetworkException.convertResponse(response, converter);
    } catch (ex) {
      throw NetworkException.getDioException(ex);
    }
  }

  @override
  Future<T> getJson<T>(
      {required String endPoint,
      Json? queryParams,
      Converter<T>? converter}) async {
    try {
      final response =
          await dio.get(_baseURL + endPoint, queryParameters: queryParams);
      return NetworkException.convertResponse(response, converter);
    } catch (ex) {
      throw NetworkException.getDioException(ex);
    }
  }

  @override
  Future<T> postFile<T>(
      {required File file,
      required String endPoint,
      Json? queryParams,
      Converter<T>? converter}) async {
    try {
      final token = await _appStorage.getData(AppConstant.token);
      final fileData = await MultipartFile.fromFile(file.path);
      FormData data = FormData.fromMap({"token": token, "file": fileData});
      final response = await dio.post(_baseURL + endPoint,
          data: data, queryParameters: queryParams);
      return NetworkException.convertResponse(response, converter);
    } on NetworkException catch (ex) {
      throw NetworkException.getDioException(ex);
    }
  }

  @override
  Future<T> putJson<T>(
      {required String endPoint,
      required Json data,
      Json? queryParams,
      Converter<T>? converter}) async {
    try {
      final response = await dio.put(_baseURL + endPoint,
          data: data, queryParameters: queryParams);
      return NetworkException.convertResponse(response, converter);
    } on NetworkException catch (ex) {
      throw NetworkException.getDioException(ex);
    }
  }

  @override
  Future<T> deleteJson<T>(
      {Json? data,
      required String endPoint,
      Json? queryParams,
      Converter<T>? converter}) async {
    try {
      final response = await dio.delete(_baseURL + endPoint,
          data: data, queryParameters: queryParams);
      return NetworkException.convertResponse(response, converter);
    } on Exception catch (ex) {
      throw NetworkException.getDioException(ex);
    }
  }
}
