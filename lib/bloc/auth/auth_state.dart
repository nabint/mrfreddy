part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoggingIn extends AuthState {}

final class AuthRegistering extends AuthState {}

final class AuthCodeVerification extends AuthState {
  final String verificationId;
  final int? resendToken;
  AuthCodeVerification(this.verificationId, this.resendToken);
}

final class AuthVerifyingCode extends AuthState {}

final class AuthSuccess extends AuthState {
  final ModelUser user;
  AuthSuccess(this.user);
}

final class AuthFailed extends AuthState {
  final String? message;
  AuthFailed({this.message});
}

