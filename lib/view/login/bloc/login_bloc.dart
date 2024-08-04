import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginInitialEvent>(loginInitialEvent);
    on<LoginActionEvent>(loginActionEvent);
  }

  FutureOr<void> loginInitialEvent(
      LoginInitialEvent event, Emitter<LoginState> emit) {
    emit(LoginInitial());
  }

  FutureOr<void> loginActionEvent(
      LoginActionEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(LoginSuccessState());
  }
}
