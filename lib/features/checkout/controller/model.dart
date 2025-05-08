
class CheckoutModel {
  final String id;
  final double subtotal;
  final double shipping;
  final double total;
  final String paymentMethod;
  final Address shippingAddress;

  CheckoutModel({
    required this.id,
    required this.subtotal,
    required this.shipping,
    required this.total,
    required this.paymentMethod,
    required this.shippingAddress,
  });
}

class Address {
  final String name;
  final String street;
  final String city;
  final String phone;

  Address({
    required this.name,
    required this.street,
    required this.city,
    required this.phone,
  });
}
