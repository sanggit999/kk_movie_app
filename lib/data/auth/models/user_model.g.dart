// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  uid: json['uid'] as String? ?? '',
  name: json['name'] as String? ?? '',
  email: json['email'] as String? ?? '',
  avatarUrl: json['avatarUrl'] as String? ?? '',
  provider: json['provider'] as String? ?? '',
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'avatarUrl': instance.avatarUrl,
      'provider': instance.provider,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
