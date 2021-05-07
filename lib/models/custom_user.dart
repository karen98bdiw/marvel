import 'package:json_annotation/json_annotation.dart';

part 'custom_user.g.dart';

@JsonSerializable()
class CustomUser {
  final String nickName;
  final String email;

  CustomUser({this.email, this.nickName});

  Map<String, dynamic> toJson() => _$CustomUserToJson(this);
  factory CustomUser.fromJson(json) => _$CustomUserFromJson(json);
}
