import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/login_form.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(LoginForm.init())) {
    on<LoginIdEvent>((event, emit) {
      final updatedForm = state.loginForm.copyWith(id: event.idValue);
      print("login id bloc: ${updatedForm.id}");
      emit(LoginState(updatedForm));
    });
    on<LoginPasswordEvent>((event, emit) {
      final updatedForm =
          state.loginForm.copyWith(password: event.passwordValue);
      print("login password bloc: ${updatedForm.password}");
      emit(LoginState(updatedForm));
    });
  }
}

abstract class LoginEvent extends Equatable {}

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
