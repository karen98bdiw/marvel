import 'package:json_annotation/json_annotation.dart';
import 'package:marvel/models/character/character_result.dart';

part 'character_data.g.dart';

@JsonSerializable()
class Data {
  int limit;
  List<Character> results;

  Data({this.limit, this.results});

  Map<String, dynamic> toJson() => _$DataToJson(this);
  factory Data.fromJson(json) => _$DataFromJson(json);
}
