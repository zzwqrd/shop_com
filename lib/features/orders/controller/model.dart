
class Order {
  final String id;
  final String orderNumber;
  final DateTime orderDate;
  final String status;
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
      status: json['status'],
      total: json['total'].toDouble(),
    );
  }
}
