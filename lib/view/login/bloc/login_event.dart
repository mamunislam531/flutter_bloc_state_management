part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginInitialEvent extends LoginEvent{}

class LoginActionEvent extends LoginEvent{
  String email;
  String password;
  LoginActionEvent({required this.email, required this.password});
}
