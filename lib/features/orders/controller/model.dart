
enum OrderStatus {
  current,
  completed,
  delivered
}

class Order {
  final String id;
  final String orderNumber;
  final DateTime orderDate;
  final OrderStatus status;
  final double total;

  Order({
    required this.id,
    required this.orderNumber,
    required this.orderDate,
    required this.status,
    required this.total,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      orderNumber: json['orderNumber'],
      orderDate: DateTime.parse(json['orderDate']),
      status: OrderStatus.values.firstWhere(
        (e) => e.toString() == 'OrderStatus.${json['status']}',
        orElse: () => OrderStatus.current,
      ),
      total: json['total'].toDouble(),
    );
  }
}
