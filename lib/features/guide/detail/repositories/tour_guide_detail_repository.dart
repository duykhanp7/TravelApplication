import 'package:travel_booking_tour/base/base_repository.dart';
import 'package:travel_booking_tour/features/guide/detail/models/my_experience_json.dart';
import 'package:travel_booking_tour/res/images.dart';

class DetailGuidetourRepository extends BaseRepository {
  @override
  void onInitialData() {}

  @override
  void reloadData() {}

  Future<List<MyExperienceJson>> getMyExperiencesTour() async {
    return const [
      MyExperienceJson(
          destinationTitle: '2 Hour Bicycle Tour exploring Hoian',
          destinationName: 'Hoi An, Viet Nam',
          dateStart: 'Jan 25, 2020',
          countLikes: '1234 likes',
          images: [AppImages.myex1, AppImages.myex2, AppImages.myex3]),
      MyExperienceJson(
          destinationTitle: 'Food tour in Danang',
          destinationName: 'Da Nang, Viet Nam',
          dateStart: 'Jan 25, 2020',
          countLikes: '234 likes',
          images: [AppImages.myex1, AppImages.myex2, AppImages.myex3])
    ];
  }
}
