import 'package:travel_booking_tour/base/base_repository.dart';
import 'package:travel_booking_tour/data/dio/api_client.dart';
import 'package:travel_booking_tour/data/model/meta_json.dart';
import 'package:travel_booking_tour/data/model/news_json.dart';
import 'package:travel_booking_tour/data/model/user_experiences_json.dart';
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

  Future<List<UserExperienceJson>> getListUserExperiences() =>
      _apiService.getJson(
          endPoint: '/api/journeys',
          queryParams: {'populate': '*'},
          converter: (data) {
            final result = data['data'];
            if (result is Iterable) {
              return result.map((element) {
                final photos = element['attributes']['multi']['data'];

                List<String>? images = [];
                if (photos is Iterable) {
                  images = photos
                      .map((e) => e['attributes']['url'].toString())
                      .toList();
                }

                return UserExperienceJson(
                    id: element['id'],
                    guideName: element['attributes']['user']['data']
                            ['attributes']['lastName'] +
                        element['attributes']['user']['data']['attributes']
                            ['firstName'],
                    location: element['attributes']['location'],
                    name: element['attributes']['name'],
                    multi: images);
              }).toList();
            }
            return [];
          });

  Future<String?> getDetailUserExperiences(int? id) async {
    return _apiService.getJson(
      endPoint: '$apiEndPoint/journeys/$id',
      queryParams: {'populate[0]': 'user', 'populate[1]': 'user.avatar'},
      converter: (data) {
        return data['data']['attributes']['user']['data']['attributes']
            ?['avatar']['data']?['attributes']['url'];
      },
    );
  }

  Future<List<TourDetailJson>> getListTopJourneyLocal() async {
    return <TourDetailJson>[
      const TourDetailJson(
          destination: 'Da Nang - Ba Na - Hoi An',
          departureDate: 'Thurday 30, 2022',
          images: [
            'https://i.imgur.com/BbjZ4mB.jpeg',
            'https://i.imgur.com/eHBtlB6.jpeg',
            'https://i.imgur.com/bpt94dv.jpeg'
          ],
          likes: 1333,
          price: 450.00,
          departurePlace: 'Ho Chi Minh',
          description: '1 day at Ba Na hill',
          duration: '2 days, 2 nights',
          isFavorite: true,
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
          tourGuideId: 0,
          rating: 1),
      const TourDetailJson(
          destination: 'Nha Trang - Khanh Hoa - Cam Ranh',
          departureDate: 'Jan 30, 2022',
          images: [
            'https://i.imgur.com/d4cKuVa.jpeg',
            'https://i.imgur.com/XqBVxWg.jpeg',
            'https://i.imgur.com/la3gRc2.jpeg'
          ],
          likes: 1247,
          price: 450.00,
          departurePlace: 'Ho Chi Minh',
          description: '1 day at Ba Na hill',
          duration: '2 days, 2 nights',
          isFavorite: false,
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
            ScheduleJson(id: 0, name: 'Ho Chi Minh - Nha Trang', schedules: [
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
          destination: 'Phu Yen - Binh Dinh',
          departureDate: 'Jan 30, 2022',
          images: [
            'https://i.imgur.com/43DQSsX.jpeg',
            'https://i.imgur.com/nkkAUoL.jpeg',
            'https://i.imgur.com/XPFSMJg.jpeg'
          ],
          likes: 1247,
          price: 450.00,
          departurePlace: 'Ho Chi Minh',
          description: '1 day at Ba Na hill',
          duration: '2 days, 2 nights',
          isFavorite: true,
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
          tourGuideId: 2,
          rating: 1),
      const TourDetailJson(
          destination: 'Long An - Ca Mau - Dong Thap',
          departureDate: 'Jan 30, 2022',
          images: [
            'https://media-cdn.tripadvisor.com/media/photo-s/06/48/1b/e1/the-monument-at-the-dat.jpg',
            'https://fileapi.surego.vn/Upload/NewsImage/R636625818411077570.jpg',
            'https://dongthap.gov.vn/documents/34223/0/dt1+%281%29.jpg/7124a7ec-50ca-3067-fed9-c7e79cb41198?t=1613097740118'
          ],
          likes: 1247,
          price: 450.00,
          departurePlace: 'Ho Chi Minh',
          description: '1 day at Ba Na hill',
          duration: '2 days, 2 nights',
          isFavorite: false,
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
          tourGuideId: 3,
          rating: 1),
      const TourDetailJson(
          destination: 'Ha Giang - Lạng Sơn',
          departureDate: 'Jan 30, 2022',
          images: [
            'https://media.istockphoto.com/id/1191185918/photo/paddy-rice-terraces-with-ripe-yellow-rice.jpg?b=1&s=170667a&w=0&k=20&c=CGnVFcmhhC2Gt6kfRtaa44DVh_9kJH2_6y2VoiKsfZk=',
            'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/03/kinh-nghiem-du-lich-lang-son-1-e1527846702337.jpg',
            'https://ik.imagekit.io/tvlk/blog/2021/09/kinh-nghiem-du-lich-lang-son-1.jpg'
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
          tourGuideId: 0,
          rating: 1)
    ];
  }

  @override
  void onInitialData() {}

  @override
  void reloadData() {}
}
