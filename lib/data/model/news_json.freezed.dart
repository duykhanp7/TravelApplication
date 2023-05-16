// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsJson _$NewsJsonFromJson(Map<String, dynamic> json) {
  return _NewsJson.fromJson(json);
}

/// @nodoc
mixin _$NewsJson {
  int? get id => throw _privateConstructorUsedError;
  AttributesJson? get attributes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsJsonCopyWith<NewsJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsJsonCopyWith<$Res> {
  factory $NewsJsonCopyWith(NewsJson value, $Res Function(NewsJson) then) =
      _$NewsJsonCopyWithImpl<$Res, NewsJson>;
  @useResult
  $Res call({int? id, AttributesJson? attributes});

  $AttributesJsonCopyWith<$Res>? get attributes;
}

/// @nodoc
class _$NewsJsonCopyWithImpl<$Res, $Val extends NewsJson>
    implements $NewsJsonCopyWith<$Res> {
  _$NewsJsonCopyWithImpl(this._value, this._then);

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
              as AttributesJson?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AttributesJsonCopyWith<$Res>? get attributes {
    if (_value.attributes == null) {
      return null;
    }

    return $AttributesJsonCopyWith<$Res>(_value.attributes!, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NewsJsonCopyWith<$Res> implements $NewsJsonCopyWith<$Res> {
  factory _$$_NewsJsonCopyWith(
          _$_NewsJson value, $Res Function(_$_NewsJson) then) =
      __$$_NewsJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, AttributesJson? attributes});

  @override
  $AttributesJsonCopyWith<$Res>? get attributes;
}

/// @nodoc
class __$$_NewsJsonCopyWithImpl<$Res>
    extends _$NewsJsonCopyWithImpl<$Res, _$_NewsJson>
    implements _$$_NewsJsonCopyWith<$Res> {
  __$$_NewsJsonCopyWithImpl(
      _$_NewsJson _value, $Res Function(_$_NewsJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$_NewsJson(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as AttributesJson?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsJson with DiagnosticableTreeMixin implements _NewsJson {
  const _$_NewsJson({this.id, this.attributes});

  factory _$_NewsJson.fromJson(Map<String, dynamic> json) =>
      _$$_NewsJsonFromJson(json);

  @override
  final int? id;
  @override
  final AttributesJson? attributes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NewsJson(id: $id, attributes: $attributes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NewsJson'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('attributes', attributes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsJson &&
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
  _$$_NewsJsonCopyWith<_$_NewsJson> get copyWith =>
      __$$_NewsJsonCopyWithImpl<_$_NewsJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsJsonToJson(
      this,
    );
  }
}

abstract class _NewsJson implements NewsJson {
  const factory _NewsJson({final int? id, final AttributesJson? attributes}) =
      _$_NewsJson;

  factory _NewsJson.fromJson(Map<String, dynamic> json) = _$_NewsJson.fromJson;

  @override
  int? get id;
  @override
  AttributesJson? get attributes;
  @override
  @JsonKey(ignore: true)
  _$$_NewsJsonCopyWith<_$_NewsJson> get copyWith =>
      throw _privateConstructorUsedError;
}

AttributesJson _$AttributesJsonFromJson(Map<String, dynamic> json) {
  return _AttributesJson.fromJson(json);
}

/// @nodoc
mixin _$AttributesJson {
  String? get title => throw _privateConstructorUsedError;
  @ConvertStringToDateTime()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @ConvertStringToDateTime()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @ConvertStringToDateTime()
  DateTime? get publishedAt => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'Image')
  ImageJson? get images => throw _privateConstructorUsedError;
  LikeDataJson? get likes => throw _privateConstructorUsedError;
  AuthorJson? get author => throw _privateConstructorUsedError;
  CommentResponeJson? get comments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttributesJsonCopyWith<AttributesJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttributesJsonCopyWith<$Res> {
  factory $AttributesJsonCopyWith(
          AttributesJson value, $Res Function(AttributesJson) then) =
      _$AttributesJsonCopyWithImpl<$Res, AttributesJson>;
  @useResult
  $Res call(
      {String? title,
      @ConvertStringToDateTime() DateTime? createdAt,
      @ConvertStringToDateTime() DateTime? updatedAt,
      @ConvertStringToDateTime() DateTime? publishedAt,
      String? description,
      @JsonKey(name: 'Image') ImageJson? images,
      LikeDataJson? likes,
      AuthorJson? author,
      CommentResponeJson? comments});

  $ImageJsonCopyWith<$Res>? get images;
  $LikeDataJsonCopyWith<$Res>? get likes;
  $AuthorJsonCopyWith<$Res>? get author;
  $CommentResponeJsonCopyWith<$Res>? get comments;
}

/// @nodoc
class _$AttributesJsonCopyWithImpl<$Res, $Val extends AttributesJson>
    implements $AttributesJsonCopyWith<$Res> {
  _$AttributesJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? publishedAt = freezed,
    Object? description = freezed,
    Object? images = freezed,
    Object? likes = freezed,
    Object? author = freezed,
    Object? comments = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as ImageJson?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as LikeDataJson?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as AuthorJson?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as CommentResponeJson?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageJsonCopyWith<$Res>? get images {
    if (_value.images == null) {
      return null;
    }

    return $ImageJsonCopyWith<$Res>(_value.images!, (value) {
      return _then(_value.copyWith(images: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LikeDataJsonCopyWith<$Res>? get likes {
    if (_value.likes == null) {
      return null;
    }

    return $LikeDataJsonCopyWith<$Res>(_value.likes!, (value) {
      return _then(_value.copyWith(likes: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthorJsonCopyWith<$Res>? get author {
    if (_value.author == null) {
      return null;
    }

    return $AuthorJsonCopyWith<$Res>(_value.author!, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentResponeJsonCopyWith<$Res>? get comments {
    if (_value.comments == null) {
      return null;
    }

    return $CommentResponeJsonCopyWith<$Res>(_value.comments!, (value) {
      return _then(_value.copyWith(comments: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AttributesJsonCopyWith<$Res>
    implements $AttributesJsonCopyWith<$Res> {
  factory _$$_AttributesJsonCopyWith(
          _$_AttributesJson value, $Res Function(_$_AttributesJson) then) =
      __$$_AttributesJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      @ConvertStringToDateTime() DateTime? createdAt,
      @ConvertStringToDateTime() DateTime? updatedAt,
      @ConvertStringToDateTime() DateTime? publishedAt,
      String? description,
      @JsonKey(name: 'Image') ImageJson? images,
      LikeDataJson? likes,
      AuthorJson? author,
      CommentResponeJson? comments});

  @override
  $ImageJsonCopyWith<$Res>? get images;
  @override
  $LikeDataJsonCopyWith<$Res>? get likes;
  @override
  $AuthorJsonCopyWith<$Res>? get author;
  @override
  $CommentResponeJsonCopyWith<$Res>? get comments;
}

/// @nodoc
class __$$_AttributesJsonCopyWithImpl<$Res>
    extends _$AttributesJsonCopyWithImpl<$Res, _$_AttributesJson>
    implements _$$_AttributesJsonCopyWith<$Res> {
  __$$_AttributesJsonCopyWithImpl(
      _$_AttributesJson _value, $Res Function(_$_AttributesJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? publishedAt = freezed,
    Object? description = freezed,
    Object? images = freezed,
    Object? likes = freezed,
    Object? author = freezed,
    Object? comments = freezed,
  }) {
    return _then(_$_AttributesJson(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as ImageJson?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as LikeDataJson?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as AuthorJson?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as CommentResponeJson?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AttributesJson
    with DiagnosticableTreeMixin
    implements _AttributesJson {
  const _$_AttributesJson(
      {this.title,
      @ConvertStringToDateTime() this.createdAt,
      @ConvertStringToDateTime() this.updatedAt,
      @ConvertStringToDateTime() this.publishedAt,
      this.description,
      @JsonKey(name: 'Image') this.images,
      this.likes,
      this.author,
      this.comments});

  factory _$_AttributesJson.fromJson(Map<String, dynamic> json) =>
      _$$_AttributesJsonFromJson(json);

  @override
  final String? title;
  @override
  @ConvertStringToDateTime()
  final DateTime? createdAt;
  @override
  @ConvertStringToDateTime()
  final DateTime? updatedAt;
  @override
  @ConvertStringToDateTime()
  final DateTime? publishedAt;
  @override
  final String? description;
  @override
  @JsonKey(name: 'Image')
  final ImageJson? images;
  @override
  final LikeDataJson? likes;
  @override
  final AuthorJson? author;
  @override
  final CommentResponeJson? comments;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AttributesJson(title: $title, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, description: $description, images: $images, likes: $likes, author: $author, comments: $comments)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AttributesJson'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('publishedAt', publishedAt))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('images', images))
      ..add(DiagnosticsProperty('likes', likes))
      ..add(DiagnosticsProperty('author', author))
      ..add(DiagnosticsProperty('comments', comments));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AttributesJson &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.images, images) || other.images == images) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.comments, comments) ||
                other.comments == comments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, createdAt, updatedAt,
      publishedAt, description, images, likes, author, comments);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AttributesJsonCopyWith<_$_AttributesJson> get copyWith =>
      __$$_AttributesJsonCopyWithImpl<_$_AttributesJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AttributesJsonToJson(
      this,
    );
  }
}

abstract class _AttributesJson implements AttributesJson {
  const factory _AttributesJson(
      {final String? title,
      @ConvertStringToDateTime() final DateTime? createdAt,
      @ConvertStringToDateTime() final DateTime? updatedAt,
      @ConvertStringToDateTime() final DateTime? publishedAt,
      final String? description,
      @JsonKey(name: 'Image') final ImageJson? images,
      final LikeDataJson? likes,
      final AuthorJson? author,
      final CommentResponeJson? comments}) = _$_AttributesJson;

  factory _AttributesJson.fromJson(Map<String, dynamic> json) =
      _$_AttributesJson.fromJson;

  @override
  String? get title;
  @override
  @ConvertStringToDateTime()
  DateTime? get createdAt;
  @override
  @ConvertStringToDateTime()
  DateTime? get updatedAt;
  @override
  @ConvertStringToDateTime()
  DateTime? get publishedAt;
  @override
  String? get description;
  @override
  @JsonKey(name: 'Image')
  ImageJson? get images;
  @override
  LikeDataJson? get likes;
  @override
  AuthorJson? get author;
  @override
  CommentResponeJson? get comments;
  @override
  @JsonKey(ignore: true)
  _$$_AttributesJsonCopyWith<_$_AttributesJson> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageJson _$ImageJsonFromJson(Map<String, dynamic> json) {
  return _ImageJson.fromJson(json);
}

/// @nodoc
mixin _$ImageJson {
  List<ImageChildJson>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageJsonCopyWith<ImageJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageJsonCopyWith<$Res> {
  factory $ImageJsonCopyWith(ImageJson value, $Res Function(ImageJson) then) =
      _$ImageJsonCopyWithImpl<$Res, ImageJson>;
  @useResult
  $Res call({List<ImageChildJson>? data});
}

/// @nodoc
class _$ImageJsonCopyWithImpl<$Res, $Val extends ImageJson>
    implements $ImageJsonCopyWith<$Res> {
  _$ImageJsonCopyWithImpl(this._value, this._then);

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
              as List<ImageChildJson>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageJsonCopyWith<$Res> implements $ImageJsonCopyWith<$Res> {
  factory _$$_ImageJsonCopyWith(
          _$_ImageJson value, $Res Function(_$_ImageJson) then) =
      __$$_ImageJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ImageChildJson>? data});
}

/// @nodoc
class __$$_ImageJsonCopyWithImpl<$Res>
    extends _$ImageJsonCopyWithImpl<$Res, _$_ImageJson>
    implements _$$_ImageJsonCopyWith<$Res> {
  __$$_ImageJsonCopyWithImpl(
      _$_ImageJson _value, $Res Function(_$_ImageJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_ImageJson(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ImageChildJson>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageJson with DiagnosticableTreeMixin implements _ImageJson {
  const _$_ImageJson({final List<ImageChildJson>? data}) : _data = data;

  factory _$_ImageJson.fromJson(Map<String, dynamic> json) =>
      _$$_ImageJsonFromJson(json);

  final List<ImageChildJson>? _data;
  @override
  List<ImageChildJson>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageJson(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImageJson'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageJson &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageJsonCopyWith<_$_ImageJson> get copyWith =>
      __$$_ImageJsonCopyWithImpl<_$_ImageJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageJsonToJson(
      this,
    );
  }
}

abstract class _ImageJson implements ImageJson {
  const factory _ImageJson({final List<ImageChildJson>? data}) = _$_ImageJson;

  factory _ImageJson.fromJson(Map<String, dynamic> json) =
      _$_ImageJson.fromJson;

  @override
  List<ImageChildJson>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ImageJsonCopyWith<_$_ImageJson> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageChildJson _$ImageChildJsonFromJson(Map<String, dynamic> json) {
  return _ImageChildJson.fromJson(json);
}

/// @nodoc
mixin _$ImageChildJson {
  int? get id => throw _privateConstructorUsedError;
  ImageChildAttributesJson? get attributes =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageChildJsonCopyWith<ImageChildJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageChildJsonCopyWith<$Res> {
  factory $ImageChildJsonCopyWith(
          ImageChildJson value, $Res Function(ImageChildJson) then) =
      _$ImageChildJsonCopyWithImpl<$Res, ImageChildJson>;
  @useResult
  $Res call({int? id, ImageChildAttributesJson? attributes});

  $ImageChildAttributesJsonCopyWith<$Res>? get attributes;
}

/// @nodoc
class _$ImageChildJsonCopyWithImpl<$Res, $Val extends ImageChildJson>
    implements $ImageChildJsonCopyWith<$Res> {
  _$ImageChildJsonCopyWithImpl(this._value, this._then);

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
              as ImageChildAttributesJson?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageChildAttributesJsonCopyWith<$Res>? get attributes {
    if (_value.attributes == null) {
      return null;
    }

    return $ImageChildAttributesJsonCopyWith<$Res>(_value.attributes!, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ImageChildJsonCopyWith<$Res>
    implements $ImageChildJsonCopyWith<$Res> {
  factory _$$_ImageChildJsonCopyWith(
          _$_ImageChildJson value, $Res Function(_$_ImageChildJson) then) =
      __$$_ImageChildJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, ImageChildAttributesJson? attributes});

  @override
  $ImageChildAttributesJsonCopyWith<$Res>? get attributes;
}

/// @nodoc
class __$$_ImageChildJsonCopyWithImpl<$Res>
    extends _$ImageChildJsonCopyWithImpl<$Res, _$_ImageChildJson>
    implements _$$_ImageChildJsonCopyWith<$Res> {
  __$$_ImageChildJsonCopyWithImpl(
      _$_ImageChildJson _value, $Res Function(_$_ImageChildJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$_ImageChildJson(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as ImageChildAttributesJson?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageChildJson
    with DiagnosticableTreeMixin
    implements _ImageChildJson {
  const _$_ImageChildJson({this.id, this.attributes});

  factory _$_ImageChildJson.fromJson(Map<String, dynamic> json) =>
      _$$_ImageChildJsonFromJson(json);

  @override
  final int? id;
  @override
  final ImageChildAttributesJson? attributes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageChildJson(id: $id, attributes: $attributes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImageChildJson'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('attributes', attributes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageChildJson &&
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
  _$$_ImageChildJsonCopyWith<_$_ImageChildJson> get copyWith =>
      __$$_ImageChildJsonCopyWithImpl<_$_ImageChildJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageChildJsonToJson(
      this,
    );
  }
}

abstract class _ImageChildJson implements ImageChildJson {
  const factory _ImageChildJson(
      {final int? id,
      final ImageChildAttributesJson? attributes}) = _$_ImageChildJson;

  factory _ImageChildJson.fromJson(Map<String, dynamic> json) =
      _$_ImageChildJson.fromJson;

  @override
  int? get id;
  @override
  ImageChildAttributesJson? get attributes;
  @override
  @JsonKey(ignore: true)
  _$$_ImageChildJsonCopyWith<_$_ImageChildJson> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageChildAttributesJson _$ImageChildAttributesJsonFromJson(
    Map<String, dynamic> json) {
  return _ImageChildAttributesJson.fromJson(json);
}

/// @nodoc
mixin _$ImageChildAttributesJson {
  String? get name => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageChildAttributesJsonCopyWith<ImageChildAttributesJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageChildAttributesJsonCopyWith<$Res> {
  factory $ImageChildAttributesJsonCopyWith(ImageChildAttributesJson value,
          $Res Function(ImageChildAttributesJson) then) =
      _$ImageChildAttributesJsonCopyWithImpl<$Res, ImageChildAttributesJson>;
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class _$ImageChildAttributesJsonCopyWithImpl<$Res,
        $Val extends ImageChildAttributesJson>
    implements $ImageChildAttributesJsonCopyWith<$Res> {
  _$ImageChildAttributesJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageChildAttributesJsonCopyWith<$Res>
    implements $ImageChildAttributesJsonCopyWith<$Res> {
  factory _$$_ImageChildAttributesJsonCopyWith(
          _$_ImageChildAttributesJson value,
          $Res Function(_$_ImageChildAttributesJson) then) =
      __$$_ImageChildAttributesJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class __$$_ImageChildAttributesJsonCopyWithImpl<$Res>
    extends _$ImageChildAttributesJsonCopyWithImpl<$Res,
        _$_ImageChildAttributesJson>
    implements _$$_ImageChildAttributesJsonCopyWith<$Res> {
  __$$_ImageChildAttributesJsonCopyWithImpl(_$_ImageChildAttributesJson _value,
      $Res Function(_$_ImageChildAttributesJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_ImageChildAttributesJson(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageChildAttributesJson
    with DiagnosticableTreeMixin
    implements _ImageChildAttributesJson {
  const _$_ImageChildAttributesJson({this.name, this.url});

  factory _$_ImageChildAttributesJson.fromJson(Map<String, dynamic> json) =>
      _$$_ImageChildAttributesJsonFromJson(json);

  @override
  final String? name;
  @override
  final String? url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageChildAttributesJson(name: $name, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImageChildAttributesJson'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageChildAttributesJson &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageChildAttributesJsonCopyWith<_$_ImageChildAttributesJson>
      get copyWith => __$$_ImageChildAttributesJsonCopyWithImpl<
          _$_ImageChildAttributesJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageChildAttributesJsonToJson(
      this,
    );
  }
}

abstract class _ImageChildAttributesJson implements ImageChildAttributesJson {
  const factory _ImageChildAttributesJson(
      {final String? name, final String? url}) = _$_ImageChildAttributesJson;

  factory _ImageChildAttributesJson.fromJson(Map<String, dynamic> json) =
      _$_ImageChildAttributesJson.fromJson;

  @override
  String? get name;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$_ImageChildAttributesJsonCopyWith<_$_ImageChildAttributesJson>
      get copyWith => throw _privateConstructorUsedError;
}

LikeDataJson _$LikeDataJsonFromJson(Map<String, dynamic> json) {
  return _LikeDataJson.fromJson(json);
}

/// @nodoc
mixin _$LikeDataJson {
  List<LikeDataJsonData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikeDataJsonCopyWith<LikeDataJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeDataJsonCopyWith<$Res> {
  factory $LikeDataJsonCopyWith(
          LikeDataJson value, $Res Function(LikeDataJson) then) =
      _$LikeDataJsonCopyWithImpl<$Res, LikeDataJson>;
  @useResult
  $Res call({List<LikeDataJsonData>? data});
}

/// @nodoc
class _$LikeDataJsonCopyWithImpl<$Res, $Val extends LikeDataJson>
    implements $LikeDataJsonCopyWith<$Res> {
  _$LikeDataJsonCopyWithImpl(this._value, this._then);

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
              as List<LikeDataJsonData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LikeDataJsonCopyWith<$Res>
    implements $LikeDataJsonCopyWith<$Res> {
  factory _$$_LikeDataJsonCopyWith(
          _$_LikeDataJson value, $Res Function(_$_LikeDataJson) then) =
      __$$_LikeDataJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LikeDataJsonData>? data});
}

/// @nodoc
class __$$_LikeDataJsonCopyWithImpl<$Res>
    extends _$LikeDataJsonCopyWithImpl<$Res, _$_LikeDataJson>
    implements _$$_LikeDataJsonCopyWith<$Res> {
  __$$_LikeDataJsonCopyWithImpl(
      _$_LikeDataJson _value, $Res Function(_$_LikeDataJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_LikeDataJson(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LikeDataJsonData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LikeDataJson with DiagnosticableTreeMixin implements _LikeDataJson {
  const _$_LikeDataJson({final List<LikeDataJsonData>? data}) : _data = data;

  factory _$_LikeDataJson.fromJson(Map<String, dynamic> json) =>
      _$$_LikeDataJsonFromJson(json);

  final List<LikeDataJsonData>? _data;
  @override
  List<LikeDataJsonData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LikeDataJson(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LikeDataJson'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LikeDataJson &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LikeDataJsonCopyWith<_$_LikeDataJson> get copyWith =>
      __$$_LikeDataJsonCopyWithImpl<_$_LikeDataJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LikeDataJsonToJson(
      this,
    );
  }
}

abstract class _LikeDataJson implements LikeDataJson {
  const factory _LikeDataJson({final List<LikeDataJsonData>? data}) =
      _$_LikeDataJson;

  factory _LikeDataJson.fromJson(Map<String, dynamic> json) =
      _$_LikeDataJson.fromJson;

  @override
  List<LikeDataJsonData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_LikeDataJsonCopyWith<_$_LikeDataJson> get copyWith =>
      throw _privateConstructorUsedError;
}

LikeDataJsonData _$LikeDataJsonDataFromJson(Map<String, dynamic> json) {
  return _LikeDataJsonData.fromJson(json);
}

/// @nodoc
mixin _$LikeDataJsonData {
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikeDataJsonDataCopyWith<LikeDataJsonData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeDataJsonDataCopyWith<$Res> {
  factory $LikeDataJsonDataCopyWith(
          LikeDataJsonData value, $Res Function(LikeDataJsonData) then) =
      _$LikeDataJsonDataCopyWithImpl<$Res, LikeDataJsonData>;
  @useResult
  $Res call({int? id});
}

/// @nodoc
class _$LikeDataJsonDataCopyWithImpl<$Res, $Val extends LikeDataJsonData>
    implements $LikeDataJsonDataCopyWith<$Res> {
  _$LikeDataJsonDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LikeDataJsonDataCopyWith<$Res>
    implements $LikeDataJsonDataCopyWith<$Res> {
  factory _$$_LikeDataJsonDataCopyWith(
          _$_LikeDataJsonData value, $Res Function(_$_LikeDataJsonData) then) =
      __$$_LikeDataJsonDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id});
}

/// @nodoc
class __$$_LikeDataJsonDataCopyWithImpl<$Res>
    extends _$LikeDataJsonDataCopyWithImpl<$Res, _$_LikeDataJsonData>
    implements _$$_LikeDataJsonDataCopyWith<$Res> {
  __$$_LikeDataJsonDataCopyWithImpl(
      _$_LikeDataJsonData _value, $Res Function(_$_LikeDataJsonData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_LikeDataJsonData(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LikeDataJsonData
    with DiagnosticableTreeMixin
    implements _LikeDataJsonData {
  const _$_LikeDataJsonData({this.id});

  factory _$_LikeDataJsonData.fromJson(Map<String, dynamic> json) =>
      _$$_LikeDataJsonDataFromJson(json);

  @override
  final int? id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LikeDataJsonData(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LikeDataJsonData'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LikeDataJsonData &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LikeDataJsonDataCopyWith<_$_LikeDataJsonData> get copyWith =>
      __$$_LikeDataJsonDataCopyWithImpl<_$_LikeDataJsonData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LikeDataJsonDataToJson(
      this,
    );
  }
}

abstract class _LikeDataJsonData implements LikeDataJsonData {
  const factory _LikeDataJsonData({final int? id}) = _$_LikeDataJsonData;

  factory _LikeDataJsonData.fromJson(Map<String, dynamic> json) =
      _$_LikeDataJsonData.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$_LikeDataJsonDataCopyWith<_$_LikeDataJsonData> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthorJson _$AuthorJsonFromJson(Map<String, dynamic> json) {
  return _AuthorJson.fromJson(json);
}

/// @nodoc
mixin _$AuthorJson {
  AuthorJsonData? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorJsonCopyWith<AuthorJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorJsonCopyWith<$Res> {
  factory $AuthorJsonCopyWith(
          AuthorJson value, $Res Function(AuthorJson) then) =
      _$AuthorJsonCopyWithImpl<$Res, AuthorJson>;
  @useResult
  $Res call({AuthorJsonData? data});

  $AuthorJsonDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$AuthorJsonCopyWithImpl<$Res, $Val extends AuthorJson>
    implements $AuthorJsonCopyWith<$Res> {
  _$AuthorJsonCopyWithImpl(this._value, this._then);

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
              as AuthorJsonData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthorJsonDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $AuthorJsonDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AuthorJsonCopyWith<$Res>
    implements $AuthorJsonCopyWith<$Res> {
  factory _$$_AuthorJsonCopyWith(
          _$_AuthorJson value, $Res Function(_$_AuthorJson) then) =
      __$$_AuthorJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthorJsonData? data});

  @override
  $AuthorJsonDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_AuthorJsonCopyWithImpl<$Res>
    extends _$AuthorJsonCopyWithImpl<$Res, _$_AuthorJson>
    implements _$$_AuthorJsonCopyWith<$Res> {
  __$$_AuthorJsonCopyWithImpl(
      _$_AuthorJson _value, $Res Function(_$_AuthorJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_AuthorJson(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AuthorJsonData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthorJson with DiagnosticableTreeMixin implements _AuthorJson {
  const _$_AuthorJson({this.data});

  factory _$_AuthorJson.fromJson(Map<String, dynamic> json) =>
      _$$_AuthorJsonFromJson(json);

  @override
  final AuthorJsonData? data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthorJson(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthorJson'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthorJson &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthorJsonCopyWith<_$_AuthorJson> get copyWith =>
      __$$_AuthorJsonCopyWithImpl<_$_AuthorJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthorJsonToJson(
      this,
    );
  }
}

abstract class _AuthorJson implements AuthorJson {
  const factory _AuthorJson({final AuthorJsonData? data}) = _$_AuthorJson;

  factory _AuthorJson.fromJson(Map<String, dynamic> json) =
      _$_AuthorJson.fromJson;

  @override
  AuthorJsonData? get data;
  @override
  @JsonKey(ignore: true)
  _$$_AuthorJsonCopyWith<_$_AuthorJson> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthorJsonData _$AuthorJsonDataFromJson(Map<String, dynamic> json) {
  return _AuthorJsonData.fromJson(json);
}

/// @nodoc
mixin _$AuthorJsonData {
  int? get id => throw _privateConstructorUsedError;
  UserJson? get attributes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorJsonDataCopyWith<AuthorJsonData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorJsonDataCopyWith<$Res> {
  factory $AuthorJsonDataCopyWith(
          AuthorJsonData value, $Res Function(AuthorJsonData) then) =
      _$AuthorJsonDataCopyWithImpl<$Res, AuthorJsonData>;
  @useResult
  $Res call({int? id, UserJson? attributes});

  $UserJsonCopyWith<$Res>? get attributes;
}

/// @nodoc
class _$AuthorJsonDataCopyWithImpl<$Res, $Val extends AuthorJsonData>
    implements $AuthorJsonDataCopyWith<$Res> {
  _$AuthorJsonDataCopyWithImpl(this._value, this._then);

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
              as UserJson?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserJsonCopyWith<$Res>? get attributes {
    if (_value.attributes == null) {
      return null;
    }

    return $UserJsonCopyWith<$Res>(_value.attributes!, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AuthorJsonDataCopyWith<$Res>
    implements $AuthorJsonDataCopyWith<$Res> {
  factory _$$_AuthorJsonDataCopyWith(
          _$_AuthorJsonData value, $Res Function(_$_AuthorJsonData) then) =
      __$$_AuthorJsonDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, UserJson? attributes});

  @override
  $UserJsonCopyWith<$Res>? get attributes;
}

/// @nodoc
class __$$_AuthorJsonDataCopyWithImpl<$Res>
    extends _$AuthorJsonDataCopyWithImpl<$Res, _$_AuthorJsonData>
    implements _$$_AuthorJsonDataCopyWith<$Res> {
  __$$_AuthorJsonDataCopyWithImpl(
      _$_AuthorJsonData _value, $Res Function(_$_AuthorJsonData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$_AuthorJsonData(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as UserJson?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthorJsonData
    with DiagnosticableTreeMixin
    implements _AuthorJsonData {
  const _$_AuthorJsonData({this.id, this.attributes});

  factory _$_AuthorJsonData.fromJson(Map<String, dynamic> json) =>
      _$$_AuthorJsonDataFromJson(json);

  @override
  final int? id;
  @override
  final UserJson? attributes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthorJsonData(id: $id, attributes: $attributes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthorJsonData'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('attributes', attributes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthorJsonData &&
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
  _$$_AuthorJsonDataCopyWith<_$_AuthorJsonData> get copyWith =>
      __$$_AuthorJsonDataCopyWithImpl<_$_AuthorJsonData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthorJsonDataToJson(
      this,
    );
  }
}

abstract class _AuthorJsonData implements AuthorJsonData {
  const factory _AuthorJsonData({final int? id, final UserJson? attributes}) =
      _$_AuthorJsonData;

  factory _AuthorJsonData.fromJson(Map<String, dynamic> json) =
      _$_AuthorJsonData.fromJson;

  @override
  int? get id;
  @override
  UserJson? get attributes;
  @override
  @JsonKey(ignore: true)
  _$$_AuthorJsonDataCopyWith<_$_AuthorJsonData> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentResponeJson _$CommentResponeJsonFromJson(Map<String, dynamic> json) {
  return _CommentResponeJson.fromJson(json);
}

/// @nodoc
mixin _$CommentResponeJson {
  List<CommentJson>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentResponeJsonCopyWith<CommentResponeJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentResponeJsonCopyWith<$Res> {
  factory $CommentResponeJsonCopyWith(
          CommentResponeJson value, $Res Function(CommentResponeJson) then) =
      _$CommentResponeJsonCopyWithImpl<$Res, CommentResponeJson>;
  @useResult
  $Res call({List<CommentJson>? data});
}

/// @nodoc
class _$CommentResponeJsonCopyWithImpl<$Res, $Val extends CommentResponeJson>
    implements $CommentResponeJsonCopyWith<$Res> {
  _$CommentResponeJsonCopyWithImpl(this._value, this._then);

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
              as List<CommentJson>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentResponeJsonCopyWith<$Res>
    implements $CommentResponeJsonCopyWith<$Res> {
  factory _$$_CommentResponeJsonCopyWith(_$_CommentResponeJson value,
          $Res Function(_$_CommentResponeJson) then) =
      __$$_CommentResponeJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CommentJson>? data});
}

/// @nodoc
class __$$_CommentResponeJsonCopyWithImpl<$Res>
    extends _$CommentResponeJsonCopyWithImpl<$Res, _$_CommentResponeJson>
    implements _$$_CommentResponeJsonCopyWith<$Res> {
  __$$_CommentResponeJsonCopyWithImpl(
      _$_CommentResponeJson _value, $Res Function(_$_CommentResponeJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_CommentResponeJson(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CommentJson>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentResponeJson
    with DiagnosticableTreeMixin
    implements _CommentResponeJson {
  const _$_CommentResponeJson({final List<CommentJson>? data}) : _data = data;

  factory _$_CommentResponeJson.fromJson(Map<String, dynamic> json) =>
      _$$_CommentResponeJsonFromJson(json);

  final List<CommentJson>? _data;
  @override
  List<CommentJson>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CommentResponeJson(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CommentResponeJson'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentResponeJson &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentResponeJsonCopyWith<_$_CommentResponeJson> get copyWith =>
      __$$_CommentResponeJsonCopyWithImpl<_$_CommentResponeJson>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentResponeJsonToJson(
      this,
    );
  }
}

abstract class _CommentResponeJson implements CommentResponeJson {
  const factory _CommentResponeJson({final List<CommentJson>? data}) =
      _$_CommentResponeJson;

  factory _CommentResponeJson.fromJson(Map<String, dynamic> json) =
      _$_CommentResponeJson.fromJson;

  @override
  List<CommentJson>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_CommentResponeJsonCopyWith<_$_CommentResponeJson> get copyWith =>
      throw _privateConstructorUsedError;
}
