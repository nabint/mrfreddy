part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AutoLoginEvent extends AuthEvent {}

class SendLoginCodeEvent extends AuthEvent {
  final String phone;
  final String county;

  SendLoginCodeEvent({required this.phone, required this.county});
}

class VerifyLoginCodeEvent extends AuthEvent {
  final String verificationId;
  final String code;

  VerifyLoginCodeEvent({required this.verificationId, required this.code});
}

class SendRegisterCodeEvent extends AuthEvent {
  final ModelUser user;

  SendRegisterCodeEvent({required this.user});
}

class VerifyRegisterCodeEvent extends AuthEvent {
  final String verificationId;
  final String code;
  final ModelUser user;

  VerifyRegisterCodeEvent(
      {required this.verificationId, required this.code, required this.user});
}

class AuthCodeSent extends AuthEvent {
  final String verificationId;
  final int? resendToken;
  AuthCodeSent(this.verificationId, this.resendToken);
}

class LogUserIn extends AuthEvent {
  final ModelUser user;
  LogUserIn(this.user);
}

class LoginFailed extends AuthEvent {
  final String? message;
  LoginFailed({this.message});
}

class RegisterFailed extends AuthEvent {
  final String? message;
  RegisterFailed({this.message});
}

class Logout extends AuthEvent {}
