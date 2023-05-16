import 'package:travel_booking_tour/base/base_repository.dart';
import 'package:travel_booking_tour/data/dio/api_client.dart';
import 'package:travel_booking_tour/data/model/tour_guide_detail_json.dart';

class DetailGuideTourRepository extends BaseRepository {
  final ApiService _apiService = ApiService();

  final String rootApi = '/api';

  Future<TourGuideDetailJson> getDetailGuide(int? id) async =>
      _apiService.getJson(
        endPoint: '$rootApi/guides/$id',
        queryParams: {'populate': '*'},
        converter: (data) {
          return TourGuideDetailJson.fromJson(data['data']);
        },
      );

  @override
  void onInitialData() {}

  @override
  void reloadData() {}
}
