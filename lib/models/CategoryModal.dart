import 'dart:convert';

class CategoryModel {
  final List categories;

  CategoryModel(this.categories);

  Map<String, dynamic> toMap() {
    return {
      'categories': categories,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    // if (map == null) return null;

    return CategoryModel(
      List.from(map['categories']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));
}
