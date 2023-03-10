// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_point_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SchedulePointJson _$SchedulePointJsonFromJson(Map<String, dynamic> json) {
  return _SchedulePointJson.fromJson(json);
}

/// @nodoc
mixin _$SchedulePointJson {
  int? get id => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SchedulePointJsonCopyWith<SchedulePointJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchedulePointJsonCopyWith<$Res> {
  factory $SchedulePointJsonCopyWith(
          SchedulePointJson value, $Res Function(SchedulePointJson) then) =
      _$SchedulePointJsonCopyWithImpl<$Res, SchedulePointJson>;
  @useResult
  $Res call({int? id, String? time, String? description});
}

/// @nodoc
class _$SchedulePointJsonCopyWithImpl<$Res, $Val extends SchedulePointJson>
    implements $SchedulePointJsonCopyWith<$Res> {
  _$SchedulePointJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? time = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SchedulePointJsonCopyWith<$Res>
    implements $SchedulePointJsonCopyWith<$Res> {
  factory _$$_SchedulePointJsonCopyWith(_$_SchedulePointJson value,
          $Res Function(_$_SchedulePointJson) then) =
      __$$_SchedulePointJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? time, String? description});
}

/// @nodoc
class __$$_SchedulePointJsonCopyWithImpl<$Res>
    extends _$SchedulePointJsonCopyWithImpl<$Res, _$_SchedulePointJson>
    implements _$$_SchedulePointJsonCopyWith<$Res> {
  __$$_SchedulePointJsonCopyWithImpl(
      _$_SchedulePointJson _value, $Res Function(_$_SchedulePointJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? time = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_SchedulePointJson(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SchedulePointJson
    with DiagnosticableTreeMixin
    implements _SchedulePointJson {
  const _$_SchedulePointJson({this.id, this.time, this.description});

  factory _$_SchedulePointJson.fromJson(Map<String, dynamic> json) =>
      _$$_SchedulePointJsonFromJson(json);

  @override
  final int? id;
  @override
  final String? time;
  @override
  final String? description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SchedulePointJson(id: $id, time: $time, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SchedulePointJson'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SchedulePointJson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, time, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SchedulePointJsonCopyWith<_$_SchedulePointJson> get copyWith =>
      __$$_SchedulePointJsonCopyWithImpl<_$_SchedulePointJson>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SchedulePointJsonToJson(
      this,
    );
  }
}

abstract class _SchedulePointJson implements SchedulePointJson {
  const factory _SchedulePointJson(
      {final int? id,
      final String? time,
      final String? description}) = _$_SchedulePointJson;

  factory _SchedulePointJson.fromJson(Map<String, dynamic> json) =
      _$_SchedulePointJson.fromJson;

  @override
  int? get id;
  @override
  String? get time;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_SchedulePointJsonCopyWith<_$_SchedulePointJson> get copyWith =>
      throw _privateConstructorUsedError;
}
