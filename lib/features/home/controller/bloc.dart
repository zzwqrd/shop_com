import 'package:ali_com/core/services/dio_services.dart';
import 'package:ali_com/core/services/helper_respons.dart';
import 'package:ali_com/core/utils/flash_helper.dart';
import 'package:ali_com/features/home/controller/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/constant.dart';
import '../../../core/utils/enums.dart';
import 'model.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(HomeState());
  HomeModel? model;
  Future<void> getData() async {
    emit(state.copyWith(requestState: RequestState.loading));
    HelperResponse response = await DioServices.instance.get(AppConstants.home);
    if (response.statusCode == 200) {
      model = HomeModel.fromJson(response.data);
      emit(state.copyWith(requestState: RequestState.done));
    } else {
      FlashHelper.showToast(response.message, type: MessageTypeTost.fail);
      emit(state.copyWith(requestState: RequestState.error));
    }
  }
}
