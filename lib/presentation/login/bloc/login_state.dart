part of 'login_bloc.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginObscureState extends LoginState {
  bool enableObscure;
  LoginObscureState({required this.enableObscure});
}

final class LoginSuccessState extends LoginState {}

final class LoginErrorState extends LoginState {}
