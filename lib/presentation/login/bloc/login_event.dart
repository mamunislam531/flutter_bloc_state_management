part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginInitialEvent extends LoginEvent {}

class LoginObscureTapEvent extends LoginEvent {
  bool enableObscure;
  LoginObscureTapEvent({required this.enableObscure});
}

class LoginActionEvent extends LoginEvent {
  String email;
  String password;
  LoginActionEvent({required this.email, required this.password});
}
