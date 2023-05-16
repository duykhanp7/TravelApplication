// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unsplash_image_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnSplashResponeJson _$UnSplashResponeJsonFromJson(Map<String, dynamic> json) {
  return _UnSplashResponeJson.fromJson(json);
}

/// @nodoc
mixin _$UnSplashResponeJson {
  List<UnSplashResult>? get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnSplashResponeJsonCopyWith<UnSplashResponeJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnSplashResponeJsonCopyWith<$Res> {
  factory $UnSplashResponeJsonCopyWith(
          UnSplashResponeJson value, $Res Function(UnSplashResponeJson) then) =
      _$UnSplashResponeJsonCopyWithImpl<$Res, UnSplashResponeJson>;
  @useResult
  $Res call({List<UnSplashResult>? results});
}

/// @nodoc
class _$UnSplashResponeJsonCopyWithImpl<$Res, $Val extends UnSplashResponeJson>
    implements $UnSplashResponeJsonCopyWith<$Res> {
  _$UnSplashResponeJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<UnSplashResult>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UnSplashResponeJsonCopyWith<$Res>
    implements $UnSplashResponeJsonCopyWith<$Res> {
  factory _$$_UnSplashResponeJsonCopyWith(_$_UnSplashResponeJson value,
          $Res Function(_$_UnSplashResponeJson) then) =
      __$$_UnSplashResponeJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UnSplashResult>? results});
}

