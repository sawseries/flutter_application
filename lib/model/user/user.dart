import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart' show immutable;

part './user.g.dart';

@immutable
@JsonSerializable()
class UserModel {
  const UserModel(
      {this.recordid,
      required this.username,
      required this.password,
      required this.fullname,
      required this.whcod,
      required this.audtuser,
      required this.audttime,
      required this.zonecod,
      required this.depcod});

  final int? recordid;
  final String username;
  final String password;
  final String fullname;
  final String whcod;
  final String audtuser;
  final String audttime;
  final String zonecod;
  final String depcod;
}

enum Gender { male, female, all }

enum UserStatus { inactive, active, all }
