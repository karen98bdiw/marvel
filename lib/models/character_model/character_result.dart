import 'package:marvel/models/character_model/thumbnail.dart';

class Character {
  int id;
  String name;
  String description;
  Thumbnail thumbnail;

  Character({this.description, this.id, this.name, this.thumbnail});

  Map<String, dynamic> toJson() => {
    'id':id,
    'name':name,
    'description':description,
    'thumbnail':thumbnail
  };
  factory Character.fromJson(json) =>Character(
    description: json['description'],
    id: json['id'],
    name: json['name'],
    thumbnail: json['thumbnail']
  );
}
