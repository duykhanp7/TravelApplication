// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_menu_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingMenuItem _$SettingMenuItemFromJson(Map<String, dynamic> json) {
  return _SettingMenuItem.fromJson(json);
}

/// @nodoc
mixin _$SettingMenuItem {
  MenuItemID get id => throw _privateConstructorUsedError;
  String? get leadingIcon => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get endIcon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingMenuItemCopyWith<SettingMenuItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingMenuItemCopyWith<$Res> {
  factory $SettingMenuItemCopyWith(
          SettingMenuItem value, $Res Function(SettingMenuItem) then) =
      _$SettingMenuItemCopyWithImpl<$Res, SettingMenuItem>;
  @useResult
  $Res call(
      {MenuItemID id, String? leadingIcon, String? name, String? endIcon});
}

/// @nodoc
class _$SettingMenuItemCopyWithImpl<$Res, $Val extends SettingMenuItem>
    implements $SettingMenuItemCopyWith<$Res> {
  _$SettingMenuItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? leadingIcon = freezed,
    Object? name = freezed,
    Object? endIcon = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as MenuItemID,
      leadingIcon: freezed == leadingIcon
          ? _value.leadingIcon
          : leadingIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      endIcon: freezed == endIcon
          ? _value.endIcon
          : endIcon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingMenuItemCopyWith<$Res>
    implements $SettingMenuItemCopyWith<$Res> {
  factory _$$_SettingMenuItemCopyWith(
          _$_SettingMenuItem value, $Res Function(_$_SettingMenuItem) then) =
      __$$_SettingMenuItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MenuItemID id, String? leadingIcon, String? name, String? endIcon});
}

/// @nodoc
class __$$_SettingMenuItemCopyWithImpl<$Res>
    extends _$SettingMenuItemCopyWithImpl<$Res, _$_SettingMenuItem>
    implements _$$_SettingMenuItemCopyWith<$Res> {
  __$$_SettingMenuItemCopyWithImpl(
      _$_SettingMenuItem _value, $Res Function(_$_SettingMenuItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? leadingIcon = freezed,
    Object? name = freezed,
    Object? endIcon = freezed,
  }) {
    return _then(_$_SettingMenuItem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as MenuItemID,
      leadingIcon: freezed == leadingIcon
          ? _value.leadingIcon
          : leadingIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      endIcon: freezed == endIcon
          ? _value.endIcon
          : endIcon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingMenuItem implements _SettingMenuItem {
  const _$_SettingMenuItem(
      {required this.id, this.leadingIcon, this.name, this.endIcon});

  factory _$_SettingMenuItem.fromJson(Map<String, dynamic> json) =>
      _$$_SettingMenuItemFromJson(json);

  @override
  final MenuItemID id;
  @override
  final String? leadingIcon;
  @override
  final String? name;
  @override
  final String? endIcon;

  @override
  String toString() {
    return 'SettingMenuItem(id: $id, leadingIcon: $leadingIcon, name: $name, endIcon: $endIcon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingMenuItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.leadingIcon, leadingIcon) ||
                other.leadingIcon == leadingIcon) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.endIcon, endIcon) || other.endIcon == endIcon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, leadingIcon, name, endIcon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingMenuItemCopyWith<_$_SettingMenuItem> get copyWith =>
      __$$_SettingMenuItemCopyWithImpl<_$_SettingMenuItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingMenuItemToJson(
      this,
    );
  }
}

abstract class _SettingMenuItem implements SettingMenuItem {
  const factory _SettingMenuItem(
      {required final MenuItemID id,
      final String? leadingIcon,
      final String? name,
      final String? endIcon}) = _$_SettingMenuItem;

  factory _SettingMenuItem.fromJson(Map<String, dynamic> json) =
      _$_SettingMenuItem.fromJson;

  @override
  MenuItemID get id;
  @override
  String? get leadingIcon;
  @override
  String? get name;
  @override
  String? get endIcon;
  @override
  @JsonKey(ignore: true)
  _$$_SettingMenuItemCopyWith<_$_SettingMenuItem> get copyWith =>
      throw _privateConstructorUsedError;
}
