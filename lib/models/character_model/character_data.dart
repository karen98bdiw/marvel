import 'package:json_annotation/json_annotation.dart';
import 'package:marvel/models/character_model/character_result.dart';

@JsonSerializable()
class Data {
  int limit;
  List<Character> results;

  Data({this.limit, this.results});

  Map<String, dynamic> toJson() => {'limit': limit, 'results': results};
  factory Data.fromJson(json) => Data(
      limit: json['limit'],
      results:
          (json['results'] as List).map((e) => Character.fromJson(e)).toList());
}
