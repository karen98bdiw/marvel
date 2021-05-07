import 'package:json_annotation/json_annotation.dart';
import 'package:marvel/models/character/character_data.dart';

part 'character_wrapper.g.dart';

@JsonSerializable()
class CharacterWrapper {
  int code;
  String status;
  Data data;

  CharacterWrapper({this.code, this.data, this.status});

  Map<String, dynamic> toJson() => _$CharacterWrapperToJson(this);
  factory CharacterWrapper.fromJson(json) => _$CharacterWrapperFromJson(json);
}
