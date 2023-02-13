// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_journey_preview_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TopJourneyJson _$TopJourneyJsonFromJson(Map<String, dynamic> json) {
  return _TopJourneyJson.fromJson(json);
}

/// @nodoc
mixin _$TopJourneyJson {
  String? get destinationTitle => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get dateStart => throw _privateConstructorUsedError;
  int? get quantities => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get ratings => throw _privateConstructorUsedError;
  int? get likes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopJourneyJsonCopyWith<TopJourneyJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopJourneyJsonCopyWith<$Res> {
  factory $TopJourneyJsonCopyWith(
          TopJourneyJson value, $Res Function(TopJourneyJson) then) =
      _$TopJourneyJsonCopyWithImpl<$Res, TopJourneyJson>;
  @useResult
  $Res call(
      {String? destinationTitle,
      String? imageUrl,
      String? dateStart,
      int? quantities,
      double? price,
      int? ratings,
      int? likes});
}

/// @nodoc
class _$TopJourneyJsonCopyWithImpl<$Res, $Val extends TopJourneyJson>
    implements $TopJourneyJsonCopyWith<$Res> {
  _$TopJourneyJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destinationTitle = freezed,
    Object? imageUrl = freezed,
    Object? dateStart = freezed,
    Object? quantities = freezed,
    Object? price = freezed,
    Object? ratings = freezed,
    Object? likes = freezed,
  }) {
    return _then(_value.copyWith(
      destinationTitle: freezed == destinationTitle
          ? _value.destinationTitle
          : destinationTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as String?,
      quantities: freezed == quantities
          ? _value.quantities
          : quantities // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      ratings: freezed == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as int?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TopJourneyJsonCopyWith<$Res>
    implements $TopJourneyJsonCopyWith<$Res> {
  factory _$$_TopJourneyJsonCopyWith(
          _$_TopJourneyJson value, $Res Function(_$_TopJourneyJson) then) =
      __$$_TopJourneyJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? destinationTitle,
      String? imageUrl,
      String? dateStart,
      int? quantities,
      double? price,
      int? ratings,
      int? likes});
}

/// @nodoc
class __$$_TopJourneyJsonCopyWithImpl<$Res>
    extends _$TopJourneyJsonCopyWithImpl<$Res, _$_TopJourneyJson>
    implements _$$_TopJourneyJsonCopyWith<$Res> {
  __$$_TopJourneyJsonCopyWithImpl(
      _$_TopJourneyJson _value, $Res Function(_$_TopJourneyJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destinationTitle = freezed,
    Object? imageUrl = freezed,
    Object? dateStart = freezed,
    Object? quantities = freezed,
    Object? price = freezed,
    Object? ratings = freezed,
    Object? likes = freezed,
  }) {
    return _then(_$_TopJourneyJson(
      destinationTitle: freezed == destinationTitle
          ? _value.destinationTitle
          : destinationTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as String?,
      quantities: freezed == quantities
          ? _value.quantities
          : quantities // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      ratings: freezed == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as int?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TopJourneyJson
    with DiagnosticableTreeMixin
    implements _TopJourneyJson {
  const _$_TopJourneyJson(
      {this.destinationTitle,
      this.imageUrl,
      this.dateStart,
      this.quantities,
      this.price,
      this.ratings,
      this.likes});

  factory _$_TopJourneyJson.fromJson(Map<String, dynamic> json) =>
      _$$_TopJourneyJsonFromJson(json);

  @override
  final String? destinationTitle;
  @override
  final String? imageUrl;
  @override
  final String? dateStart;
  @override
  final int? quantities;
  @override
  final double? price;
  @override
  final int? ratings;
  @override
  final int? likes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TopJourneyJson(destinationTitle: $destinationTitle, imageUrl: $imageUrl, dateStart: $dateStart, quantities: $quantities, price: $price, ratings: $ratings, likes: $likes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TopJourneyJson'))
      ..add(DiagnosticsProperty('destinationTitle', destinationTitle))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('dateStart', dateStart))
      ..add(DiagnosticsProperty('quantities', quantities))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('ratings', ratings))
      ..add(DiagnosticsProperty('likes', likes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopJourneyJson &&
            (identical(other.destinationTitle, destinationTitle) ||
                other.destinationTitle == destinationTitle) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.quantities, quantities) ||
                other.quantities == quantities) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.ratings, ratings) || other.ratings == ratings) &&
            (identical(other.likes, likes) || other.likes == likes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, destinationTitle, imageUrl,
      dateStart, quantities, price, ratings, likes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TopJourneyJsonCopyWith<_$_TopJourneyJson> get copyWith =>
      __$$_TopJourneyJsonCopyWithImpl<_$_TopJourneyJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TopJourneyJsonToJson(
      this,
    );
  }
}

abstract class _TopJourneyJson implements TopJourneyJson {
  const factory _TopJourneyJson(
      {final String? destinationTitle,
      final String? imageUrl,
      final String? dateStart,
      final int? quantities,
      final double? price,
      final int? ratings,
      final int? likes}) = _$_TopJourneyJson;

  factory _TopJourneyJson.fromJson(Map<String, dynamic> json) =
      _$_TopJourneyJson.fromJson;

  @override
  String? get destinationTitle;
  @override
  String? get imageUrl;
  @override
  String? get dateStart;
  @override
  int? get quantities;
  @override
  double? get price;
  @override
  int? get ratings;
  @override
  int? get likes;
  @override
  @JsonKey(ignore: true)
  _$$_TopJourneyJsonCopyWith<_$_TopJourneyJson> get copyWith =>
      throw _privateConstructorUsedError;
}
