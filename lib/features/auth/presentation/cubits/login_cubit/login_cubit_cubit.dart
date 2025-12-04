import 'package:bloc/bloc.dart';
import 'package:hungryapp/features/auth/domain/entity/login_request_entity.dart';
import 'package:hungryapp/features/auth/domain/entity/user_entity.dart';
import 'package:hungryapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:meta/meta.dart';

part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit(this.loginUsecase) : super(LoginCubitInitial());
  final LoginUsecase loginUsecase;

  Future<void> login(LoginRequestEntity entity) async {
    emit(LoginCubitLoading());
    final result = await loginUsecase.call(entity);

    result.fold(
      (failuer) => emit(LoginCubitFailuer(errMessage: failuer.errorMessage)),
      (response) => emit(LoginCubitSuccess(response: response)),
    );
  }
}
