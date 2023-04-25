// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_menu_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingMenuItem _$$_SettingMenuItemFromJson(Map<String, dynamic> json) =>
    _$_SettingMenuItem(
      id: $enumDecode(_$MenuItemIDEnumMap, json['id']),
      leadingIcon: json['leadingIcon'] as String?,
      name: json['name'] as String?,
      endIcon: json['endIcon'] as String?,
    );

Map<String, dynamic> _$$_SettingMenuItemToJson(_$_SettingMenuItem instance) =>
    <String, dynamic>{
      'id': _$MenuItemIDEnumMap[instance.id]!,
      'leadingIcon': instance.leadingIcon,
      'name': instance.name,
      'endIcon': instance.endIcon,
    };

const _$MenuItemIDEnumMap = {
  MenuItemID.notification: 'notification',
  MenuItemID.languages: 'languages',
  MenuItemID.payment: 'payment',
  MenuItemID.privacyAndPolicies: 'privacyAndPolicies',
  MenuItemID.feedback: 'feedback',
  MenuItemID.usage: 'usage',
  MenuItemID.guide: 'guide',
  MenuItemID.logout: 'logout',
};
