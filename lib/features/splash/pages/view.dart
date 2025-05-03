import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../commonWidget/custom_image.dart';
import '../../../core/utils/extensions.dart';
import '../../../di/service_locator.dart';
import '../../../gen/assets/generated_assets.dart';
import '../controller/controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final cubit = sl<SplashController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SplashController, SplashState>(
        bloc: cubit,
        builder: (context, state) {
          return CustomImage(
            Assets.icons.appLogo,
            height: 150.h,
            width: 150.h,
          ).center;
        },
      ),
    );
  }
}
