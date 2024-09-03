import 'package:flutter/material.dart';

class TempTextField extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  const TempTextField({super.key, this.labelText, this.controller, required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      controller: controller,
      decoration:  InputDecoration(
          labelStyle: const TextStyle(color: Colors.white),
          labelText: labelText,
          border: const OutlineInputBorder(),
          focusedBorder:
              const OutlineInputBorder(borderSide: BorderSide(color: Colors.white))),
      validator: validator,
    );
  }
}
