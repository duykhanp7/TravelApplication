// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_experiences_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserExperienceJson _$UserExperienceJsonFromJson(Map<String, dynamic> json) {
  return _UserExperienceJson.fromJson(json);
}

/// @nodoc
mixin _$UserExperienceJson {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  List<String>? get multi => throw _privateConstructorUsedError;
  String? get guideName => throw _privateConstructorUsedError;
  String? get guideUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserExperienceJsonCopyWith<UserExperienceJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserExperienceJsonCopyWith<$Res> {
  factory $UserExperienceJsonCopyWith(
          UserExperienceJson value, $Res Function(UserExperienceJson) then) =
      _$UserExperienceJsonCopyWithImpl<$Res, UserExperienceJson>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? location,
      List<String>? multi,
      String? guideName,
      String? guideUrl});
}

/// @nodoc
class _$UserExperienceJsonCopyWithImpl<$Res, $Val extends UserExperienceJson>
    implements $UserExperienceJsonCopyWith<$Res> {
  _$UserExperienceJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? location = freezed,
    Object? multi = freezed,
    Object? guideName = freezed,
    Object? guideUrl = freezed,
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
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      multi: freezed == multi
          ? _value.multi
          : multi // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      guideName: freezed == guideName
          ? _value.guideName
          : guideName // ignore: cast_nullable_to_non_nullable
              as String?,
      guideUrl: freezed == guideUrl
          ? _value.guideUrl
          : guideUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserExperienceJsonCopyWith<$Res>
    implements $UserExperienceJsonCopyWith<$Res> {
  factory _$$_UserExperienceJsonCopyWith(_$_UserExperienceJson value,
          $Res Function(_$_UserExperienceJson) then) =
      __$$_UserExperienceJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? location,
      List<String>? multi,
      String? guideName,
      String? guideUrl});
}

/// @nodoc
class __$$_UserExperienceJsonCopyWithImpl<$Res>
    extends _$UserExperienceJsonCopyWithImpl<$Res, _$_UserExperienceJson>
    implements _$$_UserExperienceJsonCopyWith<$Res> {
  __$$_UserExperienceJsonCopyWithImpl(
      _$_UserExperienceJson _value, $Res Function(_$_UserExperienceJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? location = freezed,
    Object? multi = freezed,
    Object? guideName = freezed,
    Object? guideUrl = freezed,
  }) {
    return _then(_$_UserExperienceJson(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      multi: freezed == multi
          ? _value._multi
          : multi // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      guideName: freezed == guideName
          ? _value.guideName
          : guideName // ignore: cast_nullable_to_non_nullable
              as String?,
      guideUrl: freezed == guideUrl
          ? _value.guideUrl
          : guideUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserExperienceJson implements _UserExperienceJson {
  const _$_UserExperienceJson(
      {this.id,
      this.name,
      this.location,
      final List<String>? multi,
      this.guideName,
      this.guideUrl})
      : _multi = multi;

  factory _$_UserExperienceJson.fromJson(Map<String, dynamic> json) =>
      _$$_UserExperienceJsonFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? location;
  final List<String>? _multi;
  @override
  List<String>? get multi {
    final value = _multi;
    if (value == null) return null;
    if (_multi is EqualUnmodifiableListView) return _multi;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? guideName;
  @override
  final String? guideUrl;

  @override
  String toString() {
    return 'UserExperienceJson(id: $id, name: $name, location: $location, multi: $multi, guideName: $guideName, guideUrl: $guideUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserExperienceJson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._multi, _multi) &&
            (identical(other.guideName, guideName) ||
                other.guideName == guideName) &&
            (identical(other.guideUrl, guideUrl) ||
                other.guideUrl == guideUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, location,
      const DeepCollectionEquality().hash(_multi), guideName, guideUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserExperienceJsonCopyWith<_$_UserExperienceJson> get copyWith =>
      __$$_UserExperienceJsonCopyWithImpl<_$_UserExperienceJson>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserExperienceJsonToJson(
      this,
    );
  }
}

abstract class _UserExperienceJson implements UserExperienceJson {
  const factory _UserExperienceJson(
      {final int? id,
      final String? name,
      final String? location,
      final List<String>? multi,
      final String? guideName,
      final String? guideUrl}) = _$_UserExperienceJson;

  factory _UserExperienceJson.fromJson(Map<String, dynamic> json) =
      _$_UserExperienceJson.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get location;
  @override
  List<String>? get multi;
  @override
  String? get guideName;
  @override
  String? get guideUrl;
  @override
  @JsonKey(ignore: true)
  _$$_UserExperienceJsonCopyWith<_$_UserExperienceJson> get copyWith =>
      throw _privateConstructorUsedError;
}
