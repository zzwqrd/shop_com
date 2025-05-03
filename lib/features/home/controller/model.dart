import 'package:equatable/equatable.dart';

class HomeModel extends Equatable {
  const HomeModel({
    required this.message,
    required this.data,
  });

  final String message;
  final Data? data;

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      message: json["message"] ?? "",
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class Data extends Equatable {
  const Data({
    required this.banners,
    required this.ads,
    required this.categories,
    required this.popularProducts,
    required this.justForYou,
  });

  final List<Ad> banners;
  final List<Ad> ads;
  final List<Category> categories;
  final List<Product> popularProducts;
  final JustForYou? justForYou;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      banners: json["banners"] == null
          ? []
          : List<Ad>.from(json["banners"]!.map((x) => Ad.fromJson(x))),
      ads: json["ads"] == null
          ? []
          : List<Ad>.from(json["ads"]!.map((x) => Ad.fromJson(x))),
      categories: json["categories"] == null
          ? []
          : List<Category>.from(
              json["categories"]!.map((x) => Category.fromJson(x))),
      popularProducts: json["popular_products"] == null
          ? []
          : List<Product>.from(
              json["popular_products"]!.map((x) => Product.fromJson(x))),
      justForYou: json["just_for_you"] == null
          ? null
          : JustForYou.fromJson(json["just_for_you"]),
    );
  }

  @override
  List<Object?> get props => [
        banners,
        ads,
        categories,
        popularProducts,
        justForYou,
      ];
}

class Ad extends Equatable {
  const Ad({
    required this.id,
    required this.title,
    required this.thumbnail,
  });

  final int id;
  final String title;
  final String thumbnail;

  factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      thumbnail: json["thumbnail"] ?? "",
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        thumbnail,
      ];
}

class Category extends Equatable {
  const Category({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.subCategories,
  });

  final int id;
  final String name;
  final String thumbnail;
  final List<Category> subCategories;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      thumbnail: json["thumbnail"] ?? "",
      subCategories: json["sub_categories"] == null
          ? []
          : List<Category>.from(
              json["sub_categories"]!.map((x) => Category.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        thumbnail,
        subCategories,
      ];
}

class JustForYou extends Equatable {
  const JustForYou({
    required this.total,
    required this.products,
  });

  final int total;
  final List<Product> products;

  factory JustForYou.fromJson(Map<String, dynamic> json) {
    return JustForYou(
      total: json["total"] ?? 0,
      products: json["products"] == null
          ? []
          : List<Product>.from(
              json["products"]!.map((x) => Product.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        total,
        products,
      ];
}

class Product extends Equatable {
  const Product({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.price,
    required this.discountPrice,
    required this.discountPercentage,
    required this.rating,
    required this.totalReviews,
    required this.totalSold,
    required this.quantity,
    required this.isFavorite,
    required this.sizes,
    required this.colors,
    required this.units,
    required this.brand,
  });

  final int id;
  final String name;
  final String thumbnail;
  final double price;
  final double discountPrice;
  final double discountPercentage;
  final double rating;
  final String totalReviews;
  final String totalSold;
  final int quantity;
  final bool isFavorite;
  final List<Size> sizes;
  final List<Color> colors;
  final dynamic units;
  final String brand;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      thumbnail: json["thumbnail"] ?? "",
      price: json["price"] ?? 0,
      discountPrice: json["discount_price"] ?? 0,
      discountPercentage: json["discount_percentage"] ?? 0.0,
      rating: json["rating"] ?? 0.0,
      totalReviews: json["total_reviews"] ?? "",
      totalSold: json["total_sold"] ?? "",
      quantity: json["quantity"] ?? 0,
      isFavorite: json["is_favorite"] ?? false,
      sizes: json["sizes"] == null
          ? []
          : List<Size>.from(json["sizes"]!.map((x) => Size.fromJson(x))),
      colors: json["colors"] == null
          ? []
          : List<Color>.from(json["colors"]!.map((x) => Color.fromJson(x))),
      units: json["units"],
      brand: json["brand"] ?? "",
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        thumbnail,
        price,
        discountPrice,
        discountPercentage,
        rating,
        totalReviews,
        totalSold,
        quantity,
        isFavorite,
        sizes,
        colors,
        units,
        brand,
      ];
}

class Color extends Equatable {
  const Color({
    required this.id,
    required this.name,
    required this.colorCode,
  });

  final int id;
  final String name;
  final String colorCode;

  factory Color.fromJson(Map<String, dynamic> json) {
    return Color(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      colorCode: json["color_code"] ?? "",
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        colorCode,
      ];
}

class Size extends Equatable {
  const Size({
    required this.id,
    required this.name,
    required this.price,
  });

  final int id;
  final String name;
  final double price;

  factory Size.fromJson(Map<String, dynamic> json) {
    return Size(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      price: json["price"] ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        price,
      ];
}
