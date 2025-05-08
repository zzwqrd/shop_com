
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../gen/locale_keys.g.dart';
import '../../../commonWidget/shimmer/product_shimmer.dart';
import '../../../di/service_locator.dart';
import '../controller/controller.dart';
import '../controller/state.dart';
import '../controller/model.dart';
import '../widgets/order_card.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OrdersCubit>()..getOrders(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.orders_title.tr()),
            bottom: TabBar(
              tabs: [
                Tab(text: 'الحالية'),
                Tab(text: 'المنتهية'),
                Tab(text: 'تم التسليم'),
              ],
            ),
          ),
          body: BlocBuilder<OrdersCubit, OrdersState>(
            builder: (context, state) {
              if (state is OrdersLoading) {
                return const ProductShimmer();
              } else if (state is OrdersLoaded) {
                return TabBarView(
                  children: [
                    _OrderList(
                      orders: context.read<OrdersCubit>().filterOrdersByStatus(
                            state.orders,
                            OrderStatus.current,
                          ),
                    ),
                    _OrderList(
                      orders: context.read<OrdersCubit>().filterOrdersByStatus(
                            state.orders,
                            OrderStatus.completed,
                          ),
                    ),
                    _OrderList(
                      orders: context.read<OrdersCubit>().filterOrdersByStatus(
                            state.orders,
                            OrderStatus.delivered,
                          ),
                    ),
                  ],
                );
              } else if (state is OrdersError) {
                return Center(
                  child: Text(state.message),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

class _OrderList extends StatelessWidget {
  final List<Order> orders;

  const _OrderList({required this.orders});

  @override
  Widget build(BuildContext context) {
    return orders.isEmpty
        ? Center(
            child: Text(LocaleKeys.orders_no_orders.tr()),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return OrderCard(order: orders[index]);
            },
          );
  }
}
