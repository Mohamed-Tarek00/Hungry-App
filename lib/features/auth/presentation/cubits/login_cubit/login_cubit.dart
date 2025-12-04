import 'package:bloc/bloc.dart';
import 'package:hungryapp/features/auth/domain/entity/login_request_entity.dart';
import 'package:hungryapp/features/auth/domain/entity/user_entity.dart';
import 'package:hungryapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUsecase) : super(LoginInitial());
  final LoginUsecase loginUsecase;

  Future<void> login(LoginRequestEntity entity) async {
    emit(LoginLoading());
    final result = await loginUsecase.call(entity);

    result.fold(
      (failuer) => emit(LoginFailuer(errMessage: failuer.errorMessage)),
      (response) => emit(LoginSuccess(response: response)),
    );
  }
}
