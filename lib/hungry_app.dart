import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hungryapp/core/router/app_router.dart';
import 'package:hungryapp/core/router/app_router_names.dart';
import 'package:hungryapp/core/utils/log_out_stream.dart';
import 'package:hungryapp/core/utils/service_locator.dart';

class HungryApp extends StatefulWidget {
  const HungryApp({super.key});

  @override
  State<HungryApp> createState() => _HungryAppState();
}

class _HungryAppState extends State<HungryApp> {
  StreamSubscription<String>? logoutsubscription;
  final logoutstream = getIt<LogoutStream>();
  @override
  void initState() {
    logoutsubscription = logoutstream.stream.listen((event) {
      if (event == 'logout') {
        context.go(AppRouterNames.loginView);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    logoutsubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          theme: ThemeData(splashColor: Colors.transparent),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
