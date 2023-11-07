import 'package:bloc/bloc.dart';
import 'package:cd_client/model/extrenal/user_account.dart';
import 'package:cd_client/apis/auth_api.dart';
import 'package:equatable/equatable.dart';

class UserAccountBloc extends Bloc<UserAccountEvent, UserAccountState> {
  final AuthApi authApi;

  UserAccountBloc({required this.authApi}) : super(InitUserAccountState()) {
    on<UserAccountEvent>((event, emit) async {
      if (event is LoginEvent) {
        await _loginHandler(event, emit);
      } else if (event is KakaoLoginEvent) {
        await _kakaoLogin(event, emit);
      }
    });
  }

  Future<void> _loginHandler(LoginEvent event, emit) async {
    try {
      UserAccount account = await authApi.fetchLogin(event.id, event.password);

      emit(CurrentUserAccountState(userAccount: account, isLoggedIn: true));
    } catch (err) {
      // 로그인 실패 예외처리
      emit(InitUserAccountState());
    }
  }

  Future<void> _kakaoLogin(KakaoLoginEvent event, emit) async {
    try {
      UserAccount account = await authApi.fetchKakaoLogin();

      emit(CurrentUserAccountState(userAccount: account, isLoggedIn: true));
    } catch (e) {
      emit(InitUserAccountState());
    }
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

class KakaoLoginEvent extends UserAccountEvent {
  @override
  List<Object?> get props => [];
}

// state
abstract class UserAccountState extends Equatable {
  final UserAccount userAccount;
  final bool isLoggedIn;

  const UserAccountState({required this.userAccount, required this.isLoggedIn});
}

class CurrentUserAccountState extends UserAccountState {
  const CurrentUserAccountState(
      {required super.userAccount, required super.isLoggedIn});

  @override
  List<Object?> get props => [userAccount, isLoggedIn];
}

class InitUserAccountState extends UserAccountState {
  InitUserAccountState()
      : super(userAccount: UserAccount.init(), isLoggedIn: false);

  @override
  List<Object?> get props => [userAccount, isLoggedIn];
}
