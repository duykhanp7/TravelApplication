// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduleJson _$ScheduleJsonFromJson(Map<String, dynamic> json) {
  return _ScheduleJson.fromJson(json);
}

/// @nodoc
mixin _$ScheduleJson {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<SchedulePointJson>? get schedules => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleJsonCopyWith<ScheduleJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleJsonCopyWith<$Res> {
  factory $ScheduleJsonCopyWith(
          ScheduleJson value, $Res Function(ScheduleJson) then) =
      _$ScheduleJsonCopyWithImpl<$Res, ScheduleJson>;
  @useResult
  $Res call({int? id, String? name, List<SchedulePointJson>? schedules});
}

/// @nodoc
class _$ScheduleJsonCopyWithImpl<$Res, $Val extends ScheduleJson>
    implements $ScheduleJsonCopyWith<$Res> {
  _$ScheduleJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? schedules = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      schedules: freezed == schedules
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<SchedulePointJson>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScheduleJsonCopyWith<$Res>
    implements $ScheduleJsonCopyWith<$Res> {
  factory _$$_ScheduleJsonCopyWith(
          _$_ScheduleJson value, $Res Function(_$_ScheduleJson) then) =
      __$$_ScheduleJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, List<SchedulePointJson>? schedules});
}

/// @nodoc
class __$$_ScheduleJsonCopyWithImpl<$Res>
    extends _$ScheduleJsonCopyWithImpl<$Res, _$_ScheduleJson>
    implements _$$_ScheduleJsonCopyWith<$Res> {
  __$$_ScheduleJsonCopyWithImpl(
      _$_ScheduleJson _value, $Res Function(_$_ScheduleJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? schedules = freezed,
  }) {
    return _then(_$_ScheduleJson(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      schedules: freezed == schedules
          ? _value._schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<SchedulePointJson>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScheduleJson with DiagnosticableTreeMixin implements _ScheduleJson {
  const _$_ScheduleJson(
      {this.id, this.name, final List<SchedulePointJson>? schedules})
      : _schedules = schedules;

  factory _$_ScheduleJson.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleJsonFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  final List<SchedulePointJson>? _schedules;
  @override
  List<SchedulePointJson>? get schedules {
    final value = _schedules;
    if (value == null) return null;
    if (_schedules is EqualUnmodifiableListView) return _schedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScheduleJson(id: $id, name: $name, schedules: $schedules)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScheduleJson'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('schedules', schedules));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScheduleJson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._schedules, _schedules));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_schedules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScheduleJsonCopyWith<_$_ScheduleJson> get copyWith =>
      __$$_ScheduleJsonCopyWithImpl<_$_ScheduleJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleJsonToJson(
      this,
    );
  }
}

abstract class _ScheduleJson implements ScheduleJson {
  const factory _ScheduleJson(
      {final int? id,
      final String? name,
      final List<SchedulePointJson>? schedules}) = _$_ScheduleJson;

  factory _ScheduleJson.fromJson(Map<String, dynamic> json) =
      _$_ScheduleJson.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  List<SchedulePointJson>? get schedules;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduleJsonCopyWith<_$_ScheduleJson> get copyWith =>
      throw _privateConstructorUsedError;
}
