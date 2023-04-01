import 'package:travel_booking_tour/base/base_repository.dart';
import 'package:travel_booking_tour/data/models/schedule_json.dart';
import 'package:travel_booking_tour/data/models/schedule_point_json.dart';
import 'package:travel_booking_tour/data/models/tour_detail_json.dart';
import 'package:travel_booking_tour/data/models/tour_guide_detail_json.dart';
import 'package:travel_booking_tour/data/models/tour_provider_json.dart';
import 'package:travel_booking_tour/res/images.dart';

import '../../../data/models/review_json.dart';

class ExploreRepository implements BaseRepository {
  Future<List<TourDetailJson>> getListTopJourney() async {
    return <TourDetailJson>[
      const TourDetailJson(
          destination: 'Da Nang - Ba Na - Hoi An',
          departureDate: 'Thurday 30, 2022',
          images: [
            AppImages.cungVanHoaThieuNhi,
            AppImages.daNangBanaHoiAn,
            AppImages.cungVanHoaThieuNhi
          ],
          likes: 1333,
          price: 450.00,
          departurePlace: 'Ho Chi Minh',
          description: '1 day at Ba Na hill',
          duration: '2 days, 2 nights',
          isFavorite: true,
          provider: TourProviderJson(id: 1, name: 'dulichviet'),
          reviews: 145,
          id: 0,
          prices: {
            'Adult (>10 years old)': '\$400.00',
            'Child (5 - 10 years old)': '\$320.00',
            'Child (<5 years old)': 'Free'
          },
          saleOff: 400.00,
          schedule: [
            ScheduleJson(id: 0, name: 'Ho Chi Minh - Da Nang', schedules: [
              SchedulePointJson(
                  id: 0,
                  time: '6:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '7:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '8:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '9:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '10:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.')
            ]),
            ScheduleJson(id: 1, name: 'Da Nang - Hue', schedules: [
              SchedulePointJson(
                  id: 0,
                  time: '16:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '17:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '18:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '19:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '20:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.')
            ])
          ],
          tourGuideId: 0,
          rating: 1),
      const TourDetailJson(
          destination: 'Da Nang - Ba Na - Hoi An',
          departureDate: 'Jan 30, 2022',
          images: [
            AppImages.cungVanHoaThieuNhi,
            AppImages.daNangBanaHoiAn,
            AppImages.cungVanHoaThieuNhi
          ],
          likes: 1247,
          price: 450.00,
          departurePlace: 'Ho Chi Minh',
          description: '1 day at Ba Na hill',
          duration: '2 days, 2 nights',
          isFavorite: false,
          provider: TourProviderJson(id: 1, name: 'dulichviet'),
          reviews: 145,
          id: 1,
          prices: {
            'Adult (>10 years old)': '\$400.00',
            'Child (5 - 10 years old)': '\$320.00',
            'Child (<5 years old)': 'Free'
          },
          saleOff: 400.00,
          schedule: [
            ScheduleJson(id: 0, name: 'Ho Chi Minh - Da Nang', schedules: [
              SchedulePointJson(
                  id: 0,
                  time: '6:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '7:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '8:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '9:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '10:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.')
            ]),
            ScheduleJson(id: 1, name: 'Da Nang - Hue', schedules: [
              SchedulePointJson(
                  id: 0,
                  time: '16:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '17:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '18:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '19:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '20:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.')
            ])
          ],
          tourGuideId: 1,
          rating: 1),
      const TourDetailJson(
          destination: 'Da Nang - Ba Na - Hoi An',
          departureDate: 'Jan 30, 2022',
          images: [
            AppImages.cungVanHoaThieuNhi,
            AppImages.daNangBanaHoiAn,
            AppImages.cungVanHoaThieuNhi
          ],
          likes: 1247,
          price: 450.00,
          departurePlace: 'Ho Chi Minh',
          description: '1 day at Ba Na hill',
          duration: '2 days, 2 nights',
          isFavorite: true,
          provider: TourProviderJson(id: 1, name: 'dulichviet'),
          reviews: 145,
          id: 2,
          prices: {
            'Adult (>10 years old)': '\$400.00',
            'Child (5 - 10 years old)': '\$320.00',
            'Child (<5 years old)': 'Free'
          },
          saleOff: 400.00,
          schedule: [
            ScheduleJson(id: 0, name: 'Ho Chi Minh - Da Nang', schedules: [
              SchedulePointJson(
                  id: 0,
                  time: '6:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '7:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '8:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '9:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '10:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.')
            ]),
            ScheduleJson(id: 1, name: 'Da Nang - Hue', schedules: [
              SchedulePointJson(
                  id: 0,
                  time: '16:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '17:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '18:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '19:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '20:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.')
            ])
          ],
          tourGuideId: 2,
          rating: 1),
      const TourDetailJson(
          destination: 'Da Nang - Ba Na - Hoi An',
          departureDate: 'Jan 30, 2022',
          images: [
            AppImages.cungVanHoaThieuNhi,
            AppImages.daNangBanaHoiAn,
            AppImages.cungVanHoaThieuNhi
          ],
          likes: 1247,
          price: 450.00,
          departurePlace: 'Ho Chi Minh',
          description: '1 day at Ba Na hill',
          duration: '2 days, 2 nights',
          isFavorite: false,
          provider: TourProviderJson(id: 1, name: 'dulichviet'),
          reviews: 145,
          id: 3,
          prices: {
            'Adult (>10 years old)': '\$400.00',
            'Child (5 - 10 years old)': '\$320.00',
            'Child (<5 years old)': 'Free'
          },
          saleOff: 400.00,
          schedule: [
            ScheduleJson(id: 0, name: 'Ho Chi Minh - Da Nang', schedules: [
              SchedulePointJson(
                  id: 0,
                  time: '6:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '7:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '8:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '9:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '10:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.')
            ]),
            ScheduleJson(id: 1, name: 'Da Nang - Hue', schedules: [
              SchedulePointJson(
                  id: 0,
                  time: '16:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '17:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '18:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '19:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '20:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.')
            ])
          ],
          tourGuideId: 3,
          rating: 1),
      const TourDetailJson(
          destination: 'Da Nang - Ba Na - Hoi An',
          departureDate: 'Jan 30, 2022',
          images: [
            AppImages.cungVanHoaThieuNhi,
            AppImages.daNangBanaHoiAn,
            AppImages.cungVanHoaThieuNhi
          ],
          likes: 1247,
          price: 450.00,
          departurePlace: 'Ho Chi Minh',
          description: '1 day at Ba Na hill',
          duration: '2 days, 2 nights',
          isFavorite: false,
          provider: TourProviderJson(id: 1, name: 'dulichviet'),
          reviews: 145,
          id: 4,
          prices: {
            'Adult (>10 years old)': '\$400.00',
            'Child (5 - 10 years old)': '\$320.00',
            'Child (<5 years old)': 'Free'
          },
          saleOff: 400.00,
          schedule: [
            ScheduleJson(id: 0, name: 'Ho Chi Minh - Da Nang', schedules: [
              SchedulePointJson(
                  id: 0,
                  time: '6:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '7:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '8:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '9:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '10:00 AM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.')
            ]),
            ScheduleJson(id: 1, name: 'Da Nang - Hue', schedules: [
              SchedulePointJson(
                  id: 0,
                  time: '16:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '17:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '18:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '19:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'),
              SchedulePointJson(
                  id: 0,
                  time: '20:00 PM',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.')
            ])
          ],
          tourGuideId: 0,
          rating: 1)
    ];
  }

  Future<TourGuideDetailJson> getTourGuideDetail(int id) async {
    return await Future.delayed(
      const Duration(seconds: 0),
      () => tourGuides.firstWhere((element) => element.id == id),
    );
  }

  Future<List<TourGuideDetailJson>> getListTourGuide() async {
    return tourGuides;
  }

  List<TourGuideDetailJson> tourGuides = const [
    TourGuideDetailJson(
        id: 0,
        name: 'Tuan Tran',
        address: 'Da Nang, Viet Nam',
        coverImageUrl: AppImages.tuanTran,
        profileImageUrl: AppImages.tuanTran,
        rating: 2,
        languages: ['Vietnamese', 'Chinese', 'Korean'],
        prices: {
          '1 - 3 Travelers': '\$10/ hour',
          '4 - 6 Travelers': '\$14/ hour',
          '7 - 9 Travelers': '\$17/ hour'
        },
        videoIntroductionUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        description:
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        experiences: [
          TourDetailJson(
            id: 5,
            departureDate: 'Jan 25. 2023',
            destination: 'Hoi An, Viet Nam',
            description: '2 Hour Bicycle Tour exploring Hoi An',
            likes: 1234,
            isFavorite: false,
            images: [AppImages.myex1, AppImages.myex3, AppImages.myex3],
          ),
          TourDetailJson(
            id: 6,
            departureDate: 'Jan 25. 2023',
            destination: 'Hoi An, Viet Nam',
            description: 'Food tour in Da Nang',
            likes: 234,
            isFavorite: false,
            images: [AppImages.myex1, AppImages.myex3, AppImages.myex3],
          )
        ],
        reviews: [
          ReviewJson(
              id: 0,
              content:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.',
              createdAt: '09-3-2023',
              ratersImage: AppImages.emmy,
              ratersName: 'Pena John',
              rating: 2),
          ReviewJson(
              id: 1,
              content:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.',
              createdAt: '09-3-2023',
              ratersImage: AppImages.emmy,
              ratersName: 'Pena John',
              rating: 3),
          ReviewJson(
              id: 2,
              content:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.',
              createdAt: '09-3-2023',
              ratersImage: AppImages.emmy,
              ratersName: 'Pena John',
              rating: 5)
        ]),
    TourGuideDetailJson(
        id: 1,
        name: 'Emmy',
        rating: 2,
        address: 'Ho Chi Minh, Viet Nam',
        languages: ['Vietnamese', 'Korean'],
        videoIntroductionUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        coverImageUrl: AppImages.emmy,
        profileImageUrl: AppImages.emmy,
        prices: {
          '1 - 3 Travelers': '\$10/ hour',
          '4 - 6 Travelers': '\$14/ hour',
          '7 - 9 Travelers': '\$17/ hour'
        },
        description:
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        experiences: [
          TourDetailJson(
            id: 7,
            departureDate: 'Jan 25. 2023',
            destination: 'Hoi An, Viet Nam',
            description: '2 Hour Bicycle Tour exploring Hoi An',
            likes: 5555,
            isFavorite: false,
            images: [AppImages.myex1, AppImages.myex3, AppImages.myex3],
          ),
          TourDetailJson(
            id: 8,
            departureDate: 'Jan 25. 2023',
            destination: 'Hoi An, Viet Nam',
            description: 'Food tour in Da Nang',
            likes: 6666,
            isFavorite: false,
            images: [AppImages.myex1, AppImages.myex3, AppImages.myex3],
          )
        ],
        reviews: [
          ReviewJson(
              id: 0,
              content:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.',
              createdAt: '09-3-2023',
              ratersImage: AppImages.tuanTran,
              ratersName: 'Pena John',
              rating: 2),
          ReviewJson(
              id: 1,
              content:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.',
              createdAt: '09-3-2023',
              ratersImage: AppImages.tuanTran,
              ratersName: 'Pena John',
              rating: 3),
          ReviewJson(
              id: 2,
              content:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.',
              createdAt: '09-3-2023',
              ratersImage: AppImages.tuanTran,
              ratersName: 'Pena John',
              rating: 5)
        ]),
    TourGuideDetailJson(
        id: 2,
        name: 'Tuan Tran',
        rating: 2,
        videoIntroductionUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        address: 'Da Nang, Viet Nam',
        coverImageUrl: AppImages.tuanTran,
        profileImageUrl: AppImages.tuanTran,
        languages: ['Vietnamese', 'Spanish', 'Korean'],
        prices: {
          '1 - 3 Travelers': '\$10/ hour',
          '4 - 6 Travelers': '\$14/ hour',
          '7 - 9 Travelers': '\$17/ hour'
        },
        description:
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        experiences: [
          TourDetailJson(
            id: 9,
            departureDate: 'Jan 25. 2023',
            destination: 'Hoi An, Viet Nam',
            description: '2 Hour Bicycle Tour exploring Hoi An',
            likes: 1234,
            isFavorite: false,
            images: [AppImages.myex1, AppImages.myex3, AppImages.myex3],
          ),
          TourDetailJson(
            id: 10,
            departureDate: 'Jan 25. 2023',
            destination: 'Hoi An, Viet Nam',
            description: 'Food tour in Da Nang',
            likes: 234,
            isFavorite: false,
            images: [AppImages.myex1, AppImages.myex3, AppImages.myex3],
          )
        ],
        reviews: [
          ReviewJson(
              id: 0,
              content:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.',
              createdAt: '09-3-2023',
              ratersImage: AppImages.emmy,
              ratersName: 'Pena John',
              rating: 2),
          ReviewJson(
              id: 1,
              content:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.',
              createdAt: '09-3-2023',
              ratersImage: AppImages.emmy,
              ratersName: 'Pena John',
              rating: 3),
          ReviewJson(
              id: 2,
              content:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.',
              createdAt: '09-3-2023',
              ratersImage: AppImages.emmy,
              ratersName: 'Pena John',
              rating: 5)
        ]),
    TourGuideDetailJson(
        id: 3,
        name: 'Emmy',
        rating: 2,
        languages: ['Vietnamese', 'Korean'],
        videoIntroductionUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        address: 'Ho Chi Minh, Viet Nam',
        profileImageUrl: AppImages.emmy,
        prices: {
          '1 - 3 Travelers': '\$10/ hour',
          '4 - 6 Travelers': '\$14/ hour',
          '7 - 9 Travelers': '\$17/ hour'
        },
        coverImageUrl: AppImages.emmy,
        description:
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        experiences: [
          TourDetailJson(
            id: 11,
            departureDate: 'Jan 25. 2023',
            destination: 'Hoi An, Viet Nam',
            description: '2 Hour Bicycle Tour exploring Hoi An',
            likes: 5555,
            isFavorite: false,
            images: [AppImages.myex1, AppImages.myex3, AppImages.myex3],
          ),
          TourDetailJson(
            id: 12,
            departureDate: 'Jan 25. 2023',
            destination: 'Hoi An, Viet Nam',
            description: 'Food tour in Da Nang',
            likes: 6666,
            isFavorite: false,
            images: [AppImages.myex1, AppImages.myex3, AppImages.myex3],
          )
        ],
        reviews: [
          ReviewJson(
              id: 0,
              content:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.',
              createdAt: '09-3-2023',
              ratersImage: AppImages.tuanTran,
              ratersName: 'Pena John',
              rating: 2),
          ReviewJson(
              id: 1,
              content:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.',
              createdAt: '09-3-2023',
              ratersImage: AppImages.tuanTran,
              ratersName: 'Pena John',
              rating: 3),
          ReviewJson(
              id: 2,
              content:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.',
              createdAt: '09-3-2023',
              ratersImage: AppImages.tuanTran,
              ratersName: 'Pena John',
              rating: 5)
        ])
  ];

  Future<List<TourGuideDetailJson>> loadMoreTourGuide() async {
    return tourGuides;
  }

  Future<List<TourGuideDetailJson>> loadMoreTour() async {
    return await getListTourGuide();
  }

  @override
  void onInitialData() {}

  @override
  void reloadData() {}
}
