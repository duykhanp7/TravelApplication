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
      const TopJourneyJson(
          destinationTitle: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2022',
          imageUrl: AppImages.daNangBanaHoiAn,
          likes: 1247,
          price: 400.00,
          quantities: 3,
          ratings: 1),
      const TopJourneyJson(
          destinationTitle: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2022',
          imageUrl: AppImages.daNangBanaHoiAn,
          likes: 1248,
          price: 4030.00,
          quantities: 3,
          ratings: 2),
      const TopJourneyJson(
          destinationTitle: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2022',
          imageUrl: AppImages.daNangBanaHoiAn,
          likes: 1249,
          price: 4010.00,
          quantities: 3,
          ratings: 3),
      const TopJourneyJson(
          destinationTitle: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2022',
          imageUrl: AppImages.daNangBanaHoiAn,
          likes: 1250,
          price: 4030.00,
          quantities: 3,
          ratings: 4),
      const TopJourneyJson(
          destinationTitle: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2022',
          imageUrl: AppImages.daNangBanaHoiAn,
          likes: 1251,
          price: 4001.00,
          quantities: 3,
          ratings: 5),
      const TopJourneyJson(
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
      const BestGuideJson(
          address: 'Da Nang - Viet Nam',
          imageUrl: AppImages.emmy,
          reviews: 127,
          name: 'Emmy',
          ratings: 1),
      const BestGuideJson(
          address: 'Ho Chi Minh - Viet Nam',
          imageUrl: AppImages.emmy,
          reviews: 122,
          name: 'Eric Pham',
          ratings: 2),
      const BestGuideJson(
          address: 'Ha Noi - Viet Nam',
          imageUrl: AppImages.emmy,
          reviews: 100,
          name: 'Khan Pham',
          ratings: 3),
      const BestGuideJson(
          address: 'Phu Yen - Viet Nam',
          imageUrl: AppImages.emmy,
          reviews: 111,
          name: 'Tuong Vi',
          ratings: 4),
    ];
  }

  Future<List<TopExperienceJson>> getListTopExperiences() async {
    return <TopExperienceJson>[
      const TopExperienceJson(
          address: 'Hoi An, Viet Nam',
          description: '2 Hour Bicycle Tour exploring Hoi An',
          destinationImageUrl: AppImages.hoiAn,
          guideImageUrl: AppImages.emmy,
          name: 'Emmy'),
      const TopExperienceJson(
          address: 'TPHCM, Viet Nam',
          description: '2 Hour Bicycle Tour exploring Hoi An',
          destinationImageUrl: AppImages.hoiAn,
          guideImageUrl: AppImages.emmy,
          name: 'Duy Khan'),
      const TopExperienceJson(
          address: 'Ha Noi, Viet Nam',
          description: '2 Hour Bicycle Tour exploring Hoi An',
          destinationImageUrl: AppImages.hoiAn,
          guideImageUrl: AppImages.emmy,
          name: 'Tuong Vi'),
      const TopExperienceJson(
          address: 'Hoi An, Viet Nam',
          description: '2 Hour Bicycle Tour exploring Hoi An',
          destinationImageUrl: AppImages.hoiAn,
          guideImageUrl: AppImages.emmy,
          name: 'Emmy'),
      // ignore: prefer_const_constructors
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
      const FeatureTourJson(
          address: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2020',
          destinationImageUrl: AppImages.daNangBanaHoiAn1,
          likes: 1250,
          quantities: 3,
          prices: 100.00,
          ratings: 2),
      // ignore: prefer_const_constructors
      FeatureTourJson(
          address: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2020',
          destinationImageUrl: AppImages.daNangBanaHoiAn1,
          likes: 1250,
          prices: 200.00,
          quantities: 3,
          ratings: 3),
      const FeatureTourJson(
          address: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2020',
          destinationImageUrl: AppImages.daNangBanaHoiAn1,
          prices: 300.00,
          likes: 1250,
          quantities: 3,
          ratings: 4),
      const FeatureTourJson(
          address: 'Da Nang - Ba Na - Hoi An',
          dateStart: 'Jan 30, 2020',
          destinationImageUrl: AppImages.daNangBanaHoiAn1,
          prices: 400.00,
          likes: 1250,
          quantities: 3,
          ratings: 1),
      const FeatureTourJson(
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
      const TravelNewJson(
          dateStart: 'Feb 6, 2022',
          destinationImageUrl: AppImages.cungVanHoaThieuNhi,
          destinationTitle: ' Da Nang City'),
      const TravelNewJson(
          dateStart: 'Feb 6, 2022',
          destinationImageUrl: AppImages.cungVanHoaThieuNhi,
          destinationTitle: 'New Destination in Da Nang City'),
      const TravelNewJson(
          dateStart: 'Feb 6, 2022',
          destinationImageUrl: AppImages.cungVanHoaThieuNhi,
          destinationTitle: 'New Destination '),
      const TravelNewJson(
          dateStart: 'Feb 6, 2022',
          destinationImageUrl: AppImages.cungVanHoaThieuNhi,
          destinationTitle: 'New Destination in Da Nang City'),
      const TravelNewJson(
          dateStart: 'Feb 6, 2022',
          destinationImageUrl: AppImages.cungVanHoaThieuNhi,
          destinationTitle: 'New Da Nang City'),
      const TravelNewJson(
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
