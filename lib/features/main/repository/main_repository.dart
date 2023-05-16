import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:travel_booking_tour/base/base_repository.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/data/dio/api_client.dart';
import 'package:travel_booking_tour/data/local/app_storage.dart';
import 'package:travel_booking_tour/features/main/model/unsplash_image_json.dart';

class MainRepository extends BaseRepository {
  final AppStorage _appStorage = AppStorage();
  final ApiService _apiService = ApiService();

  Future<String?> getCurrentLocationName() async {
    return await _appStorage.getData(AppConstant.address);
  }

  Future<double?> getCurrentTemperature(Position? pos) async {
    String openWeatherMapBaseUrl = dotenv.env['OPENWEATHERMAP_URL'] ?? '';
    String path = '/data/2.5/weather';
    String apiKey = dotenv.env['OPENWEATHERMAP_API_KEY'] ?? '';

    return _apiService.getData(
      endPoint: '$openWeatherMapBaseUrl$path',
      queryParams: {
        'lat': pos?.latitude,
        'lon': pos?.longitude,
        'units': 'metric',
        'appid': apiKey,
      },
      converter: (data) => data['main']['temp'],
    );
  }

  Future<UnSplashResponeJson?> getCurrentPostitionImage(String des) async {
    String unsplashBaseUrl = dotenv.env['UNSPLASH_URL'] ?? '';
    String path = '/search/photos';
    String apiKey = dotenv.env['UNSPLASH_API_KEY'] ?? '';

    return _apiService.getData(
      endPoint: '$unsplashBaseUrl$path',
      queryParams: {'query': des, 'client_id': apiKey},
      converter: (data) => UnSplashResponeJson.fromJson(data),
    );
  }

  @override
  void onInitialData() {}

  @override
  void reloadData() {}
}
