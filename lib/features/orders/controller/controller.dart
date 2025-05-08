
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../di/service_locator.dart';
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
          status: OrderStatus.current,
          total: 299.99,
        ),
        Order(
          id: '2',
          orderNumber: '#ORD002',
          orderDate: DateTime.now().subtract(const Duration(days: 1)),
          status: OrderStatus.completed,
          total: 199.99,
        ),
        Order(
          id: '3',
          orderNumber: '#ORD003',
          orderDate: DateTime.now().subtract(const Duration(days: 2)),
          status: OrderStatus.delivered,
          total: 399.99,
        ),
      ];
      emit(OrdersLoaded(orders));
    } catch (e) {
      emit(OrdersError(e.toString()));
    }
  }

  List<Order> filterOrdersByStatus(List<Order> orders, OrderStatus status) {
    return orders.where((order) => order.status == status).toList();
  }
}
