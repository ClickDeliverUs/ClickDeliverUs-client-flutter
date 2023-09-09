import 'package:bloc/bloc.dart';
import 'package:cd_client/model/extrenal/user_account.dart';
import 'package:cd_client/apis/auth_api.dart';
import 'package:equatable/equatable.dart';

class UserAccountBloc extends Bloc<UserAccountEvent, UserAccountState> {
  final AuthApi authApi;

  UserAccountBloc({required this.authApi}) : super(InitUserAccountState()) {
    on<UserAccountEvent>((event, emit) {
      if (event is LoginEvent) _loginHandler(event, emit);
    });
  }

  void _loginHandler(LoginEvent event, emit) async {
    UserAccount account = await authApi.fetchLogin(event.id, event.password);

    emit(CurrentUserAccountState(userAccount: account));
  }
}

// event
abstract class UserAccountEvent extends Equatable {}

class LoginEvent extends UserAccountEvent {
  final String id;
  final String password;

  LoginEvent({required this.id, required this.password});

  @override
  List<Object?> get props => [id, password];
}

// state
abstract class UserAccountState extends Equatable {
  final UserAccount userAccount;

  const UserAccountState({required this.userAccount});
}

class CurrentUserAccountState extends UserAccountState {
  const CurrentUserAccountState({required super.userAccount});

  @override
  List<Object?> get props => [userAccount];
}

class InitUserAccountState extends UserAccountState {
  InitUserAccountState() : super(userAccount: UserAccount.init());

  @override
  List<Object?> get props => [userAccount];
}
