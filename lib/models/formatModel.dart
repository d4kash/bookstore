import 'dart:convert';

class FormatModel {
  final List availableFormat;

  FormatModel(this.availableFormat);

  Map<String, dynamic> toMap() {
    return {
      'availableFormat': availableFormat,
    };
  }

  factory FormatModel.fromMap(Map<String, dynamic> map) {
    // if (map == null) return null;

    return FormatModel(
      List.from(map['availableFormat']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FormatModel.fromJson(String source) =>
      FormatModel.fromMap(json.decode(source));
}
