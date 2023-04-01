import 'package:travel_booking_tour/base/base_repository.dart';
import 'package:travel_booking_tour/res/images.dart';

class TourDetailRepository extends BaseRepository {
  Future<List<String>?> getTourDetail() async {
    return [
      AppImages.daNangBanaHoiAn,
      AppImages.daNangBanaHoiAn1,
      AppImages.cungVanHoaThieuNhi
    ];
  }

  @override
  void onInitialData() {}

  @override
  void reloadData() {}
}