/// @nodoc
class __$$_UnSplashResponeJsonCopyWithImpl<$Res>
    extends _$UnSplashResponeJsonCopyWithImpl<$Res, _$_UnSplashResponeJson>
    implements _$$_UnSplashResponeJsonCopyWith<$Res> {
  __$$_UnSplashResponeJsonCopyWithImpl(_$_UnSplashResponeJson _value,
      $Res Function(_$_UnSplashResponeJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
  }) {
    return _then(_$_UnSplashResponeJson(
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<UnSplashResult>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnSplashResponeJson
    with DiagnosticableTreeMixin
    implements _UnSplashResponeJson {
  const _$_UnSplashResponeJson({final List<UnSplashResult>? results})
      : _results = results;

  factory _$_UnSplashResponeJson.fromJson(Map<String, dynamic> json) =>
      _$$_UnSplashResponeJsonFromJson(json);

  final List<UnSplashResult>? _results;
  @override
  List<UnSplashResult>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnSplashResponeJson(results: $results)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UnSplashResponeJson'))
      ..add(DiagnosticsProperty('results', results));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnSplashResponeJson &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnSplashResponeJsonCopyWith<_$_UnSplashResponeJson> get copyWith =>
      __$$_UnSplashResponeJsonCopyWithImpl<_$_UnSplashResponeJson>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnSplashResponeJsonToJson(
      this,
    );
  }
}

abstract class _UnSplashResponeJson implements UnSplashResponeJson {
  const factory _UnSplashResponeJson({final List<UnSplashResult>? results}) =
      _$_UnSplashResponeJson;

  factory _UnSplashResponeJson.fromJson(Map<String, dynamic> json) =
      _$_UnSplashResponeJson.fromJson;

  @override
  List<UnSplashResult>? get results;
  @override
  @JsonKey(ignore: true)
  _$$_UnSplashResponeJsonCopyWith<_$_UnSplashResponeJson> get copyWith =>
      throw _privateConstructorUsedError;
}

UnSplashResult _$UnSplashResultFromJson(Map<String, dynamic> json) {
  return _UnSplashResult.fromJson(json);
}

/// @nodoc
mixin _$UnSplashResult {
  UnSplashURL? get urls => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnSplashResultCopyWith<UnSplashResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnSplashResultCopyWith<$Res> {
  factory $UnSplashResultCopyWith(
          UnSplashResult value, $Res Function(UnSplashResult) then) =
      _$UnSplashResultCopyWithImpl<$Res, UnSplashResult>;
  @useResult
  $Res call({UnSplashURL? urls});

  $UnSplashURLCopyWith<$Res>? get urls;
}

/// @nodoc
class _$UnSplashResultCopyWithImpl<$Res, $Val extends UnSplashResult>
    implements $UnSplashResultCopyWith<$Res> {
  _$UnSplashResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urls = freezed,
  }) {
    return _then(_value.copyWith(
      urls: freezed == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as UnSplashURL?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UnSplashURLCopyWith<$Res>? get urls {
    if (_value.urls == null) {
      return null;
    }

    return $UnSplashURLCopyWith<$Res>(_value.urls!, (value) {
      return _then(_value.copyWith(urls: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UnSplashResultCopyWith<$Res>
    implements $UnSplashResultCopyWith<$Res> {
  factory _$$_UnSplashResultCopyWith(
          _$_UnSplashResult value, $Res Function(_$_UnSplashResult) then) =
      __$$_UnSplashResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UnSplashURL? urls});

  @override
  $UnSplashURLCopyWith<$Res>? get urls;
}

/// @nodoc
class __$$_UnSplashResultCopyWithImpl<$Res>
    extends _$UnSplashResultCopyWithImpl<$Res, _$_UnSplashResult>
    implements _$$_UnSplashResultCopyWith<$Res> {
  __$$_UnSplashResultCopyWithImpl(
      _$_UnSplashResult _value, $Res Function(_$_UnSplashResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urls = freezed,
  }) {
    return _then(_$_UnSplashResult(
      urls: freezed == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as UnSplashURL?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnSplashResult
    with DiagnosticableTreeMixin
    implements _UnSplashResult {
  const _$_UnSplashResult({this.urls});

  factory _$_UnSplashResult.fromJson(Map<String, dynamic> json) =>
      _$$_UnSplashResultFromJson(json);

  @override
  final UnSplashURL? urls;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnSplashResult(urls: $urls)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UnSplashResult'))
      ..add(DiagnosticsProperty('urls', urls));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnSplashResult &&
            (identical(other.urls, urls) || other.urls == urls));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, urls);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnSplashResultCopyWith<_$_UnSplashResult> get copyWith =>
      __$$_UnSplashResultCopyWithImpl<_$_UnSplashResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnSplashResultToJson(
      this,
    );
  }
}

abstract class _UnSplashResult implements UnSplashResult {
  const factory _UnSplashResult({final UnSplashURL? urls}) = _$_UnSplashResult;

  factory _UnSplashResult.fromJson(Map<String, dynamic> json) =
      _$_UnSplashResult.fromJson;

  @override
  UnSplashURL? get urls;
  @override
  @JsonKey(ignore: true)
  _$$_UnSplashResultCopyWith<_$_UnSplashResult> get copyWith =>
      throw _privateConstructorUsedError;
}

UnSplashURL _$UnSplashURLFromJson(Map<String, dynamic> json) {
  return _UnSplashURL.fromJson(json);
}

/// @nodoc
mixin _$UnSplashURL {
  String? get raw => throw _privateConstructorUsedError;
  String? get full => throw _privateConstructorUsedError;
  String? get regular => throw _privateConstructorUsedError;
  String? get small => throw _privateConstructorUsedError;
  String? get thumb => throw _privateConstructorUsedError;
  String? get smallS3 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnSplashURLCopyWith<UnSplashURL> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnSplashURLCopyWith<$Res> {
  factory $UnSplashURLCopyWith(
          UnSplashURL value, $Res Function(UnSplashURL) then) =
      _$UnSplashURLCopyWithImpl<$Res, UnSplashURL>;
  @useResult
  $Res call(
      {String? raw,
      String? full,
      String? regular,
      String? small,
      String? thumb,
      String? smallS3});
}

/// @nodoc
class _$UnSplashURLCopyWithImpl<$Res, $Val extends UnSplashURL>
    implements $UnSplashURLCopyWith<$Res> {
  _$UnSplashURLCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? raw = freezed,
    Object? full = freezed,
    Object? regular = freezed,
    Object? small = freezed,
    Object? thumb = freezed,
    Object? smallS3 = freezed,
  }) {
    return _then(_value.copyWith(
      raw: freezed == raw
          ? _value.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as String?,
      full: freezed == full
          ? _value.full
          : full // ignore: cast_nullable_to_non_nullable
              as String?,
      regular: freezed == regular
          ? _value.regular
          : regular // ignore: cast_nullable_to_non_nullable
              as String?,
      small: freezed == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String?,
      thumb: freezed == thumb
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as String?,
      smallS3: freezed == smallS3
          ? _value.smallS3
          : smallS3 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UnSplashURLCopyWith<$Res>
    implements $UnSplashURLCopyWith<$Res> {
  factory _$$_UnSplashURLCopyWith(
          _$_UnSplashURL value, $Res Function(_$_UnSplashURL) then) =
      __$$_UnSplashURLCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? raw,
      String? full,
      String? regular,
      String? small,
      String? thumb,
      String? smallS3});
}

/// @nodoc
class __$$_UnSplashURLCopyWithImpl<$Res>
    extends _$UnSplashURLCopyWithImpl<$Res, _$_UnSplashURL>
    implements _$$_UnSplashURLCopyWith<$Res> {
  __$$_UnSplashURLCopyWithImpl(
      _$_UnSplashURL _value, $Res Function(_$_UnSplashURL) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? raw = freezed,
    Object? full = freezed,
    Object? regular = freezed,
    Object? small = freezed,
    Object? thumb = freezed,
    Object? smallS3 = freezed,
  }) {
    return _then(_$_UnSplashURL(
      raw: freezed == raw
          ? _value.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as String?,
      full: freezed == full
          ? _value.full
          : full // ignore: cast_nullable_to_non_nullable
              as String?,
      regular: freezed == regular
          ? _value.regular
          : regular // ignore: cast_nullable_to_non_nullable
              as String?,
      small: freezed == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String?,
      thumb: freezed == thumb
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as String?,
      smallS3: freezed == smallS3
          ? _value.smallS3
          : smallS3 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnSplashURL with DiagnosticableTreeMixin implements _UnSplashURL {
  const _$_UnSplashURL(
      {this.raw,
      this.full,
      this.regular,
      this.small,
      this.thumb,
      this.smallS3});

  factory _$_UnSplashURL.fromJson(Map<String, dynamic> json) =>
      _$$_UnSplashURLFromJson(json);

  @override
  final String? raw;
  @override
  final String? full;
  @override
  final String? regular;
  @override
  final String? small;
  @override
  final String? thumb;
  @override
  final String? smallS3;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UnSplashURL(raw: $raw, full: $full, regular: $regular, small: $small, thumb: $thumb, smallS3: $smallS3)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UnSplashURL'))
      ..add(DiagnosticsProperty('raw', raw))
      ..add(DiagnosticsProperty('full', full))
      ..add(DiagnosticsProperty('regular', regular))
      ..add(DiagnosticsProperty('small', small))
      ..add(DiagnosticsProperty('thumb', thumb))
      ..add(DiagnosticsProperty('smallS3', smallS3));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnSplashURL &&
            (identical(other.raw, raw) || other.raw == raw) &&
            (identical(other.full, full) || other.full == full) &&
            (identical(other.regular, regular) || other.regular == regular) &&
            (identical(other.small, small) || other.small == small) &&
            (identical(other.thumb, thumb) || other.thumb == thumb) &&
            (identical(other.smallS3, smallS3) || other.smallS3 == smallS3));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, raw, full, regular, small, thumb, smallS3);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnSplashURLCopyWith<_$_UnSplashURL> get copyWith =>
      __$$_UnSplashURLCopyWithImpl<_$_UnSplashURL>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnSplashURLToJson(
      this,
    );
  }
}

abstract class _UnSplashURL implements UnSplashURL {
  const factory _UnSplashURL(
      {final String? raw,
      final String? full,
      final String? regular,
      final String? small,
      final String? thumb,
      final String? smallS3}) = _$_UnSplashURL;

  factory _UnSplashURL.fromJson(Map<String, dynamic> json) =
      _$_UnSplashURL.fromJson;

  @override
  String? get raw;
  @override
  String? get full;
  @override
  String? get regular;
  @override
  String? get small;
  @override
  String? get thumb;
  @override
  String? get smallS3;
  @override
  @JsonKey(ignore: true)
  _$$_UnSplashURLCopyWith<_$_UnSplashURL> get copyWith =>
      throw _privateConstructorUsedError;
}
