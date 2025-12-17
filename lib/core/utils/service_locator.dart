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
import 'package:hungryapp/features/home/data/data_source/home_data_source.dart';
import 'package:hungryapp/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:hungryapp/features/home/domain/repo/home_repo.dart';
import 'package:hungryapp/features/home/domain/usecase/categories_usecase.dart';
import 'package:hungryapp/features/home/domain/usecase/products_usecase.dart';
import 'package:hungryapp/features/home/presentation/cubits/Categories_cubit/categories_cubit.dart';
import 'package:hungryapp/features/home/presentation/cubits/Products_Cubit/products_cubit.dart';
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
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());
  getIt.registerLazySingleton<Dio>(() => getIt<DioHelper>().createDio());
  getIt.registerLazySingleton<ApiService>(() => ApiService());

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

  // Home
  getIt.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(getIt<HomeDataSource>()),
  );
  getIt.registerLazySingleton<ProductsUsecase>(
    () => ProductsUsecase(getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<CategoriesUsecase>(
    () => CategoriesUsecase(getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<ProductCubit>(
    () => ProductCubit(getIt<ProductsUsecase>()),
  );
  getIt.registerLazySingleton<CategoriesCubit>(
    () => CategoriesCubit(getIt<CategoriesUsecase>()),
  );
}
