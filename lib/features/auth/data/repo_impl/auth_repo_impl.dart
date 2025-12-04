import 'package:dartz/dartz.dart';
import 'package:hungryapp/core/error/failure.dart';
import 'package:hungryapp/core/utils/handle_request.dart';
import 'package:hungryapp/features/auth/data/data_sources/auth_data_source.dart';
import 'package:hungryapp/features/auth/data/models/login_request_model.dart';
import 'package:hungryapp/features/auth/data/models/register_request_model.dart';
import 'package:hungryapp/features/auth/domain/entity/login_request_entity.dart';
import 'package:hungryapp/features/auth/domain/entity/register_request_entity.dart';
import 'package:hungryapp/features/auth/domain/entity/user_entity.dart';
import 'package:hungryapp/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource dataSource;

  AuthRepoImpl(this.dataSource);
  @override
  Future<Either<Failure, UserEntity>> login(LoginRequestEntity entity) async {
    final model = LoginRequestModel(entity: entity);

    return handleRequest(
      request: () async {
        final responseModel = await dataSource.loginRequest(model: model);
        return responseModel.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, UserEntity>> register(RegisterRequestEntity entity) {
    final model = RegisterRequestModel(entity: entity);

    return handleRequest(
      request: () async {
        final responseModel = await dataSource.registerRequest(model: model);
        return responseModel.toEntity();
      },
    );
  }
}
