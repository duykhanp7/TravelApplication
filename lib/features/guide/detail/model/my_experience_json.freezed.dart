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
  String? get destinationTitle => throw _privateConstructorUsedError;
  String? get destinationName => throw _privateConstructorUsedError;
  String? get dateStart => throw _privateConstructorUsedError;
  String? get countLikes => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;

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
      {String? destinationTitle,
      String? destinationName,
      String? dateStart,
      String? countLikes,
      List<String>? images});
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
    Object? destinationTitle = freezed,
    Object? destinationName = freezed,
    Object? dateStart = freezed,
    Object? countLikes = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      destinationTitle: freezed == destinationTitle
          ? _value.destinationTitle
          : destinationTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationName: freezed == destinationName
          ? _value.destinationName
          : destinationName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as String?,
      countLikes: freezed == countLikes
          ? _value.countLikes
          : countLikes // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
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
      {String? destinationTitle,
      String? destinationName,
      String? dateStart,
      String? countLikes,
      List<String>? images});
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
    Object? destinationTitle = freezed,
    Object? destinationName = freezed,
    Object? dateStart = freezed,
    Object? countLikes = freezed,
    Object? images = freezed,
  }) {
    return _then(_$_MyExperienceJson(
      destinationTitle: freezed == destinationTitle
          ? _value.destinationTitle
          : destinationTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationName: freezed == destinationName
          ? _value.destinationName
          : destinationName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as String?,
      countLikes: freezed == countLikes
          ? _value.countLikes
          : countLikes // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
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
      {this.destinationTitle,
      this.destinationName,
      this.dateStart,
      this.countLikes,
      final List<String>? images})
      : _images = images;

  factory _$_MyExperienceJson.fromJson(Map<String, dynamic> json) =>
      _$$_MyExperienceJsonFromJson(json);

  @override
  final String? destinationTitle;
  @override
  final String? destinationName;
  @override
  final String? dateStart;
  @override
  final String? countLikes;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyExperienceJson(destinationTitle: $destinationTitle, destinationName: $destinationName, dateStart: $dateStart, countLikes: $countLikes, images: $images)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyExperienceJson'))
      ..add(DiagnosticsProperty('destinationTitle', destinationTitle))
      ..add(DiagnosticsProperty('destinationName', destinationName))
      ..add(DiagnosticsProperty('dateStart', dateStart))
      ..add(DiagnosticsProperty('countLikes', countLikes))
      ..add(DiagnosticsProperty('images', images));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyExperienceJson &&
            (identical(other.destinationTitle, destinationTitle) ||
                other.destinationTitle == destinationTitle) &&
            (identical(other.destinationName, destinationName) ||
                other.destinationName == destinationName) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.countLikes, countLikes) ||
                other.countLikes == countLikes) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      destinationTitle,
      destinationName,
      dateStart,
      countLikes,
      const DeepCollectionEquality().hash(_images));

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
      {final String? destinationTitle,
      final String? destinationName,
      final String? dateStart,
      final String? countLikes,
      final List<String>? images}) = _$_MyExperienceJson;

  factory _MyExperienceJson.fromJson(Map<String, dynamic> json) =
      _$_MyExperienceJson.fromJson;

  @override
  String? get destinationTitle;
  @override
  String? get destinationName;
  @override
  String? get dateStart;
  @override
  String? get countLikes;
  @override
  List<String>? get images;
  @override
  @JsonKey(ignore: true)
  _$$_MyExperienceJsonCopyWith<_$_MyExperienceJson> get copyWith =>
      throw _privateConstructorUsedError;
}
