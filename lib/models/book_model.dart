import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:bookstore/models/CategoryModal.dart';
import 'package:bookstore/models/formatModel.dart';

class BookModal {
  final String title;
  final String coverImage;
  final String priceInDollar;
  final CategoryModel categories;
  final FormatModel availableFormat;

  BookModal(this.title, this.coverImage, this.priceInDollar, this.categories,
      this.availableFormat);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'cover_image_url': coverImage,
      'price_in_dollar': priceInDollar,
      'categories': categories?.toMap(),
      'available_format': availableFormat?.toMap(),
    };
  }

  factory BookModal.fromMap(Map<String, dynamic> map) {
    // if (map == null) return null;

    return BookModal(
      map['title'],
      map['cover_image_url'],
      map['price_in_dollar'],
      CategoryModel.fromMap(map['categories']),
      FormatModel.fromMap(map['available_format']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModal.fromJson(String source) =>
      BookModal.fromMap(json.decode(source));
}
