import 'package:travel_booking_tour/features/explore/models/best_guide_preview_json.dart';
import 'package:travel_booking_tour/features/explore/models/feature_tour_preview_json.dart';
import 'package:travel_booking_tour/features/explore/models/top_experiences_preview_json.dart';
import 'package:travel_booking_tour/features/explore/models/top_journey_preview_json.dart';
import 'package:travel_booking_tour/features/explore/models/travel_news_preview_json.dart';
import 'package:travel_booking_tour/base/base_repository.dart';
import 'package:travel_booking_tour/res/images.dart';

class ExploreRepository implements BaseRepository {
  Future<List<TopJourneyJson>> getListTopJourney() async {
    return <TopJourneyJson>[
      TopJourneyJson(
          destinationTitle: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2022',
          imageUrl: AppImages.daNangBanaHoiAn,
          likes: 1247,
          price: 400.00,
          quantities: 3,
          ratings: 1),
      TopJourneyJson(
          destinationTitle: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2022',
          imageUrl: AppImages.daNangBanaHoiAn,
          likes: 1248,
          price: 4030.00,
          quantities: 3,
          ratings: 2),
      TopJourneyJson(
          destinationTitle: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2022',
          imageUrl: AppImages.daNangBanaHoiAn,
          likes: 1249,
          price: 4010.00,
          quantities: 3,
          ratings: 3),
      TopJourneyJson(
          destinationTitle: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2022',
          imageUrl: AppImages.daNangBanaHoiAn,
          likes: 1250,
          price: 4030.00,
          quantities: 3,
          ratings: 4),
      TopJourneyJson(
          destinationTitle: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2022',
          imageUrl: AppImages.daNangBanaHoiAn,
          likes: 1251,
          price: 4001.00,
          quantities: 3,
          ratings: 5),
      TopJourneyJson(
          destinationTitle: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2022',
          imageUrl: AppImages.daNangBanaHoiAn,
          likes: 1252,
          price: 4005.00,
          quantities: 3,
          ratings: 6),
    ];
  }

  Future<List<BestGuideJson>> getListBestGuide() async {
    return <BestGuideJson>[
      BestGuideJson(
          address: 'Da Nang - Viet Nam',
          imageUrl: AppImages.emmy,
          reviews: 127,
          name: 'Emmy',
          ratings: 1),
      BestGuideJson(
          address: 'Ho Chi Minh - Viet Nam',
          imageUrl: AppImages.emmy,
          reviews: 122,
          name: 'Eric Pham',
          ratings: 2),
      BestGuideJson(
          address: 'Ha Noi - Viet Nam',
          imageUrl: AppImages.emmy,
          reviews: 100,
          name: 'Khan Pham',
          ratings: 3),
      BestGuideJson(
          address: 'Phu Yen - Viet Nam',
          imageUrl: AppImages.emmy,
          reviews: 111,
          name: 'Tuong Vi',
          ratings: 4),
    ];
  }

  Future<List<TopExperienceJson>> getListTopExperiences() async {
    return <TopExperienceJson>[
      TopExperienceJson(
          address: 'Hoi An, Viet Nam',
          description: '2 Hour Bicycle Tour exploring Hoi An',
          destinationImageUrl: AppImages.hoiAn,
          guideImageUrl: AppImages.emmy,
          name: 'Emmy'),
      TopExperienceJson(
          address: 'TPHCM, Viet Nam',
          description: '2 Hour Bicycle Tour exploring Hoi An',
          destinationImageUrl: AppImages.hoiAn,
          guideImageUrl: AppImages.emmy,
          name: 'Duy Khan'),
      TopExperienceJson(
          address: 'Ha Noi, Viet Nam',
          description: '2 Hour Bicycle Tour exploring Hoi An',
          destinationImageUrl: AppImages.hoiAn,
          guideImageUrl: AppImages.emmy,
          name: 'Tuong Vi'),
      TopExperienceJson(
          address: 'Hoi An, Viet Nam',
          description: '2 Hour Bicycle Tour exploring Hoi An',
          destinationImageUrl: AppImages.hoiAn,
          guideImageUrl: AppImages.emmy,
          name: 'Emmy'),
      TopExperienceJson(
          address: 'Hoi An, Viet Nam',
          description: '2 Hour Bicycle Tour exploring Hoi An',
          destinationImageUrl: AppImages.hoiAn,
          guideImageUrl: AppImages.emmy,
          name: 'Emmy')
    ];
  }

  Future<List<FeatureTourJson>> getListFeatureTour() async {
    return <FeatureTourJson>[
      FeatureTourJson(
          address: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2020',
          destinationImageUrl: AppImages.daNangBanaHoiAn1,
          likes: 1250,
          quantities: 3,
          prices: 100.00,
          ratings: 2),
      FeatureTourJson(
          address: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2020',
          destinationImageUrl: AppImages.daNangBanaHoiAn1,
          likes: 1250,
          prices: 200.00,
          quantities: 3,
          ratings: 3),
      FeatureTourJson(
          address: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2020',
          destinationImageUrl: AppImages.daNangBanaHoiAn1,
          prices: 300.00,
          likes: 1250,
          quantities: 3,
          ratings: 4),
      FeatureTourJson(
          address: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2020',
          destinationImageUrl: AppImages.daNangBanaHoiAn1,
          prices: 400.00,
          likes: 1250,
          quantities: 3,
          ratings: 1),
      FeatureTourJson(
          address: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2020',
          destinationImageUrl: AppImages.daNangBanaHoiAn1,
          likes: 1250,
          prices: 500.00,
          quantities: 3,
          ratings: 5)
    ];
  }

  Future<List<TravelNewJson>> getListTravelNews() async {
    return <TravelNewJson>[
      TravelNewJson(
          dateStart: 'Feb 6, 2022',
          destinationImageUrl: AppImages.cungVanHoaThieuNhi,
          destinationTitle: ' Da Nang City'),
      TravelNewJson(
          dateStart: 'Feb 6, 2022',
          destinationImageUrl: AppImages.cungVanHoaThieuNhi,
          destinationTitle: 'New Destination in Da Nang City'),
      TravelNewJson(
          dateStart: 'Feb 6, 2022',
          destinationImageUrl: AppImages.cungVanHoaThieuNhi,
          destinationTitle: 'New Destination '),
      TravelNewJson(
          dateStart: 'Feb 6, 2022',
          destinationImageUrl: AppImages.cungVanHoaThieuNhi,
          destinationTitle: 'New Destination in Da Nang City'),
      TravelNewJson(
          dateStart: 'Feb 6, 2022',
          destinationImageUrl: AppImages.cungVanHoaThieuNhi,
          destinationTitle: 'New Da Nang City'),
      TravelNewJson(
          dateStart: 'Feb 6, 2022',
          destinationImageUrl: AppImages.cungVanHoaThieuNhi,
          destinationTitle: 'New Destination in Da Nang City')
    ];
  }

  @override
  void onInitialData() {}

  @override
  void reloadData() {}
}
