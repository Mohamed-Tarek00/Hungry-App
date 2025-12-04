part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterFailuer extends RegisterState {
  final String errMessage;

  RegisterFailuer({required this.errMessage});
}

final class RegisterSuccess extends RegisterState {
  final UserEntity response;

  RegisterSuccess({required this.response});
}
