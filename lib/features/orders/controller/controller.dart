
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model.dart';
import 'state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  Future<void> getOrders() async {
    try {
      emit(OrdersLoading());
      // TODO: Implement API call
      final orders = [
        Order(
          id: '1',
          orderNumber: '#ORD001',
          orderDate: DateTime.now(),
          status: 'pending',
          total: 299.99,
        ),
        // Add more mock data as needed
      ];
      emit(OrdersLoaded(orders));
    } catch (e) {
      emit(OrdersError(e.toString()));
    }
  }
}
