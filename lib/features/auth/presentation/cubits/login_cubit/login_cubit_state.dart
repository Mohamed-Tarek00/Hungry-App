part of 'login_cubit_cubit.dart';

@immutable
sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}

final class LoginCubitLoading extends LoginCubitState {}

final class LoginCubitFailuer extends LoginCubitState {
  final String errMessage;

  LoginCubitFailuer({required this.errMessage});
}

final class LoginCubitSuccess extends LoginCubitState {
  final UserEntity response;

  LoginCubitSuccess({required this.response});
}
