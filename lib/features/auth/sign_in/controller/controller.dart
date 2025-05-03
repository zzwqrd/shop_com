import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/app_routes_fun.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/services/dio_services.dart';
import '../../../../core/services/helper_respons.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/flash_helper.dart';
import '../../../../features/auth/sign_in/controller/model.dart';
import '../../../../features/auth/sign_in/controller/send_data.dart';
import '../../../../features/auth/sign_in/controller/state.dart';

class LoginController extends Cubit<LoginState> {
  LoginController() : super(LoginState());

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController(text: 'user@alicom.com');
  final pas = TextEditingController(text: "secret");

  SendData sendData() {
    return SendData(
      email: email.text.trim(),
      password: pas.text.trim(),
    );
  }

  void login() async {
    if (formKey.isValid) {}
    emit(state.copyWith(requestState: RequestState.loading));

    HelperResponse response = await DioServices.instance.post(
      AppConstants.login,
      data: sendData().toJson(),
    );

    if (response.statusCode == 200) {
      FlashHelper.showToast(response.message, type: MessageTypeTost.success);
      final userModel = UserModel.fromJson(response.data);
      await userModel.save();
      pushAndRemoveUntil(NamedRoutes.i.layout);
      emit(state.copyWith(requestState: RequestState.done));
    } else {
      FlashHelper.showToast(response.message, type: MessageTypeTost.fail);
      emit(state.copyWith(requestState: RequestState.error));
    }
  }
}
