import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app/widgets/textfield.dart';

class Login extends StatefulWidget {
  final Function()? onTap;
  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 150,
            child: Image.asset('assets/images/icon.png'),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'Shoes shop app',
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          const SizedBox(height: 15.0),
          const Align(
            alignment: Alignment(-0.85, 0),
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          MyTextfield(
            controller: emailController,
          ),
          const SizedBox(height: 15.0),
          MyTextfield(
            obscure: true,
            label: 'Password',
            controller: passwordController,
          ),
          MyElevatedButtonWithLogin(
            onTap: () => login(context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have an account ? ',
                style: TextStyle(fontSize: 15.0),
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MyElevatedButtonWithLogin extends StatelessWidget {
  VoidCallback onTap;
  String? text;
  EdgeInsets? padding;
  MyElevatedButtonWithLogin({
    required this.onTap,
    this.text,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.0, vertical: 22),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onPressed: onTap,
          child: Text(
            text ?? 'Login',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
