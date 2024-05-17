import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String id;
  final String username;
  final String email;

  final bool admin;

  Users({
    required this.id,
    required this.username,
    required this.email,
    required this.admin,
  });

  factory Users.fromDocument(DocumentSnapshot doc) {
    return Users(
      id: doc['id'],
      username: doc['username'],
      email: doc['email'],
      admin: doc['admin'],
    );
  }
}
