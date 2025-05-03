import 'package:flutter/material.dart';

import '../../features/auth/sign_in/pages/view.dart';
import 'routes.dart';

class AppRoutes {
  static AppRoutes get init => AppRoutes._internal();
  String initial = NamedRoutes.i.login;
  AppRoutes._internal();
  Map<String, Widget Function(BuildContext context)> appRoutes = {
    // NamedRoutes.i.splash: (context) => const SplashView(),
    NamedRoutes.i.login: (context) => const SignInView(),
    // NamedRoutes.i.layout: (context) => const LayoutView(),
    // NamedRoutes.i.error: (context) => const ErrorView(),
    // NamedRoutes.i.internet: (context) => const ErrorInternetView(),
    // NamedRoutes.i.register: (context) => const RegisterView(),
    // Add other routes here
  };
}
