
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../commonWidget/custom_image.dart';
import '../../../config/internet_checker.dart';
import '../../../core/routes/app_routes_fun.dart';
import '../../../core/routes/routes.dart';
import '../../../core/utils/flash_helper.dart';
import '../../../gen/assets/generated_assets.dart';
import '../controller/controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _checkInternetAndNavigate();
  }

  Future<void> _checkInternetAndNavigate() async {
    final hasInternet = await InternetChecker().hasInternet();
    if (!hasInternet) {
      FlashHelper.showToast('يرجى التحقق من اتصال الإنترنت', type: MessageTypeTost.fail);
      return;
    }
    // Add delay for splash screen visibility
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      pushAndRemoveUntil(NamedRoutes.i.layout);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashController(),
      child: Scaffold(
        body: Center(
          child: CustomImage(
            Assets.icons.appLogo,
            width: 200,
          ),
        ),
      ),
    );
  }
}
