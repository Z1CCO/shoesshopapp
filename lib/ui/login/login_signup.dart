
import 'package:flutter/material.dart';
import 'package:shoes_app/ui/login/login.dart';
import 'package:shoes_app/ui/login/sign_up.dart';

class LoginAndSignUp extends StatefulWidget {
  const LoginAndSignUp({super.key});

  @override
  State<LoginAndSignUp> createState() => _LoginAndSignUpState();
}

class _LoginAndSignUpState extends State<LoginAndSignUp> {
  bool register = false;

  void onTap() {
    register = !register;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (register == false) {
      return Login(onTap: onTap);
    }
    return SignUp(onTap: onTap);
  }
}