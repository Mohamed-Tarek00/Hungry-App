import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hungryapp/core/utils/api_service.dart';
import 'package:hungryapp/core/utils/app_preferences.dart';
import 'package:hungryapp/core/utils/dio_helper.dart';
import 'package:hungryapp/core/utils/log_out_stream.dart';
import 'package:hungryapp/features/auth/data/data_sources/auth_data_source.dart';
import 'package:hungryapp/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:hungryapp/features/auth/domain/repos/auth_repo.dart';
import 'package:hungryapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:hungryapp/features/auth/domain/usecases/register_usecase.dart';
import 'package:hungryapp/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:hungryapp/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
Future<void> setupServiceLocator() async {
  // logout stream
  getIt.registerLazySingleton(() => LogoutStream());

  // shared preferences
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  getIt.registerLazySingleton<AppPreferences>(
    () => AppPreferences(getIt<SharedPreferences>()),
  );

  // dio options for main api service
  final dio = DioHelper().createDio();
  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  // Auth
  getIt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<AuthDataSource>()),
  );
  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<RegisterUsecase>(
    () => RegisterUsecase(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<RegisterCubit>(
    () => RegisterCubit(getIt<RegisterUsecase>()),
  );
  getIt.registerLazySingleton<LoginCubit>(
    () => LoginCubit(getIt<LoginUsecase>()),
  );
}
