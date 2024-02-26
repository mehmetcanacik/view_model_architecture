// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirebaseUser _$FirebaseUserFromJson(Map<String, dynamic> json) => FirebaseUser(
      userId: json['uid'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      photoUrl: json['photoURL'] as String?,
    );

Map<String, dynamic> _$FirebaseUserToJson(FirebaseUser instance) =>
    <String, dynamic>{
      'uid': instance.userId,
      'email': instance.email,
      'name': instance.name,
      'photoURL': instance.photoUrl,
    };
