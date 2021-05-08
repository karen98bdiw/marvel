class Thumbnail {
  String path;
  String end;
  Thumbnail({
    this.end,
    this.path,
  });

  String get imageUrl => "$path" + "." + "$end";

  Map<String, dynamic> toJson() => {"path": path, "extension": end};
  factory Thumbnail.fromJson(json) =>
      Thumbnail(path: json['path'], end: json['extension']);
}
