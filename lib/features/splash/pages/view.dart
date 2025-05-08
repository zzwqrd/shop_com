import 'package:flutter/material.dart';

import '../../../commonWidget/custom_image.dart';
import '../../../di/service_locator.dart';
import '../../../gen/assets/generated_assets.dart';
import '../controller/controller.dart' show SplashController;

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    sl<SplashController>().retryInitialization;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomImage(
          Assets.icons.appLogo,
          width: 200,
        ),
      ),
    );
  }
}
