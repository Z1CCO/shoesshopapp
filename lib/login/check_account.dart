import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app/login/login_signup.dart';
import 'package:shoes_app/profile/profile.dart';

class CheckAccount extends StatefulWidget {
  const CheckAccount({super.key});

  @override
  State<CheckAccount> createState() => _CheckAccountState();
}

class _CheckAccountState extends State<CheckAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Profile();
          } else {
            return const LoginAndSignUp();
          }
        },
      ),
    );
  }
}
