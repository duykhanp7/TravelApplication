// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LanguageJson _$LanguageJsonFromJson(Map<String, dynamic> json) {
  return _LanguageJson.fromJson(json);
}

/// @nodoc
mixin _$LanguageJson {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LanguageJsonCopyWith<LanguageJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageJsonCopyWith<$Res> {
  factory $LanguageJsonCopyWith(
          LanguageJson value, $Res Function(LanguageJson) then) =
      _$LanguageJsonCopyWithImpl<$Res, LanguageJson>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$LanguageJsonCopyWithImpl<$Res, $Val extends LanguageJson>
    implements $LanguageJsonCopyWith<$Res> {
  _$LanguageJsonCopyWithImpl(this._value, this._then);

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
abstract class _$$_LanguageJsonCopyWith<$Res>
    implements $LanguageJsonCopyWith<$Res> {
  factory _$$_LanguageJsonCopyWith(
          _$_LanguageJson value, $Res Function(_$_LanguageJson) then) =
      __$$_LanguageJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$_LanguageJsonCopyWithImpl<$Res>
    extends _$LanguageJsonCopyWithImpl<$Res, _$_LanguageJson>
    implements _$$_LanguageJsonCopyWith<$Res> {
  __$$_LanguageJsonCopyWithImpl(
      _$_LanguageJson _value, $Res Function(_$_LanguageJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_LanguageJson(
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
class _$_LanguageJson with DiagnosticableTreeMixin implements _LanguageJson {
  const _$_LanguageJson({this.id, this.name});

  factory _$_LanguageJson.fromJson(Map<String, dynamic> json) =>
      _$$_LanguageJsonFromJson(json);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LanguageJson(id: $id, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LanguageJson'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LanguageJson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LanguageJsonCopyWith<_$_LanguageJson> get copyWith =>
      __$$_LanguageJsonCopyWithImpl<_$_LanguageJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LanguageJsonToJson(
      this,
    );
  }
}

abstract class _LanguageJson implements LanguageJson {
  const factory _LanguageJson({final String? id, final String? name}) =
      _$_LanguageJson;

  factory _LanguageJson.fromJson(Map<String, dynamic> json) =
      _$_LanguageJson.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_LanguageJsonCopyWith<_$_LanguageJson> get copyWith =>
      throw _privateConstructorUsedError;
}
