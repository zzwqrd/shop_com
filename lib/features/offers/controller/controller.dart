
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model.dart';
import 'state.dart';

class OffersController extends Cubit<OffersState> {
  OffersController() : super(OffersInitial());

  List<OfferModel> offers = [
    OfferModel(
      id: '1',
      name: 'In 1 Body Wash For Men 5',
      price: 32.20,
      oldPrice: 35.00,
      image: 'assets/icons/product.png',
      isQuickSale: false,
    ),
    OfferModel(
      id: '2',
      name: 'Piece Non-Stick Cookware 18',
      price: 308.00,
      oldPrice: 440.00,
      image: 'assets/icons/product.png',
      isQuickSale: true,
    ),
  ];

  void getOffers() {
    emit(OffersLoading());
    try {
      emit(OffersLoaded());
    } catch (e) {
      emit(OffersError(e.toString()));
    }
  }
}
