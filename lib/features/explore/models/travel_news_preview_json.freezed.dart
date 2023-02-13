// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_news_preview_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TravelNewJson _$TravelNewJsonFromJson(Map<String, dynamic> json) {
  return _TravelNewJson.fromJson(json);
}

/// @nodoc
mixin _$TravelNewJson {
  String? get destinationImageUrl => throw _privateConstructorUsedError;
  String? get dateStart => throw _privateConstructorUsedError;
  String? get destinationTitle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TravelNewJsonCopyWith<TravelNewJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelNewJsonCopyWith<$Res> {
  factory $TravelNewJsonCopyWith(
          TravelNewJson value, $Res Function(TravelNewJson) then) =
      _$TravelNewJsonCopyWithImpl<$Res, TravelNewJson>;
  @useResult
  $Res call(
      {String? destinationImageUrl,
      String? dateStart,
      String? destinationTitle});
}

/// @nodoc
class _$TravelNewJsonCopyWithImpl<$Res, $Val extends TravelNewJson>
    implements $TravelNewJsonCopyWith<$Res> {
  _$TravelNewJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destinationImageUrl = freezed,
    Object? dateStart = freezed,
    Object? destinationTitle = freezed,
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
      destinationTitle: freezed == destinationTitle
          ? _value.destinationTitle
          : destinationTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TravelNewJsonCopyWith<$Res>
    implements $TravelNewJsonCopyWith<$Res> {
  factory _$$_TravelNewJsonCopyWith(
          _$_TravelNewJson value, $Res Function(_$_TravelNewJson) then) =
      __$$_TravelNewJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? destinationImageUrl,
      String? dateStart,
      String? destinationTitle});
}

/// @nodoc
class __$$_TravelNewJsonCopyWithImpl<$Res>
    extends _$TravelNewJsonCopyWithImpl<$Res, _$_TravelNewJson>
    implements _$$_TravelNewJsonCopyWith<$Res> {
  __$$_TravelNewJsonCopyWithImpl(
      _$_TravelNewJson _value, $Res Function(_$_TravelNewJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destinationImageUrl = freezed,
    Object? dateStart = freezed,
    Object? destinationTitle = freezed,
  }) {
    return _then(_$_TravelNewJson(
      destinationImageUrl: freezed == destinationImageUrl
          ? _value.destinationImageUrl
          : destinationImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationTitle: freezed == destinationTitle
          ? _value.destinationTitle
          : destinationTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TravelNewJson with DiagnosticableTreeMixin implements _TravelNewJson {
  const _$_TravelNewJson(
      {this.destinationImageUrl, this.dateStart, this.destinationTitle});

  factory _$_TravelNewJson.fromJson(Map<String, dynamic> json) =>
      _$$_TravelNewJsonFromJson(json);

  @override
  final String? destinationImageUrl;
  @override
  final String? dateStart;
  @override
  final String? destinationTitle;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TravelNewJson(destinationImageUrl: $destinationImageUrl, dateStart: $dateStart, destinationTitle: $destinationTitle)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TravelNewJson'))
      ..add(DiagnosticsProperty('destinationImageUrl', destinationImageUrl))
      ..add(DiagnosticsProperty('dateStart', dateStart))
      ..add(DiagnosticsProperty('destinationTitle', destinationTitle));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TravelNewJson &&
            (identical(other.destinationImageUrl, destinationImageUrl) ||
                other.destinationImageUrl == destinationImageUrl) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.destinationTitle, destinationTitle) ||
                other.destinationTitle == destinationTitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, destinationImageUrl, dateStart, destinationTitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TravelNewJsonCopyWith<_$_TravelNewJson> get copyWith =>
      __$$_TravelNewJsonCopyWithImpl<_$_TravelNewJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TravelNewJsonToJson(
      this,
    );
  }
}

abstract class _TravelNewJson implements TravelNewJson {
  const factory _TravelNewJson(
      {final String? destinationImageUrl,
      final String? dateStart,
      final String? destinationTitle}) = _$_TravelNewJson;

  factory _TravelNewJson.fromJson(Map<String, dynamic> json) =
      _$_TravelNewJson.fromJson;

  @override
  String? get destinationImageUrl;
  @override
  String? get dateStart;
  @override
  String? get destinationTitle;
  @override
  @JsonKey(ignore: true)
  _$$_TravelNewJsonCopyWith<_$_TravelNewJson> get copyWith =>
      throw _privateConstructorUsedError;
}
