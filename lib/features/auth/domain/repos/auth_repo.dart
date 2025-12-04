import 'package:dartz/dartz.dart';
import 'package:hungryapp/core/error/failure.dart';
import 'package:hungryapp/features/auth/domain/entity/login_request_entity.dart';
import 'package:hungryapp/features/auth/domain/entity/register_request_entity.dart';
import 'package:hungryapp/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> register(RegisterRequestEntity entity);
  Future<Either<Failure, UserEntity>> login(LoginRequestEntity entity);
}
