// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OnboardingJson _$OnboardingJsonFromJson(Map<String, dynamic> json) {
  return _OnboardingJson.fromJson(json);
}

/// @nodoc
mixin _$OnboardingJson {
  String get description => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnboardingJsonCopyWith<OnboardingJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingJsonCopyWith<$Res> {
  factory $OnboardingJsonCopyWith(
          OnboardingJson value, $Res Function(OnboardingJson) then) =
      _$OnboardingJsonCopyWithImpl<$Res, OnboardingJson>;
  @useResult
  $Res call({String description, String content});
}

/// @nodoc
class _$OnboardingJsonCopyWithImpl<$Res, $Val extends OnboardingJson>
    implements $OnboardingJsonCopyWith<$Res> {
  _$OnboardingJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OnboardingJsonCopyWith<$Res>
    implements $OnboardingJsonCopyWith<$Res> {
  factory _$$_OnboardingJsonCopyWith(
          _$_OnboardingJson value, $Res Function(_$_OnboardingJson) then) =
      __$$_OnboardingJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, String content});
}

/// @nodoc
class __$$_OnboardingJsonCopyWithImpl<$Res>
    extends _$OnboardingJsonCopyWithImpl<$Res, _$_OnboardingJson>
    implements _$$_OnboardingJsonCopyWith<$Res> {
  __$$_OnboardingJsonCopyWithImpl(
      _$_OnboardingJson _value, $Res Function(_$_OnboardingJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? content = null,
  }) {
    return _then(_$_OnboardingJson(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OnboardingJson implements _OnboardingJson {
  const _$_OnboardingJson({required this.description, required this.content});

  factory _$_OnboardingJson.fromJson(Map<String, dynamic> json) =>
      _$$_OnboardingJsonFromJson(json);

  @override
  final String description;
  @override
  final String content;

  @override
  String toString() {
    return 'OnboardingJson(description: $description, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnboardingJson &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, description, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnboardingJsonCopyWith<_$_OnboardingJson> get copyWith =>
      __$$_OnboardingJsonCopyWithImpl<_$_OnboardingJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OnboardingJsonToJson(
      this,
    );
  }
}

abstract class _OnboardingJson implements OnboardingJson {
  const factory _OnboardingJson(
      {required final String description,
      required final String content}) = _$_OnboardingJson;

  factory _OnboardingJson.fromJson(Map<String, dynamic> json) =
      _$_OnboardingJson.fromJson;

  @override
  String get description;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_OnboardingJsonCopyWith<_$_OnboardingJson> get copyWith =>
      throw _privateConstructorUsedError;
}
