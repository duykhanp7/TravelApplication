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
      @JsonKey(name: 'Image') ImageJson? images});

  $ImageJsonCopyWith<$Res>? get images;
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
      @JsonKey(name: 'Image') ImageJson? images});

  @override
  $ImageJsonCopyWith<$Res>? get images;
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
      @JsonKey(name: 'Image') this.images});

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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AttributesJson(title: $title, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, description: $description, images: $images)';
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
      ..add(DiagnosticsProperty('images', images));
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
            (identical(other.images, images) || other.images == images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, createdAt, updatedAt,
      publishedAt, description, images);

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
      @JsonKey(name: 'Image') final ImageJson? images}) = _$_AttributesJson;

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
