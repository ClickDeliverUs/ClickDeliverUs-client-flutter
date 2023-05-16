import 'package:cd_client/main.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/login_form.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(LoginForm.init())) {
    on<LoginIdEvent>((event, emit) => loginEventFactory(event, emit));
    on<LoginPasswordEvent>((event, emit) => loginEventFactory(event, emit));
    on<LoginResetEvent>((event, emit) => loginEventFactory(event, emit));
  }

  void loginEventFactory(LoginEvent event, Emitter<LoginState> emit) {
    late LoginForm loginForm;

    if (event is LoginIdEvent) {
      loginForm = state.loginForm.copyWith(id: event.idValue);
      loggerNoStack.i("register id bloc: ${loginForm.id}");
    } else if (event is LoginPasswordEvent) {
      loginForm = state.loginForm.copyWith(password: event.passwordValue);
      loggerNoStack.i("register password bloc: ${loginForm.password}");
    } else if (event is LoginResetEvent) {
      loginForm = LoginForm.init();
      loggerNoStack.i("reset login states");
    }

    emit(LoginState(loginForm));
  }
}

abstract class LoginEvent extends Equatable {}

class LoginResetEvent extends LoginEvent {
  LoginResetEvent();

  @override
  List<Object?> get props => [];
}

class LoginIdEvent extends LoginEvent {
  final String idValue;
  LoginIdEvent(this.idValue);

  @override
  List<Object?> get props => [idValue];
}

class LoginPasswordEvent extends LoginEvent {
  final String passwordValue;
  LoginPasswordEvent(this.passwordValue);

  @override
  List<Object?> get props => [passwordValue];
}

class LoginState extends Equatable {
  final LoginForm loginForm;
  const LoginState(this.loginForm);

  @override
  List<Object?> get props => [loginForm];
}
