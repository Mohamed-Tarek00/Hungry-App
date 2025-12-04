import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hungryapp/core/utils/api_service.dart';
import 'package:hungryapp/core/utils/app_preferences.dart';
import 'package:hungryapp/core/utils/dio_helper.dart';
import 'package:hungryapp/core/utils/log_out_stream.dart';
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
}
