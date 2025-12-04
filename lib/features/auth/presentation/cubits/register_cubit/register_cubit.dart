import 'package:bloc/bloc.dart';
import 'package:hungryapp/features/auth/domain/entity/register_request_entity.dart';
import 'package:hungryapp/features/auth/domain/entity/user_entity.dart';
import 'package:hungryapp/features/auth/domain/usecases/register_usecase.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUsecase) : super(RegisterInitial());
  final RegisterUsecase registerUsecase;

  Future<void> register(RegisterRequestEntity entity) async {
    emit(RegisterLoading());
    final result = await registerUsecase.call(entity);
    result.fold(
      (failuer) => emit(RegisterFailuer(errMessage: failuer.errorMessage)),
      (response) => emit(RegisterSuccess(response: response)),
    );
  }
}
