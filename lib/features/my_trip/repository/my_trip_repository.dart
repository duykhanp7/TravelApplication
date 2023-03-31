import 'package:travel_booking_tour/base/base_repository.dart';
import 'package:travel_booking_tour/features/my_trip/model/booking_trip_json.dart';
import 'package:travel_booking_tour/res/images.dart';

class MyTripRepository extends BaseRepository {
  Future<List<BookingTripJson>?> getListBooking() async {
    return const <BookingTripJson>[
      BookingTripJson(
          id: '1',
          actractions: ['Dragon Bridge Trip'],
          departureDate: 'Jan 30, 2022',
          destination: 'Da Nang, Viet Nam',
          nameTourGuide: 'Tuan Tran',
          state: 'FINISHED',
          time: '13:00 - 15:00',
          type: 'CURRENT_TRIP',
          url: AppImages.daNangBanaHoiAn1,
          urlTourGuide: AppImages.tuanTran),
      BookingTripJson(
          id: '2',
          actractions: ['Dragon Bridge Trip'],
          departureDate: 'Jan 30, 2022',
          destination: 'Da Nang, Viet Nam',
          nameTourGuide: 'Tuan Tran',
          state: 'FINISHED',
          time: '13:00 - 15:00',
          type: 'CURRENT_TRIP',
          url: AppImages.daNangBanaHoiAn,
          urlTourGuide: AppImages.tuanTran),
      BookingTripJson(
          id: '3',
          actractions: ['Dragon Bridge Trip'],
          departureDate: 'Jan 30, 2022',
          destination: 'Da Nang, Viet Nam',
          nameTourGuide: 'Tuan Tran',
          state: 'FINISHED',
          time: '13:00 - 15:00',
          type: 'CURRENT_TRIP',
          url: AppImages.daNangBanaHoiAn,
          urlTourGuide: AppImages.tuanTran),
      BookingTripJson(
          id: '4',
          actractions: ['Dragon Bridge Trip'],
          departureDate: 'Jan 30, 2022',
          destination: 'Da Nang, Viet Nam',
          nameTourGuide: 'Tuan Tran',
          state: 'FINISHED',
          time: '13:00 - 15:00',
          type: 'CURRENT_TRIP',
          url: AppImages.daNangBanaHoiAn,
          urlTourGuide: AppImages.tuanTran)
    ];
  }

  @override
  void onInitialData() {}

  @override
  void reloadData() {}
}
