
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../commonWidget/app_btn.dart';
import '../../../../commonWidget/app_field.dart';
import '../../../../commonWidget/app_text.dart';
import '../../../../commonWidget/button_animation/LoadingButton.dart';
import '../../../../commonWidget/custom_image.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../di/service_locator.dart';
import '../../../../gen/assets/generated_assets.dart';
import '../../../../gen/locale_keys.g.dart';
import '../controller/controller.dart';
import '../controller/state.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterController>(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<RegisterController>();
          
          return Scaffold(
            body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Form(
                key: bloc.formKey,
                child: Column(
                  children: [
                    CustomImage(
                      Assets.icons.appLogo,
                      width: 120.w,
                    ).center.withPadding(vertical: 30.h, top: 20),
                    
                    MyTextApp.bold(
                      title: tr(LocaleKeys.auth_title_sign_up),
                    ).center.withPadding(vertical: 10.h),
                    
                    MyTextApp.small(
                      title: tr(LocaleKeys.auth_sub_title_sign_up),
                    ).center.withPadding(vertical: 10.h),

                    AppCustomForm.text(
                      controller: bloc.nameController,
                      title: tr(LocaleKeys.auth_name_placeholder),
                    ).withPadding(vertical: 10.h),

                    AppCustomForm.email(
                      controller: bloc.emailController,
                    ).withPadding(vertical: 10.h),

                    AppCustomForm.phone(
                      controller: bloc.phoneController,
                    ).withPadding(vertical: 10.h),

                    AppCustomForm.password(
                      controller: bloc.passwordController,
                    ).withPadding(vertical: 10.h),

                    AppCustomForm.confirmPassword(
                      controller: bloc.confirmPasswordController,
                      initialValue: bloc.passwordController.text,
                    ).withPadding(vertical: 10.h),

                    BlocBuilder<RegisterController, RegisterState>(
                      builder: (context, state) {
                        return LoadingButton(
                          isAnimating: state.requestState.isLoading,
                          title: tr(LocaleKeys.auth_signup_button),
                          onTap: () => bloc.register(),
                        );
                      },
                    ),

                    MyTextApp.small(
                      title: tr(LocaleKeys.auth_already_have_account),
                    ).center.withPadding(vertical: 18.h),

                    EnhancedButton(
                      label: tr(LocaleKeys.auth_login_link),
                      backgroundColor: Colors.white,
                      textColor: context.primaryColor,
                      onPressed: () => Navigator.pop(context),
                    ).center.withPadding(horizontal: 10.h),
                  ],
                ),
              ).withPadding(horizontal: 15),
            ),
          );
        },
      ),
    );
  }
}
