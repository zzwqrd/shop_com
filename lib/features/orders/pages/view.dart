
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../gen/locale_keys.g.dart';
import '../../../commonWidget/shimmer/product_shimmer.dart';
import '../controller/controller.dart';
import '../controller/state.dart';
import '../widgets/order_card.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit()..getOrders(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.orders_title.tr()),
        ),
        body: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            if (state is OrdersLoading) {
              return const ProductShimmer();
            } else if (state is OrdersLoaded) {
              return state.orders.isEmpty
                  ? Center(
                      child: Text(LocaleKeys.orders_no_orders.tr()),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.orders.length,
                      itemBuilder: (context, index) {
                        return OrderCard(order: state.orders[index]);
                      },
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
    );
  }
}
