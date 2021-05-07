// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterWrapper _$CharacterWrapperFromJson(Map<String, dynamic> json) {
  return CharacterWrapper(
    code: json['code'] as int,
    data: json['data'],
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$CharacterWrapperToJson(CharacterWrapper instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };
