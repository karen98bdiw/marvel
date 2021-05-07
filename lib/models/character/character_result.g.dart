// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) {
  return Character(
    description: json['description'] as String,
    id: json['id'] as int,
    name: json['name'] as String,
    thumbnail: json['thumbnail'],
  );
}

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
    };
