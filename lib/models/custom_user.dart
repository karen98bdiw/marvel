import 'package:json_annotation/json_annotation.dart';

part 'custom_user.g.dart';

@JsonSerializable()
class CustomUser {
  String id;
  final String nickName;
  final String email;

  CustomUser({this.id, this.email, this.nickName});

  Map<String, dynamic> toJson() => _$CustomUserToJson(this);
  factory CustomUser.fromJson(json) => _$CustomUserFromJson(json);
}
