import 'package:travel_booking_tour/base/base_repository.dart';
import 'package:travel_booking_tour/features/guide/choose_guide/model/destination_json.dart';
import 'package:travel_booking_tour/res/images.dart';

class AddTripInformationRepository extends BaseRepository {
  @override
  void onInitialData() {}

  @override
  void reloadData() {}

  Future<List<DestinationJson>?> getDestination(String name) async {
    return await Future.delayed(
      const Duration(seconds: 5),
      () => destinations
          .where((element) =>
              element.name?.toLowerCase().contains(name.toLowerCase()) ?? false)
          .toList(),
    );
  }

  List<DestinationJson> destinations = const [
    DestinationJson(id: 1, url: AppImages.daNangBanaHoiAn, name: 'Ha Noi'),
    DestinationJson(
        id: 2, url: AppImages.daNangBanaHoiAn1, name: 'Ho Chi Minh'),
    DestinationJson(id: 3, url: AppImages.cungVanHoaThieuNhi, name: 'Da Nang'),
    DestinationJson(id: 1, url: AppImages.daNangBanaHoiAn, name: 'Ha Noi'),
    DestinationJson(
        id: 2, url: AppImages.daNangBanaHoiAn1, name: 'Ho Chi Minh'),
    DestinationJson(id: 3, url: AppImages.cungVanHoaThieuNhi, name: 'Da Nang'),
    DestinationJson(id: 1, url: AppImages.daNangBanaHoiAn, name: 'Ha Noi'),
    DestinationJson(
        id: 2, url: AppImages.daNangBanaHoiAn1, name: 'Ho Chi Minh'),
    DestinationJson(id: 3, url: AppImages.cungVanHoaThieuNhi, name: 'Da Nang'),
    DestinationJson(id: 1, url: AppImages.daNangBanaHoiAn, name: 'Ha Noi'),
    DestinationJson(
        id: 2, url: AppImages.daNangBanaHoiAn1, name: 'Ho Chi Minh'),
    DestinationJson(id: 3, url: AppImages.cungVanHoaThieuNhi, name: 'Da Nang'),
    DestinationJson(id: 1, url: AppImages.daNangBanaHoiAn, name: 'Ha Noi'),
    DestinationJson(
        id: 2, url: AppImages.daNangBanaHoiAn1, name: 'Ho Chi Minh'),
    DestinationJson(id: 3, url: AppImages.cungVanHoaThieuNhi, name: 'Da Nang'),
    DestinationJson(id: 1, url: AppImages.daNangBanaHoiAn, name: 'Ha Noi'),
    DestinationJson(
        id: 2, url: AppImages.daNangBanaHoiAn1, name: 'Ho Chi Minh'),
    DestinationJson(id: 3, url: AppImages.cungVanHoaThieuNhi, name: 'Da Nang'),
  ];
}
