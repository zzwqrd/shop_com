import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../commonWidget/app_btn.dart';
import '../../../../../commonWidget/app_field.dart';
import '../../../../../commonWidget/app_text.dart';
import '../../../../../commonWidget/button_animation/LoadingButton.dart';
import '../../../../../commonWidget/custom_image.dart';
import '../../../../../core/general_bloc/generic_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../di/service_locator.dart';
import '../../../../../gen/assets/generated_assets.dart';
import '../../../../../gen/locale_keys.g.dart';
import '../controller/controller.dart';
import '../controller/state.dart';
import '../widgets/remember_me.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    GenericBloc<bool> isChecked = GenericBloc(false);
    final bloc = sl<LoginController>();

    return SafeArea(
      child: Scaffold(
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
                  title: tr(LocaleKeys.auth_title),
                ).center.withPadding(vertical: 10.h),
                MyTextApp.small(
                  title: tr(LocaleKeys.auth_sub_title_sign_in),
                ).center.withPadding(vertical: 10.h),
                AppCustomForm.email(
                  controller: bloc.email,
                ).withPadding(vertical: 10.h),
                AppCustomForm.password(
                  controller: bloc.pas,
                ).withPadding(vertical: 10.h),
                BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                  bloc: isChecked,
                  builder: (context, state) {
                    return RememberMeRow(
                      isChecked: isChecked.state.data,
                      onCheckboxChanged: (value) {
                        isChecked.onUpdateData(value!);
                      },
                    );
                  },
                ),
                BlocBuilder<LoginController, LoginState>(
                  bloc: bloc,
                  builder: (context, state) {
                    return LoadingButton(
                      isAnimating: state.requestState.isLoading,
                      title: tr(LocaleKeys.auth_title),
                      onTap: () {
                        bloc.login();
                      },
                    );
                  },
                ),
                MyTextApp.small(title: 'ليس لديك حساب ؟')
                    .center
                    .withPadding(vertical: 18.h),
                EnhancedButton(
                  label: tr(LocaleKeys.auth_signup_link),
                  backgroundColor: Colors.white,
                  textColor: AppColors.mainColor,
                  onPressed: () {},
                ).center.withPadding(horizontal: 10.h),
              ],
            ),
          ).withPadding(horizontal: 15),
        ),
      ),
    );
  }
}
