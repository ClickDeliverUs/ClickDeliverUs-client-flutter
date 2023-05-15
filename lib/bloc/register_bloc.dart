import 'package:bloc/bloc.dart';
import 'package:cd_client/model/register_form.dart';
import 'package:equatable/equatable.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState(RegisterForm.init())) {
    on<RegisterIdEvent>((event, emit) {
      final updatedForm = state.registerForm.copyWith(id: event.idValue);
      emit(RegisterState(updatedForm));
    });
    on<RegisterPasswordEvent>((event, emit) {
      final updatedForm =
          state.registerForm.copyWith(password: event.passwordValue);
      emit(RegisterState(updatedForm));
    });
    on<RegisterVerifyPasswordEvent>((event, emit) {
      final updatedForm = state.registerForm
          .copyWith(verifyPassword: event.verifyPasswordValue);
      emit(RegisterState(updatedForm));
    });
    on<RegisterNickNameEvent>((event, emit) {
      final updatedForm =
          state.registerForm.copyWith(nickName: event.nickNameValue);
      emit(RegisterState(updatedForm));
    });
    on<RegisterIsIdAvailableEvent>((event, emit) {
      final updatedForm =
          state.registerForm.copyWith(isIdAvailable: event.isIdAvailable);
      emit(RegisterState(updatedForm));
    });
  }
}

abstract class RegisterEvent extends Equatable {}

class RegisterIdEvent extends RegisterEvent {
  final String idValue;
  RegisterIdEvent(this.idValue);

  @override
  List<Object?> get props => [idValue];
}

class RegisterPasswordEvent extends RegisterEvent {
  final String passwordValue;
  RegisterPasswordEvent(this.passwordValue);

  @override
  List<Object?> get props => [passwordValue];
}

class RegisterVerifyPasswordEvent extends RegisterEvent {
  final String verifyPasswordValue;
  RegisterVerifyPasswordEvent(this.verifyPasswordValue);

  @override
  List<Object?> get props => [verifyPasswordValue];
}

class RegisterNickNameEvent extends RegisterEvent {
  final String nickNameValue;
  RegisterNickNameEvent(this.nickNameValue);

  @override
  List<Object?> get props => [nickNameValue];
}

class RegisterIsIdAvailableEvent extends RegisterEvent {
  final bool isIdAvailable;
  RegisterIsIdAvailableEvent(this.isIdAvailable);

  @override
  List<Object?> get props => [isIdAvailable];
}

class RegisterState extends Equatable {
  final RegisterForm registerForm;
  const RegisterState(this.registerForm);

  @override
  List<Object?> get props => [registerForm];
}
