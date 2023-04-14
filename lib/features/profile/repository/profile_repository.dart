import 'package:travel_booking_tour/base/base_repository.dart';
import 'package:travel_booking_tour/data/model/my_experience_json.dart';

class ProfileRepository extends BaseRepository {
  Future<List<String>> getMyPhotos() async {
    return [''];
  }

  Future<List<MyExperienceJson>> getMyJourneys() async {
    return [];
  }

  @override
  void onInitialData() {}

  @override
  void reloadData() {}
}
