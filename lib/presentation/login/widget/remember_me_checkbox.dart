import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limerick_flutter_task/presentation/login/bloc/login_bloc.dart';

class RememberMeCheckbox extends StatelessWidget {
  const RememberMeCheckbox({
    super.key,
    required this.loginBloc,
  });

  final LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: loginBloc,
      builder: (context, state) {
        bool rememberMe = false;
        if (state is LoginRememberMeState) {
          rememberMe = state.rememberMe;
        }
        return Checkbox(
          value: rememberMe,
          onChanged: (value) {
            loginBloc.add(LoginRememberEvent(rememberMe: !value!));
          },
        );
      },
    );
  }
}
