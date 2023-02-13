// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_tour_preview_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeatureTourJson _$FeatureTourJsonFromJson(Map<String, dynamic> json) {
  return _FeatureTourJson.fromJson(json);
}

/// @nodoc
mixin _$FeatureTourJson {
  String? get destinationImageUrl => throw _privateConstructorUsedError;
  String? get dateStart => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  int? get ratings => throw _privateConstructorUsedError;
  int? get likes => throw _privateConstructorUsedError;
  int? get quantities => throw _privateConstructorUsedError;
  double? get prices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeatureTourJsonCopyWith<FeatureTourJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureTourJsonCopyWith<$Res> {
  factory $FeatureTourJsonCopyWith(
          FeatureTourJson value, $Res Function(FeatureTourJson) then) =
      _$FeatureTourJsonCopyWithImpl<$Res, FeatureTourJson>;
  @useResult
  $Res call(
      {String? destinationImageUrl,
      String? dateStart,
      String? address,
      int? ratings,
      int? likes,
      int? quantities,
      double? prices});
}

/// @nodoc
class _$FeatureTourJsonCopyWithImpl<$Res, $Val extends FeatureTourJson>
    implements $FeatureTourJsonCopyWith<$Res> {
  _$FeatureTourJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destinationImageUrl = freezed,
    Object? dateStart = freezed,
    Object? address = freezed,
    Object? ratings = freezed,
    Object? likes = freezed,
    Object? quantities = freezed,
    Object? prices = freezed,
  }) {
    return _then(_value.copyWith(
      destinationImageUrl: freezed == destinationImageUrl
          ? _value.destinationImageUrl
          : destinationImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      ratings: freezed == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as int?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      quantities: freezed == quantities
          ? _value.quantities
          : quantities // ignore: cast_nullable_to_non_nullable
              as int?,
      prices: freezed == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FeatureTourJsonCopyWith<$Res>
    implements $FeatureTourJsonCopyWith<$Res> {
  factory _$$_FeatureTourJsonCopyWith(
          _$_FeatureTourJson value, $Res Function(_$_FeatureTourJson) then) =
      __$$_FeatureTourJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? destinationImageUrl,
      String? dateStart,
      String? address,
      int? ratings,
      int? likes,
      int? quantities,
      double? prices});
}

/// @nodoc
class __$$_FeatureTourJsonCopyWithImpl<$Res>
    extends _$FeatureTourJsonCopyWithImpl<$Res, _$_FeatureTourJson>
    implements _$$_FeatureTourJsonCopyWith<$Res> {
  __$$_FeatureTourJsonCopyWithImpl(
      _$_FeatureTourJson _value, $Res Function(_$_FeatureTourJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destinationImageUrl = freezed,
    Object? dateStart = freezed,
    Object? address = freezed,
    Object? ratings = freezed,
    Object? likes = freezed,
    Object? quantities = freezed,
    Object? prices = freezed,
  }) {
    return _then(_$_FeatureTourJson(
      destinationImageUrl: freezed == destinationImageUrl
          ? _value.destinationImageUrl
          : destinationImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      ratings: freezed == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as int?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      quantities: freezed == quantities
          ? _value.quantities
          : quantities // ignore: cast_nullable_to_non_nullable
              as int?,
      prices: freezed == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FeatureTourJson
    with DiagnosticableTreeMixin
    implements _FeatureTourJson {
  const _$_FeatureTourJson(
      {this.destinationImageUrl,
      this.dateStart,
      this.address,
      this.ratings,
      this.likes,
      this.quantities,
      this.prices});

  factory _$_FeatureTourJson.fromJson(Map<String, dynamic> json) =>
      _$$_FeatureTourJsonFromJson(json);

  @override
  final String? destinationImageUrl;
  @override
  final String? dateStart;
  @override
  final String? address;
  @override
  final int? ratings;
  @override
  final int? likes;
  @override
  final int? quantities;
  @override
  final double? prices;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeatureTourJson(destinationImageUrl: $destinationImageUrl, dateStart: $dateStart, address: $address, ratings: $ratings, likes: $likes, quantities: $quantities, prices: $prices)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FeatureTourJson'))
      ..add(DiagnosticsProperty('destinationImageUrl', destinationImageUrl))
      ..add(DiagnosticsProperty('dateStart', dateStart))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('ratings', ratings))
      ..add(DiagnosticsProperty('likes', likes))
      ..add(DiagnosticsProperty('quantities', quantities))
      ..add(DiagnosticsProperty('prices', prices));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeatureTourJson &&
            (identical(other.destinationImageUrl, destinationImageUrl) ||
                other.destinationImageUrl == destinationImageUrl) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.ratings, ratings) || other.ratings == ratings) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.quantities, quantities) ||
                other.quantities == quantities) &&
            (identical(other.prices, prices) || other.prices == prices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, destinationImageUrl, dateStart,
      address, ratings, likes, quantities, prices);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeatureTourJsonCopyWith<_$_FeatureTourJson> get copyWith =>
      __$$_FeatureTourJsonCopyWithImpl<_$_FeatureTourJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeatureTourJsonToJson(
      this,
    );
  }
}

abstract class _FeatureTourJson implements FeatureTourJson {
  const factory _FeatureTourJson(
      {final String? destinationImageUrl,
      final String? dateStart,
      final String? address,
      final int? ratings,
      final int? likes,
      final int? quantities,
      final double? prices}) = _$_FeatureTourJson;

  factory _FeatureTourJson.fromJson(Map<String, dynamic> json) =
      _$_FeatureTourJson.fromJson;

  @override
  String? get destinationImageUrl;
  @override
  String? get dateStart;
  @override
  String? get address;
  @override
  int? get ratings;
  @override
  int? get likes;
  @override
  int? get quantities;
  @override
  double? get prices;
  @override
  @JsonKey(ignore: true)
  _$$_FeatureTourJsonCopyWith<_$_FeatureTourJson> get copyWith =>
      throw _privateConstructorUsedError;
}
