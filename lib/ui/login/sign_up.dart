import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app/ui/login/login.dart';
import 'package:shoes_app/saving/user.dart';
import 'package:shoes_app/widgets/textfield.dart';

final userDB = FirebaseFirestore.instance;
Users? currentUser;

class SignUp extends StatefulWidget {
  final Function()? onTap;
  const SignUp({super.key, required this.onTap});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool creator = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController coniformpasswordController = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();

  void signUp() async {
    if (passwordController.text != coniformpasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('email or password is incorrect'),
        ),
      );
      return;
    } else {
      try {
        validateForm(usernamecontroller.text);
        if (creator) {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text);
          addUserFirebase(
            usernamecontroller.text.trim(),
            passwordController.text.trim(),
            emailController.text.trim(),
            userCredential.user!.uid,
          );
          final doc = await userDB.doc(userCredential.user!.uid).get();
           currentUser = Users.fromDocument(doc);
          if (mounted) setState(() {});
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'creator false',
              ),
            ),
          );
        }
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
  }

  Future addUserFirebase(
      String usernamme, String password, String email, String userid) async {
    await userDB.collection('users').doc(userid).set({
      'username': usernamme,
      'password': password,
      'email': email,
      'userid': userid,
      'admin': false,
    });
  }

  validateForm(
    String? text,
  ) {
    if (text == null) {
      return ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'create username',
          ),
        ),
      );
    } else {
      if (text.trim().length < 3 || text.isEmpty) {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'username is short',
            ),
          ),
        );
      } else if (text.trim().length > 15) {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'username is long',
            ),
          ),
        );
      } else {
        setState(() {});
        creator = true;
      }
    }

    return null;
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
              'Register',
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          MyTextfield(
            label: 'Username',
            controller: usernamecontroller,
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
          const SizedBox(height: 15.0),
          MyTextfield(
            obscure: true,
            label: 'Coniform Password',
            controller: coniformpasswordController,
          ),
          MyElevatedButtonWithLogin(
            text: 'Register',
            onTap: signUp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account ? ',
                style: TextStyle(fontSize: 15.0),
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: const Text(
                  'Login',
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
