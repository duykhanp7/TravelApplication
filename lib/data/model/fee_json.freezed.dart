// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fee_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeeJson _$FeeJsonFromJson(Map<String, dynamic> json) {
  return _FeeJson.fromJson(json);
}

/// @nodoc
mixin _$FeeJson {
  @JsonKey(name: 'number_of_traveler')
  String? get numberOfTraveler => throw _privateConstructorUsedError;
  String? get fee => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeeJsonCopyWith<FeeJson> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeeJsonCopyWith<$Res> {
  factory $FeeJsonCopyWith(FeeJson value, $Res Function(FeeJson) then) =
      _$FeeJsonCopyWithImpl<$Res, FeeJson>;
  @useResult
  $Res call(
      {@JsonKey(name: 'number_of_traveler') String? numberOfTraveler,
      String? fee});
}

/// @nodoc
class _$FeeJsonCopyWithImpl<$Res, $Val extends FeeJson>
    implements $FeeJsonCopyWith<$Res> {
  _$FeeJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberOfTraveler = freezed,
    Object? fee = freezed,
  }) {
    return _then(_value.copyWith(
      numberOfTraveler: freezed == numberOfTraveler
          ? _value.numberOfTraveler
          : numberOfTraveler // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FeeJsonCopyWith<$Res> implements $FeeJsonCopyWith<$Res> {
  factory _$$_FeeJsonCopyWith(
          _$_FeeJson value, $Res Function(_$_FeeJson) then) =
      __$$_FeeJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'number_of_traveler') String? numberOfTraveler,
      String? fee});
}

/// @nodoc
class __$$_FeeJsonCopyWithImpl<$Res>
    extends _$FeeJsonCopyWithImpl<$Res, _$_FeeJson>
    implements _$$_FeeJsonCopyWith<$Res> {
  __$$_FeeJsonCopyWithImpl(_$_FeeJson _value, $Res Function(_$_FeeJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberOfTraveler = freezed,
    Object? fee = freezed,
  }) {
    return _then(_$_FeeJson(
      numberOfTraveler: freezed == numberOfTraveler
          ? _value.numberOfTraveler
          : numberOfTraveler // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FeeJson with DiagnosticableTreeMixin implements _FeeJson {
  const _$_FeeJson(
      {@JsonKey(name: 'number_of_traveler') this.numberOfTraveler, this.fee});

  factory _$_FeeJson.fromJson(Map<String, dynamic> json) =>
      _$$_FeeJsonFromJson(json);

  @override
  @JsonKey(name: 'number_of_traveler')
  final String? numberOfTraveler;
  @override
  final String? fee;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeeJson(numberOfTraveler: $numberOfTraveler, fee: $fee)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FeeJson'))
      ..add(DiagnosticsProperty('numberOfTraveler', numberOfTraveler))
      ..add(DiagnosticsProperty('fee', fee));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeeJson &&
            (identical(other.numberOfTraveler, numberOfTraveler) ||
                other.numberOfTraveler == numberOfTraveler) &&
            (identical(other.fee, fee) || other.fee == fee));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, numberOfTraveler, fee);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeeJsonCopyWith<_$_FeeJson> get copyWith =>
      __$$_FeeJsonCopyWithImpl<_$_FeeJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeeJsonToJson(
      this,
    );
  }
}

abstract class _FeeJson implements FeeJson {
  const factory _FeeJson(
      {@JsonKey(name: 'number_of_traveler') final String? numberOfTraveler,
      final String? fee}) = _$_FeeJson;

  factory _FeeJson.fromJson(Map<String, dynamic> json) = _$_FeeJson.fromJson;

  @override
  @JsonKey(name: 'number_of_traveler')
  String? get numberOfTraveler;
  @override
  String? get fee;
  @override
  @JsonKey(ignore: true)
  _$$_FeeJsonCopyWith<_$_FeeJson> get copyWith =>
      throw _privateConstructorUsedError;
}
