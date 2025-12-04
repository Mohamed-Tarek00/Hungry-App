import 'package:dartz/dartz.dart';
import 'package:hungryapp/core/error/failure.dart';
import 'package:hungryapp/features/auth/domain/entity/register_request_entity.dart';
import 'package:hungryapp/features/auth/domain/entity/user_entity.dart';
import 'package:hungryapp/features/auth/domain/repos/auth_repo.dart';

class RegisterUsecase {
  final AuthRepo authRepo;
  RegisterUsecase(this.authRepo);
  Future<Either<Failure, UserEntity>> call(RegisterRequestEntity entity) async {
    return await authRepo.register(entity);
  }
}
