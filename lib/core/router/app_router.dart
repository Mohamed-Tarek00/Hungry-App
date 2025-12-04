import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hungryapp/core/router/app_router_names.dart';
import 'package:hungryapp/features/auth/presentation/views/login_view.dart';
import 'package:hungryapp/features/auth/presentation/views/register_view.dart';
import 'package:hungryapp/features/cart/presentation/views/cart_view.dart';
import 'package:hungryapp/features/home/presentation/views/home_view.dart';
import 'package:hungryapp/features/checkout/presentation/views/checkout_view.dart';
import 'package:hungryapp/features/product_details/presentation/views/product_details_view.dart';
import 'package:hungryapp/features/profile/presentation/views/profile_view.dart';
import 'package:hungryapp/root.dart';
import 'package:hungryapp/splash_view.dart';

final GlobalKey<NavigatorState> routerKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: routerKey,
    initialLocation: AppRouterNames.splashView,
    routes: <RouteBase>[
      GoRoute(
        path: AppRouterNames.splashView,
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: AppRouterNames.loginView,
        builder: (context, state) {
          return const LoginView();
        },
      ),
      GoRoute(
        path: AppRouterNames.registerView,
        builder: (context, state) {
          return const RegisterView();
        },
      ),
      GoRoute(
        path: AppRouterNames.root,
        builder: (context, state) {
          return const Root();
        },
      ),
      GoRoute(
        path: AppRouterNames.homeview,
        builder: (context, state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: AppRouterNames.productdetailsview,
        builder: (context, state) {
          return ProductDetailsView();
        },
      ),
      GoRoute(
        path: AppRouterNames.cartview,
        builder: (context, state) {
          return CartView();
        },
      ),
      GoRoute(
        path: AppRouterNames.checkoutview,
        builder: (context, state) {
          return CheckoutView();
        },
      ),
      GoRoute(
        path: AppRouterNames.orderhistoryview,
        builder: (context, state) {
          return CheckoutView();
        },
      ),
      GoRoute(
        path: AppRouterNames.profileview,
        builder: (context, state) {
          return ProfileView();
        },
      ),
    ],
  );
}
