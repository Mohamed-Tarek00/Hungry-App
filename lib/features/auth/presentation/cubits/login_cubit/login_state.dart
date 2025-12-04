part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailuer extends LoginState {
  final String errMessage;

  LoginFailuer({required this.errMessage});
}

final class LoginSuccess extends LoginState {
  final UserEntity response;

  LoginSuccess({required this.response});
}
