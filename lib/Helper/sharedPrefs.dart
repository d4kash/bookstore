import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static addCartData(List data) async {
    var encodedData = json.encode(data);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cartData', encodedData);
  }

  static  getCartData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('cartData');
    var decodedData = json.encode(data);
    return decodedData;
  }
}
