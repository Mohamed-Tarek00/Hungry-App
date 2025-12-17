import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:hungryapp/core/router/app_router.dart';
import 'package:hungryapp/core/router/app_router_names.dart';
import 'package:hungryapp/core/utils/app_preferences.dart';
import 'package:hungryapp/core/utils/service_locator.dart';
import 'package:hungryapp/core/utils/log_out_stream.dart';

class DioHelper {
  static const String baseUrl = 'https://sonic-zdi0.onrender.com/api';

  Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        validateStatus: (status) => status != null && status < 400,
        headers: {
          'Accept': 'application/json',
          'Accept-Language': 'en',
          'Content-Type': 'application/json',
        },
      ),
    );

    // Logging
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      ),
    );

    // Token Interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await getIt<AppPreferences>().getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (err, handler) async {
          if (err.response?.statusCode == 401 ||
              err.response?.statusCode == 403) {
            // Logout event
            getIt<LogoutStream>().addEvent('logout');
            await getIt<AppPreferences>().clearData();

            final context = routerKey.currentContext;
            if (context != null && context.mounted) {
              context.go(AppRouterNames.loginView);
            }
          }
          handler.next(err);
        },
      ),
    );

    return dio;
  }
}
