
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model.dart';
import 'state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  void processCheckout(CheckoutModel checkout) async {
    emit(CheckoutLoading());
    try {
      // TODO: Implement checkout API call
      await Future.delayed(Duration(seconds: 2)); // Simulate API call
      emit(CheckoutSuccess());
    } catch (e) {
      emit(CheckoutError(e.toString()));
    }
  }
}
