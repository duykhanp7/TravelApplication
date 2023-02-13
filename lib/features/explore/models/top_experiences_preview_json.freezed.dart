// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_experiences_preview_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TopExperienceJson _$TopExperienceJsonFromJson(Map<String, dynamic> json) {
  return _TopExperienceJson.fromJson(json);
}

/// @nodoc
mixin _$TopExperienceJson {
  String? get guideImageUrl => throw _privateConstructorUsedError;
  String? get destinationImageUrl => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopExperienceJsonCopyWith<TopExperienceJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopExperienceJsonCopyWith<$Res> {
  factory $TopExperienceJsonCopyWith(
          TopExperienceJson value, $Res Function(TopExperienceJson) then) =
      _$TopExperienceJsonCopyWithImpl<$Res, TopExperienceJson>;
  @useResult
  $Res call(
      {String? guideImageUrl,
      String? destinationImageUrl,
      String? name,
      String? description,
      String? address});
}

/// @nodoc
class _$TopExperienceJsonCopyWithImpl<$Res, $Val extends TopExperienceJson>
    implements $TopExperienceJsonCopyWith<$Res> {
  _$TopExperienceJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guideImageUrl = freezed,
    Object? destinationImageUrl = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      guideImageUrl: freezed == guideImageUrl
          ? _value.guideImageUrl
          : guideImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationImageUrl: freezed == destinationImageUrl
          ? _value.destinationImageUrl
          : destinationImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TopExperienceJsonCopyWith<$Res>
    implements $TopExperienceJsonCopyWith<$Res> {
  factory _$$_TopExperienceJsonCopyWith(_$_TopExperienceJson value,
          $Res Function(_$_TopExperienceJson) then) =
      __$$_TopExperienceJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? guideImageUrl,
      String? destinationImageUrl,
      String? name,
      String? description,
      String? address});
}

/// @nodoc
class __$$_TopExperienceJsonCopyWithImpl<$Res>
    extends _$TopExperienceJsonCopyWithImpl<$Res, _$_TopExperienceJson>
    implements _$$_TopExperienceJsonCopyWith<$Res> {
  __$$_TopExperienceJsonCopyWithImpl(
      _$_TopExperienceJson _value, $Res Function(_$_TopExperienceJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guideImageUrl = freezed,
    Object? destinationImageUrl = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? address = freezed,
  }) {
    return _then(_$_TopExperienceJson(
      guideImageUrl: freezed == guideImageUrl
          ? _value.guideImageUrl
          : guideImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationImageUrl: freezed == destinationImageUrl
          ? _value.destinationImageUrl
          : destinationImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TopExperienceJson
    with DiagnosticableTreeMixin
    implements _TopExperienceJson {
  const _$_TopExperienceJson(
      {this.guideImageUrl,
      this.destinationImageUrl,
      this.name,
      this.description,
      this.address});

  factory _$_TopExperienceJson.fromJson(Map<String, dynamic> json) =>
      _$$_TopExperienceJsonFromJson(json);

  @override
  final String? guideImageUrl;
  @override
  final String? destinationImageUrl;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? address;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TopExperienceJson(guideImageUrl: $guideImageUrl, destinationImageUrl: $destinationImageUrl, name: $name, description: $description, address: $address)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TopExperienceJson'))
      ..add(DiagnosticsProperty('guideImageUrl', guideImageUrl))
      ..add(DiagnosticsProperty('destinationImageUrl', destinationImageUrl))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('address', address));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopExperienceJson &&
            (identical(other.guideImageUrl, guideImageUrl) ||
                other.guideImageUrl == guideImageUrl) &&
            (identical(other.destinationImageUrl, destinationImageUrl) ||
                other.destinationImageUrl == destinationImageUrl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, guideImageUrl,
      destinationImageUrl, name, description, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TopExperienceJsonCopyWith<_$_TopExperienceJson> get copyWith =>
      __$$_TopExperienceJsonCopyWithImpl<_$_TopExperienceJson>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TopExperienceJsonToJson(
      this,
    );
  }
}

abstract class _TopExperienceJson implements TopExperienceJson {
  const factory _TopExperienceJson(
      {final String? guideImageUrl,
      final String? destinationImageUrl,
      final String? name,
      final String? description,
      final String? address}) = _$_TopExperienceJson;

  factory _TopExperienceJson.fromJson(Map<String, dynamic> json) =
      _$_TopExperienceJson.fromJson;

  @override
  String? get guideImageUrl;
  @override
  String? get destinationImageUrl;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get address;
  @override
  @JsonKey(ignore: true)
  _$$_TopExperienceJsonCopyWith<_$_TopExperienceJson> get copyWith =>
      throw _privateConstructorUsedError;
}
