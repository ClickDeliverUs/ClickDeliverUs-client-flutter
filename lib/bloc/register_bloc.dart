import 'package:bloc/bloc.dart';
import 'package:cd_client/main.dart';
import 'package:cd_client/model/register_form.dart';
import 'package:equatable/equatable.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState(RegisterForm.init())) {
    on<RegisterIdEvent>((event, emit) => registerEventFactory(event, emit));
    on<RegisterPasswordEvent>(
        (event, emit) => registerEventFactory(event, emit));
    on<RegisterVerifyPasswordEvent>(
        (event, emit) => registerEventFactory(event, emit));
    on<RegisterNickNameEvent>(
        (event, emit) => registerEventFactory(event, emit));
    on<RegisterIsIdAvailableEvent>(
        (event, emit) => registerEventFactory(event, emit));
    on<RegisterResetEvent>((event, emit) => registerEventFactory(event, emit));
  }

  void registerEventFactory(RegisterEvent event, Emitter<RegisterState> emit) {
    late RegisterForm registerForm;

    if (event is RegisterIdEvent) {
      registerForm = state.registerForm.copyWith(id: event.idValue);
      loggerNoStack.i("register id bloc: ${registerForm.id}");
    } else if (event is RegisterPasswordEvent) {
      registerForm = state.registerForm.copyWith(password: event.passwordValue);
      loggerNoStack.i("register password bloc: ${registerForm.password}");
    } else if (event is RegisterVerifyPasswordEvent) {
      registerForm = state.registerForm
          .copyWith(verifyPassword: event.verifyPasswordValue);
      loggerNoStack
          .i("register verifyPassword bloc: ${registerForm.verifyPassword}");
    } else if (event is RegisterNickNameEvent) {
      registerForm = state.registerForm.copyWith(nickName: event.nickNameValue);
      loggerNoStack.i("register nickName bloc: ${registerForm.nickName}");
    } else if (event is RegisterIsIdAvailableEvent) {
      registerForm =
          state.registerForm.copyWith(isIdAvailable: event.isIdAvailable);
      loggerNoStack
          .i("register isIdAvailable bloc: ${registerForm.isIdAvailable}");
    } else if (event is RegisterResetEvent) {
      registerForm = RegisterForm.init();
      loggerNoStack.i("reset register states");
    }

    emit(RegisterState(registerForm));
  }
}

abstract class RegisterEvent extends Equatable {}

class RegisterResetEvent extends RegisterEvent {
  RegisterResetEvent();

  @override
  List<Object?> get props => [];
}

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
