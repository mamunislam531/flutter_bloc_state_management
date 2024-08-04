import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limerick_flutter_task/view/login/bloc/login_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginBloc loginBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: emailController,
              ),
              TextField(
                controller: passwordController,
              ),
              const SizedBox(height: 20),
              BlocConsumer<LoginBloc, LoginState>(
                bloc: loginBloc,

                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is LoginLoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is LoginInitial ||
                      state is LoginErrorState) {
                    return InkWell(
                      onTap: () {
                        loginBloc.add(LoginActionEvent(
                            email: "email", password: "password"));
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6)),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    );
                  } else {
                    return const Text("data");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
