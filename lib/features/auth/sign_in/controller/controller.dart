import 'package:ali_com/core/services/dio_services.dart';
import 'package:ali_com/core/utils/flash_helper.dart';
import 'package:ali_com/features/auth/sign_in/controller/model.dart';
import 'package:ali_com/features/auth/sign_in/controller/send_data.dart';
import 'package:ali_com/features/auth/sign_in/controller/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/utils/enums.dart';

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
    emit(state.copyWith(requestState: RequestState.loading));

    HelperResponse response = await DioServices.instance.post(
      AppConstants.login,
      data: sendData().toJson(),
    );

    if (response.statusCode == 200) {
      FlashHelper.showToast(response.message, type: MessageTypeTost.success);
      final userModel = UserModel.fromJson(response.data);
      await userModel.save();

      emit(state.copyWith(requestState: RequestState.done));
    } else {
      FlashHelper.showToast(response.message, type: MessageTypeTost.fail);
      emit(state.copyWith(requestState: RequestState.error));
    }
  }
}
