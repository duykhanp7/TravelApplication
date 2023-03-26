// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_filter_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TypeFilterJson _$TypeFilterJsonFromJson(Map<String, dynamic> json) {
  return _TypeFilterJson.fromJson(json);
}

/// @nodoc
mixin _$TypeFilterJson {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypeFilterJsonCopyWith<TypeFilterJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeFilterJsonCopyWith<$Res> {
  factory $TypeFilterJsonCopyWith(
          TypeFilterJson value, $Res Function(TypeFilterJson) then) =
      _$TypeFilterJsonCopyWithImpl<$Res, TypeFilterJson>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$TypeFilterJsonCopyWithImpl<$Res, $Val extends TypeFilterJson>
    implements $TypeFilterJsonCopyWith<$Res> {
  _$TypeFilterJsonCopyWithImpl(this._value, this._then);

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
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TypeFilterJsonCopyWith<$Res>
    implements $TypeFilterJsonCopyWith<$Res> {
  factory _$$_TypeFilterJsonCopyWith(
          _$_TypeFilterJson value, $Res Function(_$_TypeFilterJson) then) =
      __$$_TypeFilterJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$_TypeFilterJsonCopyWithImpl<$Res>
    extends _$TypeFilterJsonCopyWithImpl<$Res, _$_TypeFilterJson>
    implements _$$_TypeFilterJsonCopyWith<$Res> {
  __$$_TypeFilterJsonCopyWithImpl(
      _$_TypeFilterJson _value, $Res Function(_$_TypeFilterJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_TypeFilterJson(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TypeFilterJson
    with DiagnosticableTreeMixin
    implements _TypeFilterJson {
  const _$_TypeFilterJson({this.id, this.name});

  factory _$_TypeFilterJson.fromJson(Map<String, dynamic> json) =>
      _$$_TypeFilterJsonFromJson(json);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TypeFilterJson(id: $id, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TypeFilterJson'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TypeFilterJson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TypeFilterJsonCopyWith<_$_TypeFilterJson> get copyWith =>
      __$$_TypeFilterJsonCopyWithImpl<_$_TypeFilterJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TypeFilterJsonToJson(
      this,
    );
  }
}

abstract class _TypeFilterJson implements TypeFilterJson {
  const factory _TypeFilterJson({final String? id, final String? name}) =
      _$_TypeFilterJson;

  factory _TypeFilterJson.fromJson(Map<String, dynamic> json) =
      _$_TypeFilterJson.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_TypeFilterJsonCopyWith<_$_TypeFilterJson> get copyWith =>
      throw _privateConstructorUsedError;
}
