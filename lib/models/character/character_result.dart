import 'package:json_annotation/json_annotation.dart';
import 'package:marvel/models/character/thumbnail.dart';

part 'character_result.g.dart';

@JsonSerializable()
class Character {
  int id;
  String name;
  String description;
  Thumbnail thumbnail;

  Character({this.description, this.id, this.name, this.thumbnail});

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
  factory Character.fromJson(json) => _$CharacterFromJson(json);
}
