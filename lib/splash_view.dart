import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hungryapp/core/constant.dart';
import 'package:hungryapp/core/router/app_router_names.dart';
import 'package:hungryapp/core/utils/font_styles.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late final AnimationController _textController;
  late final AnimationController _logoController;

  double _textOpacity = 0;
  double _logoScale = 0.5;

  @override
  void initState() {
    super.initState();

    // Animation for Text
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // Animation for Logo
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // Start animations after build
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _textOpacity = 1.0;
      });
      _textController.forward();

      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _logoScale = 1.0;
        });
        _logoController.forward();
      });
    });

    // Navigate to login after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      context.go(AppRouterNames.loginView);
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          children: [
            const Spacer(),

            // Animated Text
            AnimatedOpacity(
              opacity: _textOpacity,
              duration: const Duration(milliseconds: 800),
              child: Text('Hungry?', style: FontStyles.splashTextStyle),
            ),

            const Spacer(),

            // Animated Logo
            AnimatedScale(
              scale: _logoScale,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOutBack,
              child: Image.asset(kLogo, height: 220.h, width: 400.w),
            ),
          ],
        ),
      ),
    );
  }
}
