// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    limit: json['limit'] as int,
    results: json['results'] as List,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'limit': instance.limit,
      'results': instance.results,
    };
