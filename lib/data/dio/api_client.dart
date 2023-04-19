import 'package:dio/dio.dart';
import 'package:travel_booking_tour/data/dio/api_interface.dart';
import 'package:travel_booking_tour/data/dio/dio_interceptor.dart';
import 'package:travel_booking_tour/data/network/network_exception.dart';

class ApiService implements ApiInterface {
  //final String _baseURL = 'https://be-travel.onrender.com';
  final String _baseURL = 'http://10.0.2.2:1337';
  // final BaseOptions _baseOptions = BaseOptions();
  final Dio dio = Dio();

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
}
