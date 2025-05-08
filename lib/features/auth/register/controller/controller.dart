
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routes/app_routes_fun.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/services/dio_services.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/flash_helper.dart';
import 'model.dart';
import 'state.dart';

class RegisterController extends Cubit<RegisterState> {
  RegisterController() : super(RegisterState());

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void register() async {
    if (!formKey.currentState!.validate()) return;

    emit(state.copyWith(requestState: RequestState.loading));

    final model = RegisterModel(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
    );

    final response = await DioServices.instance.post(
      AppConstants.register,
      data: model.toJson(),
    );

    if (response.statusCode == 200) {
      FlashHelper.showToast(response.message, type: MessageTypeTost.success);
      pushAndRemoveUntil(NamedRoutes.i.layout);
      emit(state.copyWith(requestState: RequestState.done));
    } else {
      FlashHelper.showToast(response.message, type: MessageTypeTost.fail);
      emit(state.copyWith(requestState: RequestState.error));
    }
  }
}
