import 'package:dartz/dartz.dart';
import 'package:hungryapp/core/error/failure.dart';
import 'package:hungryapp/features/auth/domain/entity/login_request_entity.dart';
import 'package:hungryapp/features/auth/domain/entity/user_entity.dart';
import 'package:hungryapp/features/auth/domain/repos/auth_repo.dart';

class LoginUsecase {
  final AuthRepo authRepo;
  LoginUsecase({required this.authRepo});
  Future<Either<Failure, UserEntity>> call(LoginRequestEntity entity) async {
    return await authRepo.login(entity);
  }
}
