import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String userid;
  final String username;
  final String email;
  final String password;

  final bool admin;

  Users({
    required this.userid,
    required this.username,
    required this.email,
    required this.password,
    required this.admin,
  });

  factory Users.fromDocument(DocumentSnapshot doc) {
    return Users(
      userid: doc['userid'],
      username: doc['username'],
      password: doc['password'],
      email: doc['email'],
      admin: doc['admin'],
    );
  }
}
