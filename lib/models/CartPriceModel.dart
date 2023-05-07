// To parse this JSON data, do
//
//     final cartPriceModel = cartPriceModelFromJson(jsonString);

import 'dart:convert';

List<CartPriceModel> cartPriceModelFromJson(String str) => List<CartPriceModel>.from(json.decode(str).map((x) => CartPriceModel.fromJson(x)));

String cartPriceModelToJson(List<CartPriceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartPriceModel {
    final String image;
    final String title;
    final double price;

    CartPriceModel({
        required this.image,
        required this.title,
        required this.price,
    });

    factory CartPriceModel.fromJson(Map<String, dynamic> json) => CartPriceModel(
        image: json["image"],
        title: json["title"],
        price: double.parse(json["price"]),
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "price": price,
    };
}
