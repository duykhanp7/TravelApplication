// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'best_guide_preview_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BestGuideJson _$BestGuideJsonFromJson(Map<String, dynamic> json) {
  return _BestGuideJson.fromJson(json);
}

/// @nodoc
mixin _$BestGuideJson {
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  int? get ratings => throw _privateConstructorUsedError;
  int? get reviews => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BestGuideJsonCopyWith<BestGuideJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BestGuideJsonCopyWith<$Res> {
  factory $BestGuideJsonCopyWith(
          BestGuideJson value, $Res Function(BestGuideJson) then) =
      _$BestGuideJsonCopyWithImpl<$Res, BestGuideJson>;
  @useResult
  $Res call(
      {String? imageUrl,
      String? name,
      String? address,
      int? ratings,
      int? reviews});
}

/// @nodoc
class _$BestGuideJsonCopyWithImpl<$Res, $Val extends BestGuideJson>
    implements $BestGuideJsonCopyWith<$Res> {
  _$BestGuideJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? ratings = freezed,
    Object? reviews = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      ratings: freezed == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as int?,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BestGuideJsonCopyWith<$Res>
    implements $BestGuideJsonCopyWith<$Res> {
  factory _$$_BestGuideJsonCopyWith(
          _$_BestGuideJson value, $Res Function(_$_BestGuideJson) then) =
      __$$_BestGuideJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? imageUrl,
      String? name,
      String? address,
      int? ratings,
      int? reviews});
}

/// @nodoc
class __$$_BestGuideJsonCopyWithImpl<$Res>
    extends _$BestGuideJsonCopyWithImpl<$Res, _$_BestGuideJson>
    implements _$$_BestGuideJsonCopyWith<$Res> {
  __$$_BestGuideJsonCopyWithImpl(
      _$_BestGuideJson _value, $Res Function(_$_BestGuideJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? ratings = freezed,
    Object? reviews = freezed,
  }) {
    return _then(_$_BestGuideJson(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      ratings: freezed == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as int?,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BestGuideJson with DiagnosticableTreeMixin implements _BestGuideJson {
  const _$_BestGuideJson(
      {this.imageUrl, this.name, this.address, this.ratings, this.reviews});

  factory _$_BestGuideJson.fromJson(Map<String, dynamic> json) =>
      _$$_BestGuideJsonFromJson(json);

  @override
  final String? imageUrl;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final int? ratings;
  @override
  final int? reviews;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BestGuideJson(imageUrl: $imageUrl, name: $name, address: $address, ratings: $ratings, reviews: $reviews)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BestGuideJson'))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('ratings', ratings))
      ..add(DiagnosticsProperty('reviews', reviews));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BestGuideJson &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.ratings, ratings) || other.ratings == ratings) &&
            (identical(other.reviews, reviews) || other.reviews == reviews));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, imageUrl, name, address, ratings, reviews);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BestGuideJsonCopyWith<_$_BestGuideJson> get copyWith =>
      __$$_BestGuideJsonCopyWithImpl<_$_BestGuideJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BestGuideJsonToJson(
      this,
    );
  }
}

abstract class _BestGuideJson implements BestGuideJson {
  const factory _BestGuideJson(
      {final String? imageUrl,
      final String? name,
      final String? address,
      final int? ratings,
      final int? reviews}) = _$_BestGuideJson;

  factory _BestGuideJson.fromJson(Map<String, dynamic> json) =
      _$_BestGuideJson.fromJson;

  @override
  String? get imageUrl;
  @override
  String? get name;
  @override
  String? get address;
  @override
  int? get ratings;
  @override
  int? get reviews;
  @override
  @JsonKey(ignore: true)
  _$$_BestGuideJsonCopyWith<_$_BestGuideJson> get copyWith =>
      throw _privateConstructorUsedError;
}
