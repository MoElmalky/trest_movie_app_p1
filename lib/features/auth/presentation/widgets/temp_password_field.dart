import 'package:flutter/material.dart';

bool toggle = false;

class TempPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? Function(String?) validator;
  const TempPasswordField(
      {super.key, this.controller, this.labelText, required this.validator});

  @override
  State<TempPasswordField> createState() => _TempPasswordFieldState();
}

class _TempPasswordFieldState extends State<TempPasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: toggle,
      cursorColor: Colors.white,
      controller: widget.controller,
      decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.white),
          labelText: widget.labelText,
          border: const OutlineInputBorder(),
          suffixIcon: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  toggle = !toggle;
                });
              },
              child: Icon(toggle
                  ? Icons.visibility_sharp
                  : Icons.visibility_off_sharp)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
      validator: widget.validator,
    );
  }
}
