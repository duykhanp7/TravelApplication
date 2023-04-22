// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhotoJson _$PhotoJsonFromJson(Map<String, dynamic> json) {
  return _PhotoJson.fromJson(json);
}

/// @nodoc
mixin _$PhotoJson {
  int? get id => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get publishedAt => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get uploadUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoJsonCopyWith<PhotoJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoJsonCopyWith<$Res> {
  factory $PhotoJsonCopyWith(PhotoJson value, $Res Function(PhotoJson) then) =
      _$PhotoJsonCopyWithImpl<$Res, PhotoJson>;
  @useResult
  $Res call(
      {int? id,
      String? createdAt,
      String? updatedAt,
      String? publishedAt,
      String? token,
      String? uploadUrl});
}

/// @nodoc
class _$PhotoJsonCopyWithImpl<$Res, $Val extends PhotoJson>
    implements $PhotoJsonCopyWith<$Res> {
  _$PhotoJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? publishedAt = freezed,
    Object? token = freezed,
    Object? uploadUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadUrl: freezed == uploadUrl
          ? _value.uploadUrl
          : uploadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PhotoJsonCopyWith<$Res> implements $PhotoJsonCopyWith<$Res> {
  factory _$$_PhotoJsonCopyWith(
          _$_PhotoJson value, $Res Function(_$_PhotoJson) then) =
      __$$_PhotoJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? createdAt,
      String? updatedAt,
      String? publishedAt,
      String? token,
      String? uploadUrl});
}

/// @nodoc
class __$$_PhotoJsonCopyWithImpl<$Res>
    extends _$PhotoJsonCopyWithImpl<$Res, _$_PhotoJson>
    implements _$$_PhotoJsonCopyWith<$Res> {
  __$$_PhotoJsonCopyWithImpl(
      _$_PhotoJson _value, $Res Function(_$_PhotoJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? publishedAt = freezed,
    Object? token = freezed,
    Object? uploadUrl = freezed,
  }) {
    return _then(_$_PhotoJson(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadUrl: freezed == uploadUrl
          ? _value.uploadUrl
          : uploadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PhotoJson with DiagnosticableTreeMixin implements _PhotoJson {
  const _$_PhotoJson(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.token,
      this.uploadUrl});

  factory _$_PhotoJson.fromJson(Map<String, dynamic> json) =>
      _$$_PhotoJsonFromJson(json);

  @override
  final int? id;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final String? publishedAt;
  @override
  final String? token;
  @override
  final String? uploadUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoJson(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, token: $token, uploadUrl: $uploadUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PhotoJson'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('publishedAt', publishedAt))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('uploadUrl', uploadUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhotoJson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.uploadUrl, uploadUrl) ||
                other.uploadUrl == uploadUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, updatedAt, publishedAt, token, uploadUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhotoJsonCopyWith<_$_PhotoJson> get copyWith =>
      __$$_PhotoJsonCopyWithImpl<_$_PhotoJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhotoJsonToJson(
      this,
    );
  }
}

abstract class _PhotoJson implements PhotoJson {
  const factory _PhotoJson(
      {final int? id,
      final String? createdAt,
      final String? updatedAt,
      final String? publishedAt,
      final String? token,
      final String? uploadUrl}) = _$_PhotoJson;

  factory _PhotoJson.fromJson(Map<String, dynamic> json) =
      _$_PhotoJson.fromJson;

  @override
  int? get id;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  String? get publishedAt;
  @override
  String? get token;
  @override
  String? get uploadUrl;
  @override
  @JsonKey(ignore: true)
  _$$_PhotoJsonCopyWith<_$_PhotoJson> get copyWith =>
      throw _privateConstructorUsedError;
}
