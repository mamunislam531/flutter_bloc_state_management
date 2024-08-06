import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limerick_flutter_task/presentation/login/widget/email_text_field.dart';
import 'package:limerick_flutter_task/presentation/login/widget/password_text_field.dart';
import 'bloc/login_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginBloc loginBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset("assets/images/logo.png", height: 150, width: MediaQuery.sizeOf(context).width, fit: BoxFit.fill),
                const SizedBox(height: 40),
                EmailTextField(emailController: emailController),
                const SizedBox(height: 20),
                PasswordTextField(passwordController: passwordController, loginBloc: loginBloc,),
                const SizedBox(height: 20),
                BlocConsumer<LoginBloc, LoginState>(
                  bloc: loginBloc,
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return const CircularProgressIndicator();
                    }

                    return InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        loginBloc.add(LoginActionEvent(email: emailController.text, password: passwordController.text));
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(6)),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
