// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInfoJson _$UserInfoJsonFromJson(Map<String, dynamic> json) {
  return _UserInfoJson.fromJson(json);
}

/// @nodoc
mixin _$UserInfoJson {
  int? get id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  PhotoJson? get avatar => throw _privateConstructorUsedError;
  PhotoJson? get cover => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get provider => throw _privateConstructorUsedError;
  bool? get confirmed => throw _privateConstructorUsedError;
  bool? get blocked => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  @ConvertStringToUserType()
  UserType? get type => throw _privateConstructorUsedError;
  List<PhotoJson>? get images => throw _privateConstructorUsedError;
  List<MyExperienceJson>? get journeys => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoJsonCopyWith<UserInfoJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoJsonCopyWith<$Res> {
  factory $UserInfoJsonCopyWith(
          UserInfoJson value, $Res Function(UserInfoJson) then) =
      _$UserInfoJsonCopyWithImpl<$Res, UserInfoJson>;
  @useResult
  $Res call(
      {int? id,
      String? username,
      String? firstName,
      String? lastName,
      PhotoJson? avatar,
      PhotoJson? cover,
      String? email,
      String? provider,
      bool? confirmed,
      bool? blocked,
      String? createdAt,
      String? updatedAt,
      @ConvertStringToUserType() UserType? type,
      List<PhotoJson>? images,
      List<MyExperienceJson>? journeys});

  $PhotoJsonCopyWith<$Res>? get avatar;
  $PhotoJsonCopyWith<$Res>? get cover;
}

/// @nodoc
class _$UserInfoJsonCopyWithImpl<$Res, $Val extends UserInfoJson>
    implements $UserInfoJsonCopyWith<$Res> {
  _$UserInfoJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? avatar = freezed,
    Object? cover = freezed,
    Object? email = freezed,
    Object? provider = freezed,
    Object? confirmed = freezed,
    Object? blocked = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? type = freezed,
    Object? images = freezed,
    Object? journeys = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as PhotoJson?,
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as PhotoJson?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmed: freezed == confirmed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
      blocked: freezed == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UserType?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<PhotoJson>?,
      journeys: freezed == journeys
          ? _value.journeys
          : journeys // ignore: cast_nullable_to_non_nullable
              as List<MyExperienceJson>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PhotoJsonCopyWith<$Res>? get avatar {
    if (_value.avatar == null) {
      return null;
    }

    return $PhotoJsonCopyWith<$Res>(_value.avatar!, (value) {
      return _then(_value.copyWith(avatar: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PhotoJsonCopyWith<$Res>? get cover {
    if (_value.cover == null) {
      return null;
    }

    return $PhotoJsonCopyWith<$Res>(_value.cover!, (value) {
      return _then(_value.copyWith(cover: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserInfoJsonCopyWith<$Res>
    implements $UserInfoJsonCopyWith<$Res> {
  factory _$$_UserInfoJsonCopyWith(
          _$_UserInfoJson value, $Res Function(_$_UserInfoJson) then) =
      __$$_UserInfoJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? username,
      String? firstName,
      String? lastName,
      PhotoJson? avatar,
      PhotoJson? cover,
      String? email,
      String? provider,
      bool? confirmed,
      bool? blocked,
      String? createdAt,
      String? updatedAt,
      @ConvertStringToUserType() UserType? type,
      List<PhotoJson>? images,
      List<MyExperienceJson>? journeys});

  @override
  $PhotoJsonCopyWith<$Res>? get avatar;
  @override
  $PhotoJsonCopyWith<$Res>? get cover;
}

/// @nodoc
class __$$_UserInfoJsonCopyWithImpl<$Res>
    extends _$UserInfoJsonCopyWithImpl<$Res, _$_UserInfoJson>
    implements _$$_UserInfoJsonCopyWith<$Res> {
  __$$_UserInfoJsonCopyWithImpl(
      _$_UserInfoJson _value, $Res Function(_$_UserInfoJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? avatar = freezed,
    Object? cover = freezed,
    Object? email = freezed,
    Object? provider = freezed,
    Object? confirmed = freezed,
    Object? blocked = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? type = freezed,
    Object? images = freezed,
    Object? journeys = freezed,
  }) {
    return _then(_$_UserInfoJson(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as PhotoJson?,
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as PhotoJson?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmed: freezed == confirmed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
      blocked: freezed == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UserType?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<PhotoJson>?,
      journeys: freezed == journeys
          ? _value._journeys
          : journeys // ignore: cast_nullable_to_non_nullable
              as List<MyExperienceJson>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserInfoJson extends _UserInfoJson with DiagnosticableTreeMixin {
  const _$_UserInfoJson(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.avatar,
      this.cover,
      this.email,
      this.provider,
      this.confirmed,
      this.blocked,
      this.createdAt,
      this.updatedAt,
      @ConvertStringToUserType() this.type,
      final List<PhotoJson>? images,
      final List<MyExperienceJson>? journeys})
      : _images = images,
        _journeys = journeys,
        super._();

  factory _$_UserInfoJson.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoJsonFromJson(json);

  @override
  final int? id;
  @override
  final String? username;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final PhotoJson? avatar;
  @override
  final PhotoJson? cover;
  @override
  final String? email;
  @override
  final String? provider;
  @override
  final bool? confirmed;
  @override
  final bool? blocked;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  @ConvertStringToUserType()
  final UserType? type;
  final List<PhotoJson>? _images;
  @override
  List<PhotoJson>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MyExperienceJson>? _journeys;
  @override
  List<MyExperienceJson>? get journeys {
    final value = _journeys;
    if (value == null) return null;
    if (_journeys is EqualUnmodifiableListView) return _journeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserInfoJson(id: $id, username: $username, firstName: $firstName, lastName: $lastName, avatar: $avatar, cover: $cover, email: $email, provider: $provider, confirmed: $confirmed, blocked: $blocked, createdAt: $createdAt, updatedAt: $updatedAt, type: $type, images: $images, journeys: $journeys)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserInfoJson'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('avatar', avatar))
      ..add(DiagnosticsProperty('cover', cover))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('provider', provider))
      ..add(DiagnosticsProperty('confirmed', confirmed))
      ..add(DiagnosticsProperty('blocked', blocked))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('images', images))
      ..add(DiagnosticsProperty('journeys', journeys));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfoJson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.confirmed, confirmed) ||
                other.confirmed == confirmed) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._journeys, _journeys));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      firstName,
      lastName,
      avatar,
      cover,
      email,
      provider,
      confirmed,
      blocked,
      createdAt,
      updatedAt,
      type,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_journeys));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInfoJsonCopyWith<_$_UserInfoJson> get copyWith =>
      __$$_UserInfoJsonCopyWithImpl<_$_UserInfoJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInfoJsonToJson(
      this,
    );
  }
}

abstract class _UserInfoJson extends UserInfoJson {
  const factory _UserInfoJson(
      {final int? id,
      final String? username,
      final String? firstName,
      final String? lastName,
      final PhotoJson? avatar,
      final PhotoJson? cover,
      final String? email,
      final String? provider,
      final bool? confirmed,
      final bool? blocked,
      final String? createdAt,
      final String? updatedAt,
      @ConvertStringToUserType() final UserType? type,
      final List<PhotoJson>? images,
      final List<MyExperienceJson>? journeys}) = _$_UserInfoJson;
  const _UserInfoJson._() : super._();

  factory _UserInfoJson.fromJson(Map<String, dynamic> json) =
      _$_UserInfoJson.fromJson;

  @override
  int? get id;
  @override
  String? get username;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  PhotoJson? get avatar;
  @override
  PhotoJson? get cover;
  @override
  String? get email;
  @override
  String? get provider;
  @override
  bool? get confirmed;
  @override
  bool? get blocked;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  @ConvertStringToUserType()
  UserType? get type;
  @override
  List<PhotoJson>? get images;
  @override
  List<MyExperienceJson>? get journeys;
  @override
  @JsonKey(ignore: true)
  _$$_UserInfoJsonCopyWith<_$_UserInfoJson> get copyWith =>
      throw _privateConstructorUsedError;
}
