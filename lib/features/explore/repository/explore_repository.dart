import 'package:travel_booking_tour/base/base_repository.dart';
import 'package:travel_booking_tour/data/dio/api_client.dart';
import 'package:travel_booking_tour/data/model/meta_json.dart';
import 'package:travel_booking_tour/data/model/news_json.dart';
import '../../../data/model/schedule_json.dart';
import '../../../data/model/schedule_point_json.dart';
import '../../../data/model/tour_detail_json.dart';
import '../../../data/model/tour_guide_detail_json.dart';
import '../../../data/model/tour_provider_json.dart';

class ExploreRepository implements BaseRepository {
  final ApiService _apiService = ApiService();
  final String apiEndPoint = '/api';

  MetaJson? metaBlogJson;

  Future<List<NewsJson>> getListNews(int page) async => _apiService.getJson(
        endPoint: '$apiEndPoint/blogs',
        queryParams: {'populate': '*', 'pagination[page]': page},
        converter: (data) {
          dynamic result = data['data'];
          if (result is Iterable) {
            return result.map((e) => NewsJson.fromJson(e)).toList();
          }
          return [];
        },
      );

  // Future<TourGuideDetailJson> getTourGuideDetail(int id) async {
  //   return await Future.delayed(
  //     const Duration(seconds: 0),
  //     () => tourGuides.firstWhere((element) => element.id == id),
  //   );
  // }

  Future<NewsJson?> getDetailNews(int? id) async => _apiService.getJson(
        endPoint: '$apiEndPoint/blogs/$id',
        queryParams: {'populate': '*'},
        converter: (data) => NewsJson.fromJson(data['data']),
      );

  Future<List<TourGuideDetailJson>> getListTourGuide(int? page) async =>
      _apiService.getJson(
        endPoint: '$apiEndPoint/guides',
        queryParams: {'populate[user][populate][0]': 'avatar'},
        converter: (data) {
          final result = data['data'];
          if (result != null) {
            if (result is Iterable) {
              return result
                  .map((e) => TourGuideDetailJson.fromJson(e))
                  .toList();
            }
          }
          return [];
        },
      );

  Future<List<TourDetailJson>> getListTopJourney() async {
    return <TourDetailJson>[
      const TourDetailJson(
          destination: 'Da Nang - Ba Na - Hoi An',
          departureDate: 'Thurday 30, 2022',
          images: [
            'https://i.imgur.com/dkvXnVp.png',
            'https://i.imgur.com/dkvXnVp.png',
            'https://i.imgur.com/oYG6Q0F.png'
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
            'https://i.imgur.com/dkvXnVp.png',
            'https://i.imgur.com/dkvXnVp.png',
            'https://i.imgur.com/oYG6Q0F.png'
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
            'https://i.imgur.com/dkvXnVp.png',
            'https://i.imgur.com/dkvXnVp.png',
            'https://i.imgur.com/oYG6Q0F.png'
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
            'https://i.imgur.com/dkvXnVp.png',
            'https://i.imgur.com/dkvXnVp.png',
            'https://i.imgur.com/oYG6Q0F.png'
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
            'https://i.imgur.com/dkvXnVp.png',
            'https://i.imgur.com/dkvXnVp.png',
            'https://i.imgur.com/oYG6Q0F.png'
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

  @override
  void onInitialData() {}

  @override
  void reloadData() {}
}
