import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextfield extends StatefulWidget {
  String? label;
  bool? obscure;
  bool iconobs = false;
  TextEditingController controller;

  MyTextfield({
    required this.controller,
    this.label,
    this.obscure,
    super.key,
  });

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        obscureText: widget.iconobs == false ? false : true,
        controller: widget.controller,
        decoration: InputDecoration(
          suffix: widget.obscure == true
              ? Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      widget.iconobs == false
                          ? widget.iconobs = true
                          : widget.iconobs = false;
                      setState(() {});
                    },
                    child: SizedBox(
                      height: 18,
                      child: widget.iconobs == false
                          ? Image.asset('assets/images/openeye.png')
                          : Image.asset('assets/images/eyeclose.png'),
                    ),
                  ),
                )
              : const SizedBox(),
          labelText: widget.label ?? 'Email',
          isDense: true,
          enabledBorder: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
