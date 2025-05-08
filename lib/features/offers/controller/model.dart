
class OfferModel {
  final String id;
  final String name;
  final double price;
  final double oldPrice;
  final String image;
  final bool isFavorite;
  final bool isQuickSale;

  OfferModel({
    required this.id,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.image,
    this.isFavorite = false,
    this.isQuickSale = false,
  });
}
