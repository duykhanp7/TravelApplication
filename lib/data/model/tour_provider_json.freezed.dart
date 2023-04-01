// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_provider_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TourProviderJson _$TourProviderJsonFromJson(Map<String, dynamic> json) {
  return _TourProviderJson.fromJson(json);
}

/// @nodoc
mixin _$TourProviderJson {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TourProviderJsonCopyWith<TourProviderJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourProviderJsonCopyWith<$Res> {
  factory $TourProviderJsonCopyWith(
          TourProviderJson value, $Res Function(TourProviderJson) then) =
      _$TourProviderJsonCopyWithImpl<$Res, TourProviderJson>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$TourProviderJsonCopyWithImpl<$Res, $Val extends TourProviderJson>
    implements $TourProviderJsonCopyWith<$Res> {
  _$TourProviderJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TourProviderJsonCopyWith<$Res>
    implements $TourProviderJsonCopyWith<$Res> {
  factory _$$_TourProviderJsonCopyWith(
          _$_TourProviderJson value, $Res Function(_$_TourProviderJson) then) =
      __$$_TourProviderJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$_TourProviderJsonCopyWithImpl<$Res>
    extends _$TourProviderJsonCopyWithImpl<$Res, _$_TourProviderJson>
    implements _$$_TourProviderJsonCopyWith<$Res> {
  __$$_TourProviderJsonCopyWithImpl(
      _$_TourProviderJson _value, $Res Function(_$_TourProviderJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_TourProviderJson(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TourProviderJson
    with DiagnosticableTreeMixin
    implements _TourProviderJson {
  const _$_TourProviderJson({this.id, this.name});

  factory _$_TourProviderJson.fromJson(Map<String, dynamic> json) =>
      _$$_TourProviderJsonFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TourProviderJson(id: $id, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TourProviderJson'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TourProviderJson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TourProviderJsonCopyWith<_$_TourProviderJson> get copyWith =>
      __$$_TourProviderJsonCopyWithImpl<_$_TourProviderJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TourProviderJsonToJson(
      this,
    );
  }
}

abstract class _TourProviderJson implements TourProviderJson {
  const factory _TourProviderJson({final int? id, final String? name}) =
      _$_TourProviderJson;

  factory _TourProviderJson.fromJson(Map<String, dynamic> json) =
      _$_TourProviderJson.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_TourProviderJsonCopyWith<_$_TourProviderJson> get copyWith =>
      throw _privateConstructorUsedError;
}
