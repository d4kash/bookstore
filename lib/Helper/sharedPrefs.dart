import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static addCartData(List data) async {
    var encodedData = json.encode(data);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cartData', encodedData);
  }

  static getCartData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('cartData');
    var decodedData = json.decode(data!);
    return decodedData ?? [];
  }

  static addCartItem(List data) async {
    var encodedData = json.encode(data);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cartItem', encodedData);
  }

  static getCartItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('cartItem');
    var decodedData = json.decode(data!);
    return decodedData ?? [];
  }

  static itemSubTotal(double data) async {
    // var encodedData = json.encode(data);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('itemSubTotal', data);
  }

  static getItemSubTotal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getDouble('itemSubTotal');
    // var decodedData = json.decode(data!);
    return data ?? 0.0;
  }
}
