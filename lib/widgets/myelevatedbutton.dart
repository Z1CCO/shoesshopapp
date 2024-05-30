import 'package:flutter/material.dart';

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
