// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'destination_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DestinationJson _$DestinationJsonFromJson(Map<String, dynamic> json) {
  return _DestinationJson.fromJson(json);
}

/// @nodoc
mixin _$DestinationJson {
  int? get id => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DestinationJsonCopyWith<DestinationJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DestinationJsonCopyWith<$Res> {
  factory $DestinationJsonCopyWith(
          DestinationJson value, $Res Function(DestinationJson) then) =
      _$DestinationJsonCopyWithImpl<$Res, DestinationJson>;
  @useResult
  $Res call({int? id, String? url, String? name});
}

/// @nodoc
class _$DestinationJsonCopyWithImpl<$Res, $Val extends DestinationJson>
    implements $DestinationJsonCopyWith<$Res> {
  _$DestinationJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DestinationJsonCopyWith<$Res>
    implements $DestinationJsonCopyWith<$Res> {
  factory _$$_DestinationJsonCopyWith(
          _$_DestinationJson value, $Res Function(_$_DestinationJson) then) =
      __$$_DestinationJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? url, String? name});
}

/// @nodoc
class __$$_DestinationJsonCopyWithImpl<$Res>
    extends _$DestinationJsonCopyWithImpl<$Res, _$_DestinationJson>
    implements _$$_DestinationJsonCopyWith<$Res> {
  __$$_DestinationJsonCopyWithImpl(
      _$_DestinationJson _value, $Res Function(_$_DestinationJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_DestinationJson(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DestinationJson
    with DiagnosticableTreeMixin
    implements _DestinationJson {
  const _$_DestinationJson({this.id, this.url, this.name});

  factory _$_DestinationJson.fromJson(Map<String, dynamic> json) =>
      _$$_DestinationJsonFromJson(json);

  @override
  final int? id;
  @override
  final String? url;
  @override
  final String? name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DestinationJson(id: $id, url: $url, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DestinationJson'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DestinationJson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, url, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DestinationJsonCopyWith<_$_DestinationJson> get copyWith =>
      __$$_DestinationJsonCopyWithImpl<_$_DestinationJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DestinationJsonToJson(
      this,
    );
  }
}

abstract class _DestinationJson implements DestinationJson {
  const factory _DestinationJson(
      {final int? id,
      final String? url,
      final String? name}) = _$_DestinationJson;

  factory _DestinationJson.fromJson(Map<String, dynamic> json) =
      _$_DestinationJson.fromJson;

  @override
  int? get id;
  @override
  String? get url;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_DestinationJsonCopyWith<_$_DestinationJson> get copyWith =>
      throw _privateConstructorUsedError;
}
