// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_guide_detail_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TourGuideDetailJson _$TourGuideDetailJsonFromJson(Map<String, dynamic> json) {
  return _TourGuideDetailJson.fromJson(json);
}

/// @nodoc
mixin _$TourGuideDetailJson {
  int? get id => throw _privateConstructorUsedError;
  TourGuideDetailAttributes? get attributes =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TourGuideDetailJsonCopyWith<TourGuideDetailJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourGuideDetailJsonCopyWith<$Res> {
  factory $TourGuideDetailJsonCopyWith(
          TourGuideDetailJson value, $Res Function(TourGuideDetailJson) then) =
      _$TourGuideDetailJsonCopyWithImpl<$Res, TourGuideDetailJson>;
  @useResult
  $Res call({int? id, TourGuideDetailAttributes? attributes});

  $TourGuideDetailAttributesCopyWith<$Res>? get attributes;
}

/// @nodoc
class _$TourGuideDetailJsonCopyWithImpl<$Res, $Val extends TourGuideDetailJson>
    implements $TourGuideDetailJsonCopyWith<$Res> {
  _$TourGuideDetailJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as TourGuideDetailAttributes?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TourGuideDetailAttributesCopyWith<$Res>? get attributes {
    if (_value.attributes == null) {
      return null;
    }

    return $TourGuideDetailAttributesCopyWith<$Res>(_value.attributes!,
        (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TourGuideDetailJsonCopyWith<$Res>
    implements $TourGuideDetailJsonCopyWith<$Res> {
  factory _$$_TourGuideDetailJsonCopyWith(_$_TourGuideDetailJson value,
          $Res Function(_$_TourGuideDetailJson) then) =
      __$$_TourGuideDetailJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, TourGuideDetailAttributes? attributes});

  @override
  $TourGuideDetailAttributesCopyWith<$Res>? get attributes;
}

/// @nodoc
class __$$_TourGuideDetailJsonCopyWithImpl<$Res>
    extends _$TourGuideDetailJsonCopyWithImpl<$Res, _$_TourGuideDetailJson>
    implements _$$_TourGuideDetailJsonCopyWith<$Res> {
  __$$_TourGuideDetailJsonCopyWithImpl(_$_TourGuideDetailJson _value,
      $Res Function(_$_TourGuideDetailJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$_TourGuideDetailJson(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as TourGuideDetailAttributes?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TourGuideDetailJson
    with DiagnosticableTreeMixin
    implements _TourGuideDetailJson {
  const _$_TourGuideDetailJson({this.id, this.attributes});

  factory _$_TourGuideDetailJson.fromJson(Map<String, dynamic> json) =>
      _$$_TourGuideDetailJsonFromJson(json);

  @override
  final int? id;
  @override
  final TourGuideDetailAttributes? attributes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TourGuideDetailJson(id: $id, attributes: $attributes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TourGuideDetailJson'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('attributes', attributes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TourGuideDetailJson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.attributes, attributes) ||
                other.attributes == attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, attributes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TourGuideDetailJsonCopyWith<_$_TourGuideDetailJson> get copyWith =>
      __$$_TourGuideDetailJsonCopyWithImpl<_$_TourGuideDetailJson>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TourGuideDetailJsonToJson(
      this,
    );
  }
}

abstract class _TourGuideDetailJson implements TourGuideDetailJson {
  const factory _TourGuideDetailJson(
      {final int? id,
      final TourGuideDetailAttributes? attributes}) = _$_TourGuideDetailJson;

  factory _TourGuideDetailJson.fromJson(Map<String, dynamic> json) =
      _$_TourGuideDetailJson.fromJson;

  @override
  int? get id;
  @override
  TourGuideDetailAttributes? get attributes;
  @override
  @JsonKey(ignore: true)
  _$$_TourGuideDetailJsonCopyWith<_$_TourGuideDetailJson> get copyWith =>
      throw _privateConstructorUsedError;
}

TourGuideDetailAttributes _$TourGuideDetailAttributesFromJson(
    Map<String, dynamic> json) {
  return _TourGuideDetailAttributes.fromJson(json);
}

/// @nodoc
mixin _$TourGuideDetailAttributes {
  @JsonKey(name: 'Introduction')
  String? get introduction => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get publishedAt => throw _privateConstructorUsedError;
  String? get availabletime => throw _privateConstructorUsedError;
  dynamic get fee => throw _privateConstructorUsedError;
  dynamic get videoIntroduction => throw _privateConstructorUsedError;
  TourGuideDetailAttributesUser? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TourGuideDetailAttributesCopyWith<TourGuideDetailAttributes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourGuideDetailAttributesCopyWith<$Res> {
  factory $TourGuideDetailAttributesCopyWith(TourGuideDetailAttributes value,
          $Res Function(TourGuideDetailAttributes) then) =
      _$TourGuideDetailAttributesCopyWithImpl<$Res, TourGuideDetailAttributes>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Introduction') String? introduction,
      String? city,
      String? language,
      String? createdAt,
      String? updatedAt,
      String? publishedAt,
      String? availabletime,
      dynamic fee,
      dynamic videoIntroduction,
      TourGuideDetailAttributesUser? user});

  $TourGuideDetailAttributesUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$TourGuideDetailAttributesCopyWithImpl<$Res,
        $Val extends TourGuideDetailAttributes>
    implements $TourGuideDetailAttributesCopyWith<$Res> {
  _$TourGuideDetailAttributesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? introduction = freezed,
    Object? city = freezed,
    Object? language = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? publishedAt = freezed,
    Object? availabletime = freezed,
    Object? fee = freezed,
    Object? videoIntroduction = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      introduction: freezed == introduction
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
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
      availabletime: freezed == availabletime
          ? _value.availabletime
          : availabletime // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as dynamic,
      videoIntroduction: freezed == videoIntroduction
          ? _value.videoIntroduction
          : videoIntroduction // ignore: cast_nullable_to_non_nullable
              as dynamic,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as TourGuideDetailAttributesUser?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TourGuideDetailAttributesUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $TourGuideDetailAttributesUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TourGuideDetailAttributesCopyWith<$Res>
    implements $TourGuideDetailAttributesCopyWith<$Res> {
  factory _$$_TourGuideDetailAttributesCopyWith(
          _$_TourGuideDetailAttributes value,
          $Res Function(_$_TourGuideDetailAttributes) then) =
      __$$_TourGuideDetailAttributesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Introduction') String? introduction,
      String? city,
      String? language,
      String? createdAt,
      String? updatedAt,
      String? publishedAt,
      String? availabletime,
      dynamic fee,
      dynamic videoIntroduction,
      TourGuideDetailAttributesUser? user});

  @override
  $TourGuideDetailAttributesUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_TourGuideDetailAttributesCopyWithImpl<$Res>
    extends _$TourGuideDetailAttributesCopyWithImpl<$Res,
        _$_TourGuideDetailAttributes>
    implements _$$_TourGuideDetailAttributesCopyWith<$Res> {
  __$$_TourGuideDetailAttributesCopyWithImpl(
      _$_TourGuideDetailAttributes _value,
      $Res Function(_$_TourGuideDetailAttributes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? introduction = freezed,
    Object? city = freezed,
    Object? language = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? publishedAt = freezed,
    Object? availabletime = freezed,
    Object? fee = freezed,
    Object? videoIntroduction = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_TourGuideDetailAttributes(
      introduction: freezed == introduction
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
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
      availabletime: freezed == availabletime
          ? _value.availabletime
          : availabletime // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as dynamic,
      videoIntroduction: freezed == videoIntroduction
          ? _value.videoIntroduction
          : videoIntroduction // ignore: cast_nullable_to_non_nullable
              as dynamic,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as TourGuideDetailAttributesUser?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TourGuideDetailAttributes
    with DiagnosticableTreeMixin
    implements _TourGuideDetailAttributes {
  const _$_TourGuideDetailAttributes(
      {@JsonKey(name: 'Introduction') this.introduction,
      this.city,
      this.language,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.availabletime,
      this.fee,
      this.videoIntroduction,
      this.user});

  factory _$_TourGuideDetailAttributes.fromJson(Map<String, dynamic> json) =>
      _$$_TourGuideDetailAttributesFromJson(json);

  @override
  @JsonKey(name: 'Introduction')
  final String? introduction;
  @override
  final String? city;
  @override
  final String? language;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final String? publishedAt;
  @override
  final String? availabletime;
  @override
  final dynamic fee;
  @override
  final dynamic videoIntroduction;
  @override
  final TourGuideDetailAttributesUser? user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TourGuideDetailAttributes(introduction: $introduction, city: $city, language: $language, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, availabletime: $availabletime, fee: $fee, videoIntroduction: $videoIntroduction, user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TourGuideDetailAttributes'))
      ..add(DiagnosticsProperty('introduction', introduction))
      ..add(DiagnosticsProperty('city', city))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('publishedAt', publishedAt))
      ..add(DiagnosticsProperty('availabletime', availabletime))
      ..add(DiagnosticsProperty('fee', fee))
      ..add(DiagnosticsProperty('videoIntroduction', videoIntroduction))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TourGuideDetailAttributes &&
            (identical(other.introduction, introduction) ||
                other.introduction == introduction) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.availabletime, availabletime) ||
                other.availabletime == availabletime) &&
            const DeepCollectionEquality().equals(other.fee, fee) &&
            const DeepCollectionEquality()
                .equals(other.videoIntroduction, videoIntroduction) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      introduction,
      city,
      language,
      createdAt,
      updatedAt,
      publishedAt,
      availabletime,
      const DeepCollectionEquality().hash(fee),
      const DeepCollectionEquality().hash(videoIntroduction),
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TourGuideDetailAttributesCopyWith<_$_TourGuideDetailAttributes>
      get copyWith => __$$_TourGuideDetailAttributesCopyWithImpl<
          _$_TourGuideDetailAttributes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TourGuideDetailAttributesToJson(
      this,
    );
  }
}

abstract class _TourGuideDetailAttributes implements TourGuideDetailAttributes {
  const factory _TourGuideDetailAttributes(
          {@JsonKey(name: 'Introduction') final String? introduction,
          final String? city,
          final String? language,
          final String? createdAt,
          final String? updatedAt,
          final String? publishedAt,
          final String? availabletime,
          final dynamic fee,
          final dynamic videoIntroduction,
          final TourGuideDetailAttributesUser? user}) =
      _$_TourGuideDetailAttributes;

  factory _TourGuideDetailAttributes.fromJson(Map<String, dynamic> json) =
      _$_TourGuideDetailAttributes.fromJson;

  @override
  @JsonKey(name: 'Introduction')
  String? get introduction;
  @override
  String? get city;
  @override
  String? get language;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  String? get publishedAt;
  @override
  String? get availabletime;
  @override
  dynamic get fee;
  @override
  dynamic get videoIntroduction;
  @override
  TourGuideDetailAttributesUser? get user;
  @override
  @JsonKey(ignore: true)
  _$$_TourGuideDetailAttributesCopyWith<_$_TourGuideDetailAttributes>
      get copyWith => throw _privateConstructorUsedError;
}

TourGuideDetailAttributesUser _$TourGuideDetailAttributesUserFromJson(
    Map<String, dynamic> json) {
  return _TourGuideDetailAttributesUser.fromJson(json);
}

/// @nodoc
mixin _$TourGuideDetailAttributesUser {
  TourGuideDetailAttributesUserData? get data =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TourGuideDetailAttributesUserCopyWith<TourGuideDetailAttributesUser>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourGuideDetailAttributesUserCopyWith<$Res> {
  factory $TourGuideDetailAttributesUserCopyWith(
          TourGuideDetailAttributesUser value,
          $Res Function(TourGuideDetailAttributesUser) then) =
      _$TourGuideDetailAttributesUserCopyWithImpl<$Res,
          TourGuideDetailAttributesUser>;
  @useResult
  $Res call({TourGuideDetailAttributesUserData? data});

  $TourGuideDetailAttributesUserDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$TourGuideDetailAttributesUserCopyWithImpl<$Res,
        $Val extends TourGuideDetailAttributesUser>
    implements $TourGuideDetailAttributesUserCopyWith<$Res> {
  _$TourGuideDetailAttributesUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TourGuideDetailAttributesUserData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TourGuideDetailAttributesUserDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $TourGuideDetailAttributesUserDataCopyWith<$Res>(_value.data!,
        (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TourGuideDetailAttributesUserCopyWith<$Res>
    implements $TourGuideDetailAttributesUserCopyWith<$Res> {
  factory _$$_TourGuideDetailAttributesUserCopyWith(
          _$_TourGuideDetailAttributesUser value,
          $Res Function(_$_TourGuideDetailAttributesUser) then) =
      __$$_TourGuideDetailAttributesUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TourGuideDetailAttributesUserData? data});

  @override
  $TourGuideDetailAttributesUserDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_TourGuideDetailAttributesUserCopyWithImpl<$Res>
    extends _$TourGuideDetailAttributesUserCopyWithImpl<$Res,
        _$_TourGuideDetailAttributesUser>
    implements _$$_TourGuideDetailAttributesUserCopyWith<$Res> {
  __$$_TourGuideDetailAttributesUserCopyWithImpl(
      _$_TourGuideDetailAttributesUser _value,
      $Res Function(_$_TourGuideDetailAttributesUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_TourGuideDetailAttributesUser(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TourGuideDetailAttributesUserData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TourGuideDetailAttributesUser
    with DiagnosticableTreeMixin
    implements _TourGuideDetailAttributesUser {
  const _$_TourGuideDetailAttributesUser({this.data});

  factory _$_TourGuideDetailAttributesUser.fromJson(
          Map<String, dynamic> json) =>
      _$$_TourGuideDetailAttributesUserFromJson(json);

  @override
  final TourGuideDetailAttributesUserData? data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TourGuideDetailAttributesUser(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TourGuideDetailAttributesUser'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TourGuideDetailAttributesUser &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TourGuideDetailAttributesUserCopyWith<_$_TourGuideDetailAttributesUser>
      get copyWith => __$$_TourGuideDetailAttributesUserCopyWithImpl<
          _$_TourGuideDetailAttributesUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TourGuideDetailAttributesUserToJson(
      this,
    );
  }
}

abstract class _TourGuideDetailAttributesUser
    implements TourGuideDetailAttributesUser {
  const factory _TourGuideDetailAttributesUser(
          {final TourGuideDetailAttributesUserData? data}) =
      _$_TourGuideDetailAttributesUser;

  factory _TourGuideDetailAttributesUser.fromJson(Map<String, dynamic> json) =
      _$_TourGuideDetailAttributesUser.fromJson;

  @override
  TourGuideDetailAttributesUserData? get data;
  @override
  @JsonKey(ignore: true)
  _$$_TourGuideDetailAttributesUserCopyWith<_$_TourGuideDetailAttributesUser>
      get copyWith => throw _privateConstructorUsedError;
}

TourGuideDetailAttributesUserData _$TourGuideDetailAttributesUserDataFromJson(
    Map<String, dynamic> json) {
  return _TourGuideDetailAttributesUserData.fromJson(json);
}

/// @nodoc
mixin _$TourGuideDetailAttributesUserData {
  int? get id => throw _privateConstructorUsedError;
  TourGuideDetailAttributesUserDataAttributes? get attributes =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TourGuideDetailAttributesUserDataCopyWith<TourGuideDetailAttributesUserData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourGuideDetailAttributesUserDataCopyWith<$Res> {
  factory $TourGuideDetailAttributesUserDataCopyWith(
          TourGuideDetailAttributesUserData value,
          $Res Function(TourGuideDetailAttributesUserData) then) =
      _$TourGuideDetailAttributesUserDataCopyWithImpl<$Res,
          TourGuideDetailAttributesUserData>;
  @useResult
  $Res call({int? id, TourGuideDetailAttributesUserDataAttributes? attributes});

  $TourGuideDetailAttributesUserDataAttributesCopyWith<$Res>? get attributes;
}

/// @nodoc
class _$TourGuideDetailAttributesUserDataCopyWithImpl<$Res,
        $Val extends TourGuideDetailAttributesUserData>
    implements $TourGuideDetailAttributesUserDataCopyWith<$Res> {
  _$TourGuideDetailAttributesUserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as TourGuideDetailAttributesUserDataAttributes?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TourGuideDetailAttributesUserDataAttributesCopyWith<$Res>? get attributes {
    if (_value.attributes == null) {
      return null;
    }

    return $TourGuideDetailAttributesUserDataAttributesCopyWith<$Res>(
        _value.attributes!, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TourGuideDetailAttributesUserDataCopyWith<$Res>
    implements $TourGuideDetailAttributesUserDataCopyWith<$Res> {
  factory _$$_TourGuideDetailAttributesUserDataCopyWith(
          _$_TourGuideDetailAttributesUserData value,
          $Res Function(_$_TourGuideDetailAttributesUserData) then) =
      __$$_TourGuideDetailAttributesUserDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, TourGuideDetailAttributesUserDataAttributes? attributes});

  @override
  $TourGuideDetailAttributesUserDataAttributesCopyWith<$Res>? get attributes;
}

/// @nodoc
class __$$_TourGuideDetailAttributesUserDataCopyWithImpl<$Res>
    extends _$TourGuideDetailAttributesUserDataCopyWithImpl<$Res,
        _$_TourGuideDetailAttributesUserData>
    implements _$$_TourGuideDetailAttributesUserDataCopyWith<$Res> {
  __$$_TourGuideDetailAttributesUserDataCopyWithImpl(
      _$_TourGuideDetailAttributesUserData _value,
      $Res Function(_$_TourGuideDetailAttributesUserData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$_TourGuideDetailAttributesUserData(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as TourGuideDetailAttributesUserDataAttributes?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TourGuideDetailAttributesUserData
    with DiagnosticableTreeMixin
    implements _TourGuideDetailAttributesUserData {
  const _$_TourGuideDetailAttributesUserData({this.id, this.attributes});

  factory _$_TourGuideDetailAttributesUserData.fromJson(
          Map<String, dynamic> json) =>
      _$$_TourGuideDetailAttributesUserDataFromJson(json);

  @override
  final int? id;
  @override
  final TourGuideDetailAttributesUserDataAttributes? attributes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TourGuideDetailAttributesUserData(id: $id, attributes: $attributes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TourGuideDetailAttributesUserData'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('attributes', attributes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TourGuideDetailAttributesUserData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.attributes, attributes) ||
                other.attributes == attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, attributes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TourGuideDetailAttributesUserDataCopyWith<
          _$_TourGuideDetailAttributesUserData>
      get copyWith => __$$_TourGuideDetailAttributesUserDataCopyWithImpl<
          _$_TourGuideDetailAttributesUserData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TourGuideDetailAttributesUserDataToJson(
      this,
    );
  }
}

abstract class _TourGuideDetailAttributesUserData
    implements TourGuideDetailAttributesUserData {
  const factory _TourGuideDetailAttributesUserData(
          {final int? id,
          final TourGuideDetailAttributesUserDataAttributes? attributes}) =
      _$_TourGuideDetailAttributesUserData;

  factory _TourGuideDetailAttributesUserData.fromJson(
          Map<String, dynamic> json) =
      _$_TourGuideDetailAttributesUserData.fromJson;

  @override
  int? get id;
  @override
  TourGuideDetailAttributesUserDataAttributes? get attributes;
  @override
  @JsonKey(ignore: true)
  _$$_TourGuideDetailAttributesUserDataCopyWith<
          _$_TourGuideDetailAttributesUserData>
      get copyWith => throw _privateConstructorUsedError;
}

TourGuideDetailAttributesUserDataAttributes
    _$TourGuideDetailAttributesUserDataAttributesFromJson(
        Map<String, dynamic> json) {
  return _TourGuideDetailAttributesUserDataAttributes.fromJson(json);
}

/// @nodoc
mixin _$TourGuideDetailAttributesUserDataAttributes {
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get provider => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  TourGuideDetailAttributesUserDataAttributesAvatar? get avatar =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TourGuideDetailAttributesUserDataAttributesCopyWith<
          TourGuideDetailAttributesUserDataAttributes>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourGuideDetailAttributesUserDataAttributesCopyWith<$Res> {
  factory $TourGuideDetailAttributesUserDataAttributesCopyWith(
          TourGuideDetailAttributesUserDataAttributes value,
          $Res Function(TourGuideDetailAttributesUserDataAttributes) then) =
      _$TourGuideDetailAttributesUserDataAttributesCopyWithImpl<$Res,
          TourGuideDetailAttributesUserDataAttributes>;
  @useResult
  $Res call(
      {String? username,
      String? email,
      String? provider,
      String? firstName,
      String? lastName,
      String? country,
      TourGuideDetailAttributesUserDataAttributesAvatar? avatar});

  $TourGuideDetailAttributesUserDataAttributesAvatarCopyWith<$Res>? get avatar;
}

/// @nodoc
class _$TourGuideDetailAttributesUserDataAttributesCopyWithImpl<$Res,
        $Val extends TourGuideDetailAttributesUserDataAttributes>
    implements $TourGuideDetailAttributesUserDataAttributesCopyWith<$Res> {
  _$TourGuideDetailAttributesUserDataAttributesCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? email = freezed,
    Object? provider = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? country = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as TourGuideDetailAttributesUserDataAttributesAvatar?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TourGuideDetailAttributesUserDataAttributesAvatarCopyWith<$Res>? get avatar {
    if (_value.avatar == null) {
      return null;
    }

    return $TourGuideDetailAttributesUserDataAttributesAvatarCopyWith<$Res>(
        _value.avatar!, (value) {
      return _then(_value.copyWith(avatar: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TourGuideDetailAttributesUserDataAttributesCopyWith<$Res>
    implements $TourGuideDetailAttributesUserDataAttributesCopyWith<$Res> {
  factory _$$_TourGuideDetailAttributesUserDataAttributesCopyWith(
          _$_TourGuideDetailAttributesUserDataAttributes value,
          $Res Function(_$_TourGuideDetailAttributesUserDataAttributes) then) =
      __$$_TourGuideDetailAttributesUserDataAttributesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? username,
      String? email,
      String? provider,
      String? firstName,
      String? lastName,
      String? country,
      TourGuideDetailAttributesUserDataAttributesAvatar? avatar});

  @override
  $TourGuideDetailAttributesUserDataAttributesAvatarCopyWith<$Res>? get avatar;
}

/// @nodoc
class __$$_TourGuideDetailAttributesUserDataAttributesCopyWithImpl<$Res>
    extends _$TourGuideDetailAttributesUserDataAttributesCopyWithImpl<$Res,
        _$_TourGuideDetailAttributesUserDataAttributes>
    implements _$$_TourGuideDetailAttributesUserDataAttributesCopyWith<$Res> {
  __$$_TourGuideDetailAttributesUserDataAttributesCopyWithImpl(
      _$_TourGuideDetailAttributesUserDataAttributes _value,
      $Res Function(_$_TourGuideDetailAttributesUserDataAttributes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? email = freezed,
    Object? provider = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? country = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_$_TourGuideDetailAttributesUserDataAttributes(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as TourGuideDetailAttributesUserDataAttributesAvatar?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TourGuideDetailAttributesUserDataAttributes
    with DiagnosticableTreeMixin
    implements _TourGuideDetailAttributesUserDataAttributes {
  const _$_TourGuideDetailAttributesUserDataAttributes(
      {this.username,
      this.email,
      this.provider,
      this.firstName,
      this.lastName,
      this.country,
      this.avatar});

  factory _$_TourGuideDetailAttributesUserDataAttributes.fromJson(
          Map<String, dynamic> json) =>
      _$$_TourGuideDetailAttributesUserDataAttributesFromJson(json);

  @override
  final String? username;
  @override
  final String? email;
  @override
  final String? provider;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? country;
  @override
  final TourGuideDetailAttributesUserDataAttributesAvatar? avatar;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TourGuideDetailAttributesUserDataAttributes(username: $username, email: $email, provider: $provider, firstName: $firstName, lastName: $lastName, country: $country, avatar: $avatar)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'TourGuideDetailAttributesUserDataAttributes'))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('provider', provider))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('country', country))
      ..add(DiagnosticsProperty('avatar', avatar));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TourGuideDetailAttributesUserDataAttributes &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, email, provider,
      firstName, lastName, country, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TourGuideDetailAttributesUserDataAttributesCopyWith<
          _$_TourGuideDetailAttributesUserDataAttributes>
      get copyWith =>
          __$$_TourGuideDetailAttributesUserDataAttributesCopyWithImpl<
              _$_TourGuideDetailAttributesUserDataAttributes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TourGuideDetailAttributesUserDataAttributesToJson(
      this,
    );
  }
}

abstract class _TourGuideDetailAttributesUserDataAttributes
    implements TourGuideDetailAttributesUserDataAttributes {
  const factory _TourGuideDetailAttributesUserDataAttributes(
          {final String? username,
          final String? email,
          final String? provider,
          final String? firstName,
          final String? lastName,
          final String? country,
          final TourGuideDetailAttributesUserDataAttributesAvatar? avatar}) =
      _$_TourGuideDetailAttributesUserDataAttributes;

  factory _TourGuideDetailAttributesUserDataAttributes.fromJson(
          Map<String, dynamic> json) =
      _$_TourGuideDetailAttributesUserDataAttributes.fromJson;

  @override
  String? get username;
  @override
  String? get email;
  @override
  String? get provider;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get country;
  @override
  TourGuideDetailAttributesUserDataAttributesAvatar? get avatar;
  @override
  @JsonKey(ignore: true)
  _$$_TourGuideDetailAttributesUserDataAttributesCopyWith<
          _$_TourGuideDetailAttributesUserDataAttributes>
      get copyWith => throw _privateConstructorUsedError;
}

TourGuideDetailAttributesUserDataAttributesAvatar
    _$TourGuideDetailAttributesUserDataAttributesAvatarFromJson(
        Map<String, dynamic> json) {
  return _TourGuideDetailAttributesUserDataAttributesAvatar.fromJson(json);
}

/// @nodoc
mixin _$TourGuideDetailAttributesUserDataAttributesAvatar {
  TourGuideDetailAttributesUserDataAttributesAvatarData? get data =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TourGuideDetailAttributesUserDataAttributesAvatarCopyWith<
          TourGuideDetailAttributesUserDataAttributesAvatar>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourGuideDetailAttributesUserDataAttributesAvatarCopyWith<
    $Res> {
  factory $TourGuideDetailAttributesUserDataAttributesAvatarCopyWith(
          TourGuideDetailAttributesUserDataAttributesAvatar value,
          $Res Function(TourGuideDetailAttributesUserDataAttributesAvatar)
              then) =
      _$TourGuideDetailAttributesUserDataAttributesAvatarCopyWithImpl<$Res,
          TourGuideDetailAttributesUserDataAttributesAvatar>;
  @useResult
  $Res call({TourGuideDetailAttributesUserDataAttributesAvatarData? data});

  $TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWith<$Res>?
      get data;
}

/// @nodoc
class _$TourGuideDetailAttributesUserDataAttributesAvatarCopyWithImpl<$Res,
        $Val extends TourGuideDetailAttributesUserDataAttributesAvatar>
    implements
        $TourGuideDetailAttributesUserDataAttributesAvatarCopyWith<$Res> {
  _$TourGuideDetailAttributesUserDataAttributesAvatarCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TourGuideDetailAttributesUserDataAttributesAvatarData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWith<$Res>?
      get data {
    if (_value.data == null) {
      return null;
    }

    return $TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWith<$Res>(
        _value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TourGuideDetailAttributesUserDataAttributesAvatarCopyWith<
        $Res>
    implements
        $TourGuideDetailAttributesUserDataAttributesAvatarCopyWith<$Res> {
  factory _$$_TourGuideDetailAttributesUserDataAttributesAvatarCopyWith(
          _$_TourGuideDetailAttributesUserDataAttributesAvatar value,
          $Res Function(_$_TourGuideDetailAttributesUserDataAttributesAvatar)
              then) =
      __$$_TourGuideDetailAttributesUserDataAttributesAvatarCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TourGuideDetailAttributesUserDataAttributesAvatarData? data});

  @override
  $TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWith<$Res>?
      get data;
}

/// @nodoc
class __$$_TourGuideDetailAttributesUserDataAttributesAvatarCopyWithImpl<$Res>
    extends _$TourGuideDetailAttributesUserDataAttributesAvatarCopyWithImpl<
        $Res, _$_TourGuideDetailAttributesUserDataAttributesAvatar>
    implements
        _$$_TourGuideDetailAttributesUserDataAttributesAvatarCopyWith<$Res> {
  __$$_TourGuideDetailAttributesUserDataAttributesAvatarCopyWithImpl(
      _$_TourGuideDetailAttributesUserDataAttributesAvatar _value,
      $Res Function(_$_TourGuideDetailAttributesUserDataAttributesAvatar) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_TourGuideDetailAttributesUserDataAttributesAvatar(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TourGuideDetailAttributesUserDataAttributesAvatarData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TourGuideDetailAttributesUserDataAttributesAvatar
    with DiagnosticableTreeMixin
    implements _TourGuideDetailAttributesUserDataAttributesAvatar {
  const _$_TourGuideDetailAttributesUserDataAttributesAvatar({this.data});

  factory _$_TourGuideDetailAttributesUserDataAttributesAvatar.fromJson(
          Map<String, dynamic> json) =>
      _$$_TourGuideDetailAttributesUserDataAttributesAvatarFromJson(json);

  @override
  final TourGuideDetailAttributesUserDataAttributesAvatarData? data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TourGuideDetailAttributesUserDataAttributesAvatar(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'TourGuideDetailAttributesUserDataAttributesAvatar'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TourGuideDetailAttributesUserDataAttributesAvatar &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TourGuideDetailAttributesUserDataAttributesAvatarCopyWith<
          _$_TourGuideDetailAttributesUserDataAttributesAvatar>
      get copyWith =>
          __$$_TourGuideDetailAttributesUserDataAttributesAvatarCopyWithImpl<
                  _$_TourGuideDetailAttributesUserDataAttributesAvatar>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TourGuideDetailAttributesUserDataAttributesAvatarToJson(
      this,
    );
  }
}

abstract class _TourGuideDetailAttributesUserDataAttributesAvatar
    implements TourGuideDetailAttributesUserDataAttributesAvatar {
  const factory _TourGuideDetailAttributesUserDataAttributesAvatar(
          {final TourGuideDetailAttributesUserDataAttributesAvatarData? data}) =
      _$_TourGuideDetailAttributesUserDataAttributesAvatar;

  factory _TourGuideDetailAttributesUserDataAttributesAvatar.fromJson(
          Map<String, dynamic> json) =
      _$_TourGuideDetailAttributesUserDataAttributesAvatar.fromJson;

  @override
  TourGuideDetailAttributesUserDataAttributesAvatarData? get data;
  @override
  @JsonKey(ignore: true)
  _$$_TourGuideDetailAttributesUserDataAttributesAvatarCopyWith<
          _$_TourGuideDetailAttributesUserDataAttributesAvatar>
      get copyWith => throw _privateConstructorUsedError;
}

TourGuideDetailAttributesUserDataAttributesAvatarData
    _$TourGuideDetailAttributesUserDataAttributesAvatarDataFromJson(
        Map<String, dynamic> json) {
  return _TourGuideDetailAttributesUserDataAttributesAvatarData.fromJson(json);
}

/// @nodoc
mixin _$TourGuideDetailAttributesUserDataAttributesAvatarData {
  int? get id => throw _privateConstructorUsedError;
  PhotoJson? get attributes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWith<
          TourGuideDetailAttributesUserDataAttributesAvatarData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWith<
    $Res> {
  factory $TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWith(
          TourGuideDetailAttributesUserDataAttributesAvatarData value,
          $Res Function(TourGuideDetailAttributesUserDataAttributesAvatarData)
              then) =
      _$TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWithImpl<$Res,
          TourGuideDetailAttributesUserDataAttributesAvatarData>;
  @useResult
  $Res call({int? id, PhotoJson? attributes});

  $PhotoJsonCopyWith<$Res>? get attributes;
}

/// @nodoc
class _$TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWithImpl<$Res,
        $Val extends TourGuideDetailAttributesUserDataAttributesAvatarData>
    implements
        $TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWith<$Res> {
  _$TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as PhotoJson?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PhotoJsonCopyWith<$Res>? get attributes {
    if (_value.attributes == null) {
      return null;
    }

    return $PhotoJsonCopyWith<$Res>(_value.attributes!, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWith<
        $Res>
    implements
        $TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWith<$Res> {
  factory _$$_TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWith(
          _$_TourGuideDetailAttributesUserDataAttributesAvatarData value,
          $Res Function(
                  _$_TourGuideDetailAttributesUserDataAttributesAvatarData)
              then) =
      __$$_TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWithImpl<
          $Res>;
  @override
  @useResult
  $Res call({int? id, PhotoJson? attributes});

  @override
  $PhotoJsonCopyWith<$Res>? get attributes;
}

/// @nodoc
class __$$_TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWithImpl<
        $Res>
    extends _$TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWithImpl<
        $Res, _$_TourGuideDetailAttributesUserDataAttributesAvatarData>
    implements
        _$$_TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWith<
            $Res> {
  __$$_TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWithImpl(
      _$_TourGuideDetailAttributesUserDataAttributesAvatarData _value,
      $Res Function(_$_TourGuideDetailAttributesUserDataAttributesAvatarData)
          _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$_TourGuideDetailAttributesUserDataAttributesAvatarData(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as PhotoJson?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TourGuideDetailAttributesUserDataAttributesAvatarData
    with DiagnosticableTreeMixin
    implements _TourGuideDetailAttributesUserDataAttributesAvatarData {
  const _$_TourGuideDetailAttributesUserDataAttributesAvatarData(
      {this.id, this.attributes});

  factory _$_TourGuideDetailAttributesUserDataAttributesAvatarData.fromJson(
          Map<String, dynamic> json) =>
      _$$_TourGuideDetailAttributesUserDataAttributesAvatarDataFromJson(json);

  @override
  final int? id;
  @override
  final PhotoJson? attributes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TourGuideDetailAttributesUserDataAttributesAvatarData(id: $id, attributes: $attributes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'TourGuideDetailAttributesUserDataAttributesAvatarData'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('attributes', attributes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TourGuideDetailAttributesUserDataAttributesAvatarData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.attributes, attributes) ||
                other.attributes == attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, attributes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWith<
          _$_TourGuideDetailAttributesUserDataAttributesAvatarData>
      get copyWith =>
          __$$_TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWithImpl<
                  _$_TourGuideDetailAttributesUserDataAttributesAvatarData>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TourGuideDetailAttributesUserDataAttributesAvatarDataToJson(
      this,
    );
  }
}

abstract class _TourGuideDetailAttributesUserDataAttributesAvatarData
    implements TourGuideDetailAttributesUserDataAttributesAvatarData {
  const factory _TourGuideDetailAttributesUserDataAttributesAvatarData(
          {final int? id, final PhotoJson? attributes}) =
      _$_TourGuideDetailAttributesUserDataAttributesAvatarData;

  factory _TourGuideDetailAttributesUserDataAttributesAvatarData.fromJson(
          Map<String, dynamic> json) =
      _$_TourGuideDetailAttributesUserDataAttributesAvatarData.fromJson;

  @override
  int? get id;
  @override
  PhotoJson? get attributes;
  @override
  @JsonKey(ignore: true)
  _$$_TourGuideDetailAttributesUserDataAttributesAvatarDataCopyWith<
          _$_TourGuideDetailAttributesUserDataAttributesAvatarData>
      get copyWith => throw _privateConstructorUsedError;
}
