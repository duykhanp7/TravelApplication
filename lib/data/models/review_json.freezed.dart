// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewJson _$ReviewJsonFromJson(Map<String, dynamic> json) {
  return _ReviewJson.fromJson(json);
}

/// @nodoc
mixin _$ReviewJson {
  int? get id => throw _privateConstructorUsedError;
  String? get ratersName => throw _privateConstructorUsedError;
  String? get ratersImage => throw _privateConstructorUsedError;
  int? get rating => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewJsonCopyWith<ReviewJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewJsonCopyWith<$Res> {
  factory $ReviewJsonCopyWith(
          ReviewJson value, $Res Function(ReviewJson) then) =
      _$ReviewJsonCopyWithImpl<$Res, ReviewJson>;
  @useResult
  $Res call(
      {int? id,
      String? ratersName,
      String? ratersImage,
      int? rating,
      String? createdAt,
      String? content});
}

/// @nodoc
class _$ReviewJsonCopyWithImpl<$Res, $Val extends ReviewJson>
    implements $ReviewJsonCopyWith<$Res> {
  _$ReviewJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ratersName = freezed,
    Object? ratersImage = freezed,
    Object? rating = freezed,
    Object? createdAt = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      ratersName: freezed == ratersName
          ? _value.ratersName
          : ratersName // ignore: cast_nullable_to_non_nullable
              as String?,
      ratersImage: freezed == ratersImage
          ? _value.ratersImage
          : ratersImage // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewJsonCopyWith<$Res>
    implements $ReviewJsonCopyWith<$Res> {
  factory _$$_ReviewJsonCopyWith(
          _$_ReviewJson value, $Res Function(_$_ReviewJson) then) =
      __$$_ReviewJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? ratersName,
      String? ratersImage,
      int? rating,
      String? createdAt,
      String? content});
}

/// @nodoc
class __$$_ReviewJsonCopyWithImpl<$Res>
    extends _$ReviewJsonCopyWithImpl<$Res, _$_ReviewJson>
    implements _$$_ReviewJsonCopyWith<$Res> {
  __$$_ReviewJsonCopyWithImpl(
      _$_ReviewJson _value, $Res Function(_$_ReviewJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ratersName = freezed,
    Object? ratersImage = freezed,
    Object? rating = freezed,
    Object? createdAt = freezed,
    Object? content = freezed,
  }) {
    return _then(_$_ReviewJson(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      ratersName: freezed == ratersName
          ? _value.ratersName
          : ratersName // ignore: cast_nullable_to_non_nullable
              as String?,
      ratersImage: freezed == ratersImage
          ? _value.ratersImage
          : ratersImage // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReviewJson with DiagnosticableTreeMixin implements _ReviewJson {
  const _$_ReviewJson(
      {this.id,
      this.ratersName,
      this.ratersImage,
      this.rating,
      this.createdAt,
      this.content});

  factory _$_ReviewJson.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewJsonFromJson(json);

  @override
  final int? id;
  @override
  final String? ratersName;
  @override
  final String? ratersImage;
  @override
  final int? rating;
  @override
  final String? createdAt;
  @override
  final String? content;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReviewJson(id: $id, ratersName: $ratersName, ratersImage: $ratersImage, rating: $rating, createdAt: $createdAt, content: $content)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReviewJson'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('ratersName', ratersName))
      ..add(DiagnosticsProperty('ratersImage', ratersImage))
      ..add(DiagnosticsProperty('rating', rating))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('content', content));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewJson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ratersName, ratersName) ||
                other.ratersName == ratersName) &&
            (identical(other.ratersImage, ratersImage) ||
                other.ratersImage == ratersImage) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, ratersName, ratersImage, rating, createdAt, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewJsonCopyWith<_$_ReviewJson> get copyWith =>
      __$$_ReviewJsonCopyWithImpl<_$_ReviewJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewJsonToJson(
      this,
    );
  }
}

abstract class _ReviewJson implements ReviewJson {
  const factory _ReviewJson(
      {final int? id,
      final String? ratersName,
      final String? ratersImage,
      final int? rating,
      final String? createdAt,
      final String? content}) = _$_ReviewJson;

  factory _ReviewJson.fromJson(Map<String, dynamic> json) =
      _$_ReviewJson.fromJson;

  @override
  int? get id;
  @override
  String? get ratersName;
  @override
  String? get ratersImage;
  @override
  int? get rating;
  @override
  String? get createdAt;
  @override
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewJsonCopyWith<_$_ReviewJson> get copyWith =>
      throw _privateConstructorUsedError;
}
