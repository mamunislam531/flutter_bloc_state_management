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
        bool obscureEnable = false;
        log("------- 11-------- ${obscureEnable}");
        if (state is LoginObscureState) {
          obscureEnable = !state.enableObscure;
        }
        log("------22--------- ${obscureEnable}");
        return TextFormField(
          controller: passwordController,
          obscureText: obscureEnable,
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
            suffixIcon: obscureEnable
                ? IconButton(
                    onPressed: () {
                      loginBloc.add(LoginObscureTapEvent(enableObscure: obscureEnable));
                    },
                    icon: const Icon(Icons.visibility_off))
                : IconButton(
                    onPressed: () {
                      loginBloc.add(LoginObscureTapEvent(enableObscure: obscureEnable));
                    },
                    icon: const Icon(Icons.visibility)),
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
