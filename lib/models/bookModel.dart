// To parse this JSON data, do
//
//     final bookModelNew = bookModelNewFromJson(jsonString);

import 'dart:convert';

List<BookModelNew> bookModelNewFromJson(String str) => List<BookModelNew>.from(
    json.decode(str).map((x) => BookModelNew.fromJson(x)));

String bookModelNewToJson(List<BookModelNew> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookModelNew {
  String title;
  String coverImageUrl;
  String priceInDollar;
  List<String>? categories;
  List<String> availableFormat;

  BookModelNew({
    required this.title,
    required this.coverImageUrl,
    required this.priceInDollar,
    this.categories,
    required this.availableFormat,
  });

  factory BookModelNew.fromJson(Map<String, dynamic> json) => BookModelNew(
        title: json["title"],
        coverImageUrl: json["cover_image_url"],
        priceInDollar: json["price_in_dollar"].toString(),
        categories: json["categories"] == null
            ? []
            : List<String>.from(json["categories"]!.map((x) => x)),
        availableFormat:
            List<String>.from(json["available_format"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "cover_image_url": coverImageUrl,
        "price_in_dollar": priceInDollar,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
        "available_format": List<dynamic>.from(availableFormat.map((x) => x)),
      };
}
