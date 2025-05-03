import 'package:flutter/material.dart';

import '../../features/auth/sign_in/pages/view.dart';
import '../../features/home/pages/view.dart';
import '../../features/layout/pages/view.dart';
import '../../features/splash/pages/view.dart';
import 'routes.dart';

class AppRoutes {
  static AppRoutes get init => AppRoutes._internal();
  String initial = NamedRoutes.i.splash;
  AppRoutes._internal();
  Map<String, Widget Function(BuildContext c)> appRoutes = {
    NamedRoutes.i.splash: (c) => const SplashView(),
    NamedRoutes.i.login: (c) => const SignInView(),
    NamedRoutes.i.layout: (c) => const LayoutView(),
    NamedRoutes.i.home: (c) => HomeView(),
    // NamedRoutes.i.error: (context) => const ErrorView(),
    // NamedRoutes.i.internet: (context) => const ErrorInternetView(),
    // NamedRoutes.i.register: (context) => const RegisterView(),
    // Add other routes here
  };
}
