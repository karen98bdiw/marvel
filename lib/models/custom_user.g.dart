// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomUser _$CustomUserFromJson(Map<String, dynamic> json) {
  return CustomUser(
    id: json['id'] as String,
    email: json['email'] as String,
    nickName: json['nickName'] as String,
  );
}

Map<String, dynamic> _$CustomUserToJson(CustomUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickName': instance.nickName,
      'email': instance.email,
    };
