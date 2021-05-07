import 'package:json_annotation/json_annotation.dart';

part 'thumbnail.g.dart';

@JsonSerializable()
class Thumbnail {
  String path;
  String end;

  Thumbnail({
    this.end,
    this.path,
  });

  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);
  factory Thumbnail.fromJson(json) => _$ThumbnailFromJson(json);
}
