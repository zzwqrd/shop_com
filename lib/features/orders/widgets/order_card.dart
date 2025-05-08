import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../gen/locale_keys.g.dart';
import '../controller/model.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${LocaleKeys.orders_order_number.tr()}: ${order.orderNumber}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                _buildStatusChip(context),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '${LocaleKeys.orders_order_date.tr()}: ${DateFormat('dd/MM/yyyy').format(order.orderDate)}',
            ),
            const SizedBox(height: 8),
            Text(
              '${LocaleKeys.orders_order_total.tr()}: \$${order.total.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(LocaleKeys.orders_view_details.tr()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getStatusColor(order.status.name),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        order.status.name.tr(),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'pending':
        return Colors.orange;
      case 'processing':
        return Colors.blue;
      case 'completed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
