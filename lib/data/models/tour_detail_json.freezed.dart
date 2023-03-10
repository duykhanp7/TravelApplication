// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_detail_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TourDetailJson _$TourDetailJsonFromJson(Map<String, dynamic> json) {
  return _TourDetailJson.fromJson(json);
}

/// @nodoc
mixin _$TourDetailJson {
  int? get id => throw _privateConstructorUsedError;
  int? get tourGuideId => throw _privateConstructorUsedError;
  String? get destination => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  double? get saleOff => throw _privateConstructorUsedError;
  int? get rating => throw _privateConstructorUsedError;
  int? get reviews => throw _privateConstructorUsedError;
  int? get likes => throw _privateConstructorUsedError;
  bool? get isFavorite => throw _privateConstructorUsedError;
  TourProviderJson? get provider => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get departureDate => throw _privateConstructorUsedError;
  String? get departurePlace => throw _privateConstructorUsedError;
  List<ScheduleJson>? get schedule => throw _privateConstructorUsedError;
  Map<String, String>? get prices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TourDetailJsonCopyWith<TourDetailJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourDetailJsonCopyWith<$Res> {
  factory $TourDetailJsonCopyWith(
          TourDetailJson value, $Res Function(TourDetailJson) then) =
      _$TourDetailJsonCopyWithImpl<$Res, TourDetailJson>;
  @useResult
  $Res call(
      {int? id,
      int? tourGuideId,
      String? destination,
      List<String>? images,
      double? price,
      double? saleOff,
      int? rating,
      int? reviews,
      int? likes,
      bool? isFavorite,
      TourProviderJson? provider,
      String? duration,
      String? description,
      String? departureDate,
      String? departurePlace,
      List<ScheduleJson>? schedule,
      Map<String, String>? prices});

  $TourProviderJsonCopyWith<$Res>? get provider;
}

/// @nodoc
class _$TourDetailJsonCopyWithImpl<$Res, $Val extends TourDetailJson>
    implements $TourDetailJsonCopyWith<$Res> {
  _$TourDetailJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tourGuideId = freezed,
    Object? destination = freezed,
    Object? images = freezed,
    Object? price = freezed,
    Object? saleOff = freezed,
    Object? rating = freezed,
    Object? reviews = freezed,
    Object? likes = freezed,
    Object? isFavorite = freezed,
    Object? provider = freezed,
    Object? duration = freezed,
    Object? description = freezed,
    Object? departureDate = freezed,
    Object? departurePlace = freezed,
    Object? schedule = freezed,
    Object? prices = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      tourGuideId: freezed == tourGuideId
          ? _value.tourGuideId
          : tourGuideId // ignore: cast_nullable_to_non_nullable
              as int?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      saleOff: freezed == saleOff
          ? _value.saleOff
          : saleOff // ignore: cast_nullable_to_non_nullable
              as double?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as int?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as TourProviderJson?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      departureDate: freezed == departureDate
          ? _value.departureDate
          : departureDate // ignore: cast_nullable_to_non_nullable
              as String?,
      departurePlace: freezed == departurePlace
          ? _value.departurePlace
          : departurePlace // ignore: cast_nullable_to_non_nullable
              as String?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<ScheduleJson>?,
      prices: freezed == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TourProviderJsonCopyWith<$Res>? get provider {
    if (_value.provider == null) {
      return null;
    }

    return $TourProviderJsonCopyWith<$Res>(_value.provider!, (value) {
      return _then(_value.copyWith(provider: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TourDetailJsonCopyWith<$Res>
    implements $TourDetailJsonCopyWith<$Res> {
  factory _$$_TourDetailJsonCopyWith(
          _$_TourDetailJson value, $Res Function(_$_TourDetailJson) then) =
      __$$_TourDetailJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? tourGuideId,
      String? destination,
      List<String>? images,
      double? price,
      double? saleOff,
      int? rating,
      int? reviews,
      int? likes,
      bool? isFavorite,
      TourProviderJson? provider,
      String? duration,
      String? description,
      String? departureDate,
      String? departurePlace,
      List<ScheduleJson>? schedule,
      Map<String, String>? prices});

  @override
  $TourProviderJsonCopyWith<$Res>? get provider;
}

/// @nodoc
class __$$_TourDetailJsonCopyWithImpl<$Res>
    extends _$TourDetailJsonCopyWithImpl<$Res, _$_TourDetailJson>
    implements _$$_TourDetailJsonCopyWith<$Res> {
  __$$_TourDetailJsonCopyWithImpl(
      _$_TourDetailJson _value, $Res Function(_$_TourDetailJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tourGuideId = freezed,
    Object? destination = freezed,
    Object? images = freezed,
    Object? price = freezed,
    Object? saleOff = freezed,
    Object? rating = freezed,
    Object? reviews = freezed,
    Object? likes = freezed,
    Object? isFavorite = freezed,
    Object? provider = freezed,
    Object? duration = freezed,
    Object? description = freezed,
    Object? departureDate = freezed,
    Object? departurePlace = freezed,
    Object? schedule = freezed,
    Object? prices = freezed,
  }) {
    return _then(_$_TourDetailJson(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      tourGuideId: freezed == tourGuideId
          ? _value.tourGuideId
          : tourGuideId // ignore: cast_nullable_to_non_nullable
              as int?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      saleOff: freezed == saleOff
          ? _value.saleOff
          : saleOff // ignore: cast_nullable_to_non_nullable
              as double?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as int?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as TourProviderJson?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      departureDate: freezed == departureDate
          ? _value.departureDate
          : departureDate // ignore: cast_nullable_to_non_nullable
              as String?,
      departurePlace: freezed == departurePlace
          ? _value.departurePlace
          : departurePlace // ignore: cast_nullable_to_non_nullable
              as String?,
      schedule: freezed == schedule
          ? _value._schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<ScheduleJson>?,
      prices: freezed == prices
          ? _value._prices
          : prices // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TourDetailJson
    with DiagnosticableTreeMixin
    implements _TourDetailJson {
  const _$_TourDetailJson(
      {this.id,
      this.tourGuideId,
      this.destination,
      final List<String>? images,
      this.price,
      this.saleOff,
      this.rating,
      this.reviews,
      this.likes,
      this.isFavorite,
      this.provider,
      this.duration,
      this.description,
      this.departureDate,
      this.departurePlace,
      final List<ScheduleJson>? schedule,
      final Map<String, String>? prices})
      : _images = images,
        _schedule = schedule,
        _prices = prices;

  factory _$_TourDetailJson.fromJson(Map<String, dynamic> json) =>
      _$$_TourDetailJsonFromJson(json);

  @override
  final int? id;
  @override
  final int? tourGuideId;
  @override
  final String? destination;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? price;
  @override
  final double? saleOff;
  @override
  final int? rating;
  @override
  final int? reviews;
  @override
  final int? likes;
  @override
  final bool? isFavorite;
  @override
  final TourProviderJson? provider;
  @override
  final String? duration;
  @override
  final String? description;
  @override
  final String? departureDate;
  @override
  final String? departurePlace;
  final List<ScheduleJson>? _schedule;
  @override
  List<ScheduleJson>? get schedule {
    final value = _schedule;
    if (value == null) return null;
    if (_schedule is EqualUnmodifiableListView) return _schedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, String>? _prices;
  @override
  Map<String, String>? get prices {
    final value = _prices;
    if (value == null) return null;
    if (_prices is EqualUnmodifiableMapView) return _prices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TourDetailJson(id: $id, tourGuideId: $tourGuideId, destination: $destination, images: $images, price: $price, saleOff: $saleOff, rating: $rating, reviews: $reviews, likes: $likes, isFavorite: $isFavorite, provider: $provider, duration: $duration, description: $description, departureDate: $departureDate, departurePlace: $departurePlace, schedule: $schedule, prices: $prices)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TourDetailJson'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('tourGuideId', tourGuideId))
      ..add(DiagnosticsProperty('destination', destination))
      ..add(DiagnosticsProperty('images', images))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('saleOff', saleOff))
      ..add(DiagnosticsProperty('rating', rating))
      ..add(DiagnosticsProperty('reviews', reviews))
      ..add(DiagnosticsProperty('likes', likes))
      ..add(DiagnosticsProperty('isFavorite', isFavorite))
      ..add(DiagnosticsProperty('provider', provider))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('departureDate', departureDate))
      ..add(DiagnosticsProperty('departurePlace', departurePlace))
      ..add(DiagnosticsProperty('schedule', schedule))
      ..add(DiagnosticsProperty('prices', prices));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TourDetailJson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tourGuideId, tourGuideId) ||
                other.tourGuideId == tourGuideId) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.saleOff, saleOff) || other.saleOff == saleOff) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviews, reviews) || other.reviews == reviews) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.departureDate, departureDate) ||
                other.departureDate == departureDate) &&
            (identical(other.departurePlace, departurePlace) ||
                other.departurePlace == departurePlace) &&
            const DeepCollectionEquality().equals(other._schedule, _schedule) &&
            const DeepCollectionEquality().equals(other._prices, _prices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      tourGuideId,
      destination,
      const DeepCollectionEquality().hash(_images),
      price,
      saleOff,
      rating,
      reviews,
      likes,
      isFavorite,
      provider,
      duration,
      description,
      departureDate,
      departurePlace,
      const DeepCollectionEquality().hash(_schedule),
      const DeepCollectionEquality().hash(_prices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TourDetailJsonCopyWith<_$_TourDetailJson> get copyWith =>
      __$$_TourDetailJsonCopyWithImpl<_$_TourDetailJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TourDetailJsonToJson(
      this,
    );
  }
}

abstract class _TourDetailJson implements TourDetailJson {
  const factory _TourDetailJson(
      {final int? id,
      final int? tourGuideId,
      final String? destination,
      final List<String>? images,
      final double? price,
      final double? saleOff,
      final int? rating,
      final int? reviews,
      final int? likes,
      final bool? isFavorite,
      final TourProviderJson? provider,
      final String? duration,
      final String? description,
      final String? departureDate,
      final String? departurePlace,
      final List<ScheduleJson>? schedule,
      final Map<String, String>? prices}) = _$_TourDetailJson;

  factory _TourDetailJson.fromJson(Map<String, dynamic> json) =
      _$_TourDetailJson.fromJson;

  @override
  int? get id;
  @override
  int? get tourGuideId;
  @override
  String? get destination;
  @override
  List<String>? get images;
  @override
  double? get price;
  @override
  double? get saleOff;
  @override
  int? get rating;
  @override
  int? get reviews;
  @override
  int? get likes;
  @override
  bool? get isFavorite;
  @override
  TourProviderJson? get provider;
  @override
  String? get duration;
  @override
  String? get description;
  @override
  String? get departureDate;
  @override
  String? get departurePlace;
  @override
  List<ScheduleJson>? get schedule;
  @override
  Map<String, String>? get prices;
  @override
  @JsonKey(ignore: true)
  _$$_TourDetailJsonCopyWith<_$_TourDetailJson> get copyWith =>
      throw _privateConstructorUsedError;
}
