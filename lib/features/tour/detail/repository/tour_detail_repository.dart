import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:travel_booking_tour/base/base_repository.dart';
import 'package:travel_booking_tour/data/dio/api_client.dart';
import 'package:travel_booking_tour/res/images.dart';

class TourDetailRepository extends BaseRepository {
  final ApiService _apiService = ApiService();

  Future<List<String>?> getTourDetail() async {
    return [
      AppImages.daNangBanaHoiAn,
      AppImages.daNangBanaHoiAn1,
      AppImages.cungVanHoaThieuNhi
    ];
  }

  Future<dynamic> bookingTour(int? id, String? fee, int? quantity) async {
    FormData data = FormData();
    Map<String, dynamic> bookingInfo = {
      'tour': id,
      'guides': ['60'],
      'fee': fee,
      'travelers': quantity
    };
    data.fields.add(MapEntry('data', jsonEncode(bookingInfo)));
    return _apiService.postFormData(
      data: data,
      endPoint: '/api/bookings',
    );
  }

  @override
  void onInitialData() {}

  @override
  void reloadData() {}
}
