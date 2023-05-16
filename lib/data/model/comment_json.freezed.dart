// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentJson _$CommentJsonFromJson(Map<String, dynamic> json) {
  return _CommentJson.fromJson(json);
}

/// @nodoc
mixin _$CommentJson {
  int? get id => throw _privateConstructorUsedError;
  CommentAttributes? get attributes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentJsonCopyWith<CommentJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentJsonCopyWith<$Res> {
  factory $CommentJsonCopyWith(
          CommentJson value, $Res Function(CommentJson) then) =
      _$CommentJsonCopyWithImpl<$Res, CommentJson>;
  @useResult
  $Res call({int? id, CommentAttributes? attributes});

  $CommentAttributesCopyWith<$Res>? get attributes;
}

/// @nodoc
class _$CommentJsonCopyWithImpl<$Res, $Val extends CommentJson>
    implements $CommentJsonCopyWith<$Res> {
  _$CommentJsonCopyWithImpl(this._value, this._then);

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
              as CommentAttributes?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentAttributesCopyWith<$Res>? get attributes {
    if (_value.attributes == null) {
      return null;
    }

    return $CommentAttributesCopyWith<$Res>(_value.attributes!, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CommentJsonCopyWith<$Res>
    implements $CommentJsonCopyWith<$Res> {
  factory _$$_CommentJsonCopyWith(
          _$_CommentJson value, $Res Function(_$_CommentJson) then) =
      __$$_CommentJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, CommentAttributes? attributes});

  @override
  $CommentAttributesCopyWith<$Res>? get attributes;
}

/// @nodoc
class __$$_CommentJsonCopyWithImpl<$Res>
    extends _$CommentJsonCopyWithImpl<$Res, _$_CommentJson>
    implements _$$_CommentJsonCopyWith<$Res> {
  __$$_CommentJsonCopyWithImpl(
      _$_CommentJson _value, $Res Function(_$_CommentJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$_CommentJson(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as CommentAttributes?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentJson with DiagnosticableTreeMixin implements _CommentJson {
  const _$_CommentJson({this.id, this.attributes});

  factory _$_CommentJson.fromJson(Map<String, dynamic> json) =>
      _$$_CommentJsonFromJson(json);

  @override
  final int? id;
  @override
  final CommentAttributes? attributes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CommentJson(id: $id, attributes: $attributes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CommentJson'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('attributes', attributes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentJson &&
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
  _$$_CommentJsonCopyWith<_$_CommentJson> get copyWith =>
      __$$_CommentJsonCopyWithImpl<_$_CommentJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentJsonToJson(
      this,
    );
  }
}

abstract class _CommentJson implements CommentJson {
  const factory _CommentJson(
      {final int? id, final CommentAttributes? attributes}) = _$_CommentJson;

  factory _CommentJson.fromJson(Map<String, dynamic> json) =
      _$_CommentJson.fromJson;

  @override
  int? get id;
  @override
  CommentAttributes? get attributes;
  @override
  @JsonKey(ignore: true)
  _$$_CommentJsonCopyWith<_$_CommentJson> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentAttributes _$CommentAttributesFromJson(Map<String, dynamic> json) {
  return _CommentAttributes.fromJson(json);
}

/// @nodoc
mixin _$CommentAttributes {
  String? get content => throw _privateConstructorUsedError;
  @ConvertStringToDateTime()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @ConvertStringToDateTime()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @ConvertStringToDateTime()
  DateTime? get publishedAt => throw _privateConstructorUsedError;
  dynamic get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentAttributesCopyWith<CommentAttributes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentAttributesCopyWith<$Res> {
  factory $CommentAttributesCopyWith(
          CommentAttributes value, $Res Function(CommentAttributes) then) =
      _$CommentAttributesCopyWithImpl<$Res, CommentAttributes>;
  @useResult
  $Res call(
      {String? content,
      @ConvertStringToDateTime() DateTime? createdAt,
      @ConvertStringToDateTime() DateTime? updatedAt,
      @ConvertStringToDateTime() DateTime? publishedAt,
      dynamic user});
}

/// @nodoc
class _$CommentAttributesCopyWithImpl<$Res, $Val extends CommentAttributes>
    implements $CommentAttributesCopyWith<$Res> {
  _$CommentAttributesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? publishedAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
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
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentAttributesCopyWith<$Res>
    implements $CommentAttributesCopyWith<$Res> {
  factory _$$_CommentAttributesCopyWith(_$_CommentAttributes value,
          $Res Function(_$_CommentAttributes) then) =
      __$$_CommentAttributesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? content,
      @ConvertStringToDateTime() DateTime? createdAt,
      @ConvertStringToDateTime() DateTime? updatedAt,
      @ConvertStringToDateTime() DateTime? publishedAt,
      dynamic user});
}

/// @nodoc
class __$$_CommentAttributesCopyWithImpl<$Res>
    extends _$CommentAttributesCopyWithImpl<$Res, _$_CommentAttributes>
    implements _$$_CommentAttributesCopyWith<$Res> {
  __$$_CommentAttributesCopyWithImpl(
      _$_CommentAttributes _value, $Res Function(_$_CommentAttributes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? publishedAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_CommentAttributes(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
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
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentAttributes
    with DiagnosticableTreeMixin
    implements _CommentAttributes {
  const _$_CommentAttributes(
      {this.content,
      @ConvertStringToDateTime() this.createdAt,
      @ConvertStringToDateTime() this.updatedAt,
      @ConvertStringToDateTime() this.publishedAt,
      this.user});

  factory _$_CommentAttributes.fromJson(Map<String, dynamic> json) =>
      _$$_CommentAttributesFromJson(json);

  @override
  final String? content;
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
  final dynamic user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CommentAttributes(content: $content, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CommentAttributes'))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('publishedAt', publishedAt))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentAttributes &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content, createdAt, updatedAt,
      publishedAt, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentAttributesCopyWith<_$_CommentAttributes> get copyWith =>
      __$$_CommentAttributesCopyWithImpl<_$_CommentAttributes>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentAttributesToJson(
      this,
    );
  }
}

abstract class _CommentAttributes implements CommentAttributes {
  const factory _CommentAttributes(
      {final String? content,
      @ConvertStringToDateTime() final DateTime? createdAt,
      @ConvertStringToDateTime() final DateTime? updatedAt,
      @ConvertStringToDateTime() final DateTime? publishedAt,
      final dynamic user}) = _$_CommentAttributes;

  factory _CommentAttributes.fromJson(Map<String, dynamic> json) =
      _$_CommentAttributes.fromJson;

  @override
  String? get content;
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
  dynamic get user;
  @override
  @JsonKey(ignore: true)
  _$$_CommentAttributesCopyWith<_$_CommentAttributes> get copyWith =>
      throw _privateConstructorUsedError;
}
