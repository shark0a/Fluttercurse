// To parse this JSON data, do
//
//     final proudctModel = proudctModelFromJson(jsonString);

import 'dart:convert';

ProudctModel proudctModelFromJson(String str) =>
    ProudctModel.fromJson(json.decode(str));

String proudctModelToJson(ProudctModel data) => json.encode(data.toJson());

class ProudctModel {
  final int id;
  final List<Product> products;
  final int total;
  final int discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  ProudctModel({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory ProudctModel.fromJson(Map<String, dynamic> json) => ProudctModel(
        id: json["id"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        discountedTotal: json["discountedTotal"],
        userId: json["userId"],
        totalProducts: json["totalProducts"],
        totalQuantity: json["totalQuantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "total": total,
        "discountedTotal": discountedTotal,
        "userId": userId,
        "totalProducts": totalProducts,
        "totalQuantity": totalQuantity,
      };
}

class Product {
  final int id;
  final String title;
  final int price;
  final int quantity;
  final int total;
  final double discountPercentage;
  final int discountedPrice;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedPrice,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        quantity: json["quantity"],
        total: json["total"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        discountedPrice: json["discountedPrice"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "quantity": quantity,
        "total": total,
        "discountPercentage": discountPercentage,
        "discountedPrice": discountedPrice,
        "thumbnail": thumbnail,
      };
}
