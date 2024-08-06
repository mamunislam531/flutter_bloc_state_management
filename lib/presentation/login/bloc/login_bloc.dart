import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:limerick_flutter_task/domain/repositories/auth/sign_in.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  bool isObscure = true;

  LoginBloc() : super(LoginInitial()) {
    on<LoginActionEvent>(loginActionEvent);
    on<LoginObscureTapEvent>(loginObscureTapEvent);
  }

  FutureOr<void> loginActionEvent(LoginActionEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    bool status = await LoginRepo.loginRepo(email: event.email, password: event.password);
    await Future.delayed(const Duration(seconds: 3));
    if (status) {
      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState());
    }
  }

  FutureOr<void> loginObscureTapEvent(LoginObscureTapEvent event, Emitter<LoginState> emit) {
    log("--------------- ${event.enableObscure}");
    log("--------------- ${!event.enableObscure}");
    emit(LoginObscureState(enableObscure: !event.enableObscure));
  }
}
