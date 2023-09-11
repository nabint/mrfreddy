import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mrfreddy/data/models/user.dart';
import 'package:mrfreddy/repositories/auth_repo.dart';
import 'package:mrfreddy/utils/exception.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository = AuthRepository();

  AuthBloc() : super(AuthInitial()) {
    on<AutoLoginEvent>(autoLogin);
    on<SendLoginCodeEvent>(sendLoginCode);
    on<SendRegisterCodeEvent>(sendRegistrationCode);
    on<VerifyLoginCodeEvent>(verifyLoginCode);
    on<VerifyRegisterCodeEvent>(verifyRegisterCode);
    on<AuthCodeSent>(authCodeSent);
    on<LogUserIn>(logUserIn);
    on<LoginFailed>(loginFailed);
    on<RegisterFailed>(registerFailed);
    on<Logout>(logout);
  }

  void autoLogin(event, emit) async {
    emit(AuthLoggingIn());
    try {
      await _authRepository.autoLogin();
      if (_authRepository.user != null) {
        emit(AuthSuccess(_authRepository.user!));
      } else {
        emit(AuthInitial());
      }
    } catch (e) {
      print("EEROOOR"+e.toString());
      emit(AuthInitial());
    }
  }

  void sendLoginCode(event, emit) async {
    emit(AuthLoggingIn());
    try {
      await _authRepository.sendLoginCode(
        event.phone,
        onCodeSent: (verificationId, resendToken) {
          print('onCodeSent');
          print(resendToken.toString());
          add(AuthCodeSent(verificationId, resendToken));
        },
        onVerificationCompleted: (credential) async {
          print('onVerificationCompleted');
          await _authRepository.loginUser(credential: credential);
          if (_authRepository.user != null) {
            add(LogUserIn(_authRepository.user!));
          } else {
            add(LoginFailed(message: 'User not found'));
          }
        },
        onVerificationFailed: (e) {
          print('onVerificationFailed');
          print(e.toString());
          add(LoginFailed(message: e.toString()));
        },
      );
    } catch (e) {
      if (e.toString() == 'User not found') {
        final user = ModelUser(
          id: "",
          name: "",
          followedTraders: [],
          county: "",
          phone: event.phone,
        );
        
        add(SendRegisterCodeEvent(user: user));
        return;
      }

      emit(AuthFailed(message: e.toString()));
    }
  }

  void sendRegistrationCode(event, emit) async {
    emit(AuthRegistering());
    try {
      await _authRepository.sendRegistrationCode(
        event.user,
        onCodeSent: (verificationId, resendToken) {
          print('onCodeSent');
          print(resendToken.toString());
          add(AuthCodeSent(verificationId, resendToken));
        },
        onVerificationCompleted: (credential) async {
          print('onVerificationCompleted');
          await _authRepository.registerUser(
              user: event.user, credential: credential);
          if (_authRepository.user != null) {
            add(LogUserIn(_authRepository.user!));
          } else {
            add(RegisterFailed(message: 'User not found'));
          }
        },
        onVerificationFailed: (e) {
          print('onVerificationFailed');
          print(e.toString());
          add(RegisterFailed(message: e.toString()));
        },
      );
    } catch (e) {
      print(e.toString());
      emit(AuthFailed(message: e.toString()));
    }
  }

  void authCodeSent(event, emit) async {
    emit(AuthCodeVerification(event.verificationId, event.resendToken));
  }

  void verifyLoginCode(event, emit) async {
    emit(AuthVerifyingCode());
    try {
      await _authRepository.loginUser(
          verificationId: event.verificationId, code: event.code);
      print("success");
      emit(AuthSuccess(_authRepository.user!));
    } catch (e) {
      print(e.toString());
      emit(AuthFailed(message: e.toString()));
    }
  }

  void verifyRegisterCode(event, emit) async {
    emit(AuthVerifyingCode());
    try {
      await _authRepository.registerUser(
        verificationId: event.verificationId,
        code: event.code,
        user: event.user,
      );
      print("success");
      emit(AuthSuccess(_authRepository.user!));
    } catch (e) {
      print(e.toString());
      emit(AuthFailed(message: e.toString()));
    }
  }

  void logUserIn(event, emit) async {
    

    emit(AuthSuccess(event.user));
  }

  void loginFailed(event, emit) async {
    emit(AuthFailed(message: event.message));
  }

  void registerFailed(event, emit) async {
    emit(AuthFailed(message: event.message));
  }

  void logout(event, emit) async {
    await _authRepository.logout();
    emit(AuthInitial());
  }

  ModelUser? get user => _authRepository.user;
}
