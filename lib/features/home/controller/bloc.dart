import 'package:ali_com/core/services/dio_services.dart';
import 'package:ali_com/core/services/helper_respons.dart';
import 'package:ali_com/core/utils/flash_helper.dart';
import 'package:ali_com/features/home/controller/state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/constant.dart';
import '../../../core/utils/enums.dart';
import 'model.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(HomeState());

  HomeModel? model;

  List<Banners> banners = [];
  List<Category> categories = [];
  List<Ads> ads = [];

  Future<void> getData() async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await data();

    result.fold(
      (failure) {
        FlashHelper.showToast(failure.message, type: MessageTypeTost.fail);
        emit(state.copyWith(
            requestState: RequestState.error, msg: failure.message));
      },
      (success) {
        model = success;
        banners = success.data!.banners;
        categories = success.data!.categories;
        ads = success.data!.ads;

        if (banners.isEmpty) {
          emit(state.copyWith(
              requestState: RequestState.empty,
              msg: 'No data available',
              errorType: ErrorType.empty));
        } else {
          emit(state.copyWith(
              requestState: RequestState.done,
              msg: '',
              errorType: ErrorType.none));
        }

        // emit(state.copyWith(requestState: RequestState.done));
      },
    );
  }

  Future<Either<HelperResponse, HomeModel>> data() async {
    final response = await DioServices.instance.get(AppConstants.home);
    return response.toEitherWithMapper((data) {
      return HomeModel.fromJson(data);
    });
    // return response.toEither().map((data) {
    //   return HomeModel.fromJson(data);
    // });
  }
}
