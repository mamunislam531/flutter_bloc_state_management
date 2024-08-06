import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limerick_flutter_task/presentation/login/bloc/login_bloc.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key, required this.passwordController, required this.loginBloc});

  final TextEditingController passwordController;
  final LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: loginBloc,
      builder: (context, state) {
        var isObscure = false;
        log("---------- 0000 -------------- ");
        if (state is LoginObscureState) {
          isObscure = state.enableObscure;
          log("---111--- ${state.enableObscure} ------------------");
        }
        log("---------- 2222 -------------- ");
        return TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.red),
            ),
            labelText: "Password",
            labelStyle: const TextStyle(color: Colors.black54),
            suffixIcon: const Icon(Icons.remove_red_eye_outlined),
          ),
          validator: (value) {
            if (value == null || value == "") {
              return "Password can't be empty";
            } else {
              return null;
            }
          },
        );
      },
    );
  }
}
