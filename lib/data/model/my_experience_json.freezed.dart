// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_experience_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyExperienceJson _$MyExperienceJsonFromJson(Map<String, dynamic> json) {
  return _MyExperienceJson.fromJson(json);
}

/// @nodoc
mixin _$MyExperienceJson {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get destination => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  bool? get isFavorite => throw _privateConstructorUsedError;
  int? get likes => throw _privateConstructorUsedError;
  List<String>? get photos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyExperienceJsonCopyWith<MyExperienceJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyExperienceJsonCopyWith<$Res> {
  factory $MyExperienceJsonCopyWith(
          MyExperienceJson value, $Res Function(MyExperienceJson) then) =
      _$MyExperienceJsonCopyWithImpl<$Res, MyExperienceJson>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? destination,
      String? createdAt,
      bool? isFavorite,
      int? likes,
      List<String>? photos});
}

/// @nodoc
class _$MyExperienceJsonCopyWithImpl<$Res, $Val extends MyExperienceJson>
    implements $MyExperienceJsonCopyWith<$Res> {
  _$MyExperienceJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? destination = freezed,
    Object? createdAt = freezed,
    Object? isFavorite = freezed,
    Object? likes = freezed,
    Object? photos = freezed,
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
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyExperienceJsonCopyWith<$Res>
    implements $MyExperienceJsonCopyWith<$Res> {
  factory _$$_MyExperienceJsonCopyWith(
          _$_MyExperienceJson value, $Res Function(_$_MyExperienceJson) then) =
      __$$_MyExperienceJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? destination,
      String? createdAt,
      bool? isFavorite,
      int? likes,
      List<String>? photos});
}

/// @nodoc
class __$$_MyExperienceJsonCopyWithImpl<$Res>
    extends _$MyExperienceJsonCopyWithImpl<$Res, _$_MyExperienceJson>
    implements _$$_MyExperienceJsonCopyWith<$Res> {
  __$$_MyExperienceJsonCopyWithImpl(
      _$_MyExperienceJson _value, $Res Function(_$_MyExperienceJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? destination = freezed,
    Object? createdAt = freezed,
    Object? isFavorite = freezed,
    Object? likes = freezed,
    Object? photos = freezed,
  }) {
    return _then(_$_MyExperienceJson(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyExperienceJson
    with DiagnosticableTreeMixin
    implements _MyExperienceJson {
  const _$_MyExperienceJson(
      {this.id,
      this.name,
      this.destination,
      this.createdAt,
      this.isFavorite,
      this.likes,
      final List<String>? photos})
      : _photos = photos;

  factory _$_MyExperienceJson.fromJson(Map<String, dynamic> json) =>
      _$$_MyExperienceJsonFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? destination;
  @override
  final String? createdAt;
  @override
  final bool? isFavorite;
  @override
  final int? likes;
  final List<String>? _photos;
  @override
  List<String>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyExperienceJson(id: $id, name: $name, destination: $destination, createdAt: $createdAt, isFavorite: $isFavorite, likes: $likes, photos: $photos)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyExperienceJson'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('destination', destination))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('isFavorite', isFavorite))
      ..add(DiagnosticsProperty('likes', likes))
      ..add(DiagnosticsProperty('photos', photos));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyExperienceJson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, destination, createdAt,
      isFavorite, likes, const DeepCollectionEquality().hash(_photos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyExperienceJsonCopyWith<_$_MyExperienceJson> get copyWith =>
      __$$_MyExperienceJsonCopyWithImpl<_$_MyExperienceJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyExperienceJsonToJson(
      this,
    );
  }
}

abstract class _MyExperienceJson implements MyExperienceJson {
  const factory _MyExperienceJson(
      {final String? id,
      final String? name,
      final String? destination,
      final String? createdAt,
      final bool? isFavorite,
      final int? likes,
      final List<String>? photos}) = _$_MyExperienceJson;

  factory _MyExperienceJson.fromJson(Map<String, dynamic> json) =
      _$_MyExperienceJson.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get destination;
  @override
  String? get createdAt;
  @override
  bool? get isFavorite;
  @override
  int? get likes;
  @override
  List<String>? get photos;
  @override
  @JsonKey(ignore: true)
  _$$_MyExperienceJsonCopyWith<_$_MyExperienceJson> get copyWith =>
      throw _privateConstructorUsedError;
}
