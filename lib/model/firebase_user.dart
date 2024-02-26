import 'package:firebase_app/service/i_auth_service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'firebase_user.g.dart';

@JsonSerializable()
class FirebaseUser extends IBaseModel<FirebaseUser> {
  @JsonKey(name: 'uid')
  final String? userId;
  final String? email;
  final String? name;
  @JsonKey(name: 'photoURL')
  final String? photoUrl;

  FirebaseUser({
    this.userId,
    this.email,
    this.name,
    this.photoUrl,
  });

  @override
  FirebaseUser fromJson(Map<String, dynamic> json) {
    return _$FirebaseUserFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$FirebaseUserToJson(this);
  }

  @override
  String toString() {
    return "FirebaseUser userId:$userId email:$email";
  }
}
