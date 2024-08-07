part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginInitialEvent extends LoginEvent {}

class LoginObscureTapEvent extends LoginEvent {
  bool enableObscure;
  LoginObscureTapEvent({required this.enableObscure});
}

class LoginRememberEvent extends LoginEvent {
  bool rememberMe;
  LoginRememberEvent({required this.rememberMe});
}

class LoginActionEvent extends LoginEvent {
  String email;
  String password;
  LoginActionEvent({required this.email, required this.password});
}
