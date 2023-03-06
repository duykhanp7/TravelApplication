// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_from_to.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimeFromTo _$TimeFromToFromJson(Map<String, dynamic> json) {
  return _TimeFromTo.fromJson(json);
}

/// @nodoc
mixin _$TimeFromTo {
  String? get timeFrom => throw _privateConstructorUsedError;
  String? get timeTo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeFromToCopyWith<TimeFromTo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeFromToCopyWith<$Res> {
  factory $TimeFromToCopyWith(
          TimeFromTo value, $Res Function(TimeFromTo) then) =
      _$TimeFromToCopyWithImpl<$Res, TimeFromTo>;
  @useResult
  $Res call({String? timeFrom, String? timeTo});
}

/// @nodoc
class _$TimeFromToCopyWithImpl<$Res, $Val extends TimeFromTo>
    implements $TimeFromToCopyWith<$Res> {
  _$TimeFromToCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeFrom = freezed,
    Object? timeTo = freezed,
  }) {
    return _then(_value.copyWith(
      timeFrom: freezed == timeFrom
          ? _value.timeFrom
          : timeFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      timeTo: freezed == timeTo
          ? _value.timeTo
          : timeTo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimeFromToCopyWith<$Res>
    implements $TimeFromToCopyWith<$Res> {
  factory _$$_TimeFromToCopyWith(
          _$_TimeFromTo value, $Res Function(_$_TimeFromTo) then) =
      __$$_TimeFromToCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? timeFrom, String? timeTo});
}

/// @nodoc
class __$$_TimeFromToCopyWithImpl<$Res>
    extends _$TimeFromToCopyWithImpl<$Res, _$_TimeFromTo>
    implements _$$_TimeFromToCopyWith<$Res> {
  __$$_TimeFromToCopyWithImpl(
      _$_TimeFromTo _value, $Res Function(_$_TimeFromTo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeFrom = freezed,
    Object? timeTo = freezed,
  }) {
    return _then(_$_TimeFromTo(
      timeFrom: freezed == timeFrom
          ? _value.timeFrom
          : timeFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      timeTo: freezed == timeTo
          ? _value.timeTo
          : timeTo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimeFromTo with DiagnosticableTreeMixin implements _TimeFromTo {
  const _$_TimeFromTo({this.timeFrom, this.timeTo});

  factory _$_TimeFromTo.fromJson(Map<String, dynamic> json) =>
      _$$_TimeFromToFromJson(json);

  @override
  final String? timeFrom;
  @override
  final String? timeTo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimeFromTo(timeFrom: $timeFrom, timeTo: $timeTo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimeFromTo'))
      ..add(DiagnosticsProperty('timeFrom', timeFrom))
      ..add(DiagnosticsProperty('timeTo', timeTo));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimeFromTo &&
            (identical(other.timeFrom, timeFrom) ||
                other.timeFrom == timeFrom) &&
            (identical(other.timeTo, timeTo) || other.timeTo == timeTo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, timeFrom, timeTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimeFromToCopyWith<_$_TimeFromTo> get copyWith =>
      __$$_TimeFromToCopyWithImpl<_$_TimeFromTo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeFromToToJson(
      this,
    );
  }
}

abstract class _TimeFromTo implements TimeFromTo {
  const factory _TimeFromTo({final String? timeFrom, final String? timeTo}) =
      _$_TimeFromTo;

  factory _TimeFromTo.fromJson(Map<String, dynamic> json) =
      _$_TimeFromTo.fromJson;

  @override
  String? get timeFrom;
  @override
  String? get timeTo;
  @override
  @JsonKey(ignore: true)
  _$$_TimeFromToCopyWith<_$_TimeFromTo> get copyWith =>
      throw _privateConstructorUsedError;
}
