import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app/homescreen.dart';
import 'package:shoes_app/ui/login/login_signup.dart';

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
            return  HomeScreen();
          } else {
            return const LoginAndSignUp();
          }
        },
      ),
    );
  }
}
