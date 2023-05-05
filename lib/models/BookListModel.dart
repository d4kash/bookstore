import 'dart:convert';

import 'package:bookstore/models/book_model.dart';

class BookList {
  final List<BookModal> bookList;

  BookList(this.bookList);

  Map<String, dynamic> toMap() {
    return {
      'bookList': bookList?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory BookList.fromMap(Map<String, dynamic> map) {
    // if (map == null) return null;

    return BookList(
      List<BookModal>.from(map['bookList']?.map((x) => BookModal.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookList.fromJson(String source) =>
      BookList.fromMap(json.decode(source));
}
