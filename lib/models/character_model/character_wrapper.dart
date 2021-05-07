import 'package:json_annotation/json_annotation.dart';
import 'package:marvel/models/character_model/character_data.dart';

@JsonSerializable()
class CharacterWrapper {
  int code;
  String status;
  Data data;

  CharacterWrapper({this.code, this.data, this.status});

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'data': data.toJson(),
      };
  factory CharacterWrapper.fromJson(json) => CharacterWrapper(
        code: json['code'],
        status: json['status'],
        data: Data.fromJson(json['data']),
      );
}
