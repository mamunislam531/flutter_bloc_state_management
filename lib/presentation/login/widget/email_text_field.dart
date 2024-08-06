import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Colors.grey)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Colors.grey)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Colors.red)),
        labelText: "Email",
        labelStyle: const TextStyle(color: Colors.black54),
      ),
      validator: (value) {
        if (value == null || value == "") {
          return "Email can't be empty";
        }
        if (!(value.contains("@") && value.contains("."))) {
          return "Wrong email address";
        } else {
          return null;
        }
      },
    );
  }
}
