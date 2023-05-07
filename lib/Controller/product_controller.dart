import 'dart:convert';

import 'package:bookstore/Widgets/Custom_widget.dart';
import 'package:bookstore/models/CartPriceModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// import '../custom_widgets.dart';

class ProductController extends GetxController {
  //you can declare variable in this way too
  //RxBool isWorking=false.obs;

  var isWorking = false.obs;
  var productsList = [].obs;
  var products = {}.obs;
  var favList = [].obs;
  var isFav = false.obs;
  var isAddedToCart = false.obs;
  var selectedProduct = {};
  var cartProducts = [].obs;
  var itemCount = 1.obs;
  var subTotal = 0.0.obs;

  addRemoveToFavorite() async {
    if (favList.contains(selectedProduct['id'])) {
      favList.remove(selectedProduct['id']);
      isFav.value = false;
    } else {
      favList.add(selectedProduct['id']);
      isFav.value = true;
    }
  }

  checkFavorite() {
    if (favList.contains(selectedProduct['id'])) {
      isFav.value = true;
    } else {
      isFav.value = false;
    }
  }

  addToCart() async {
    if (!cartProducts.contains(selectedProduct)) {
      cartProducts.add(selectedProduct);
      isAddedToCart.value = true;
      cartSubTotal();
    } else {
      showSnackBar(title: 'Opps', message: 'Product Already In Cart');
    }
  }

  removeFromCart(product) async {
    if (cartProducts.contains(product)) {
      cartProducts.remove(product);
    }
  }

  checkCart() {
    if (cartProducts.contains(selectedProduct)) {
      isAddedToCart.value = true;
    } else {
      isAddedToCart.value = false;
    }
  }

  cartSubTotal() async {
    if (cartProducts.isNotEmpty) {
      var data = json.encode(cartProducts.value);
      final cartPriceModel = cartPriceModelFromJson(data);
      // cartProducts.forEach((element) {
      cartPriceModel.forEach((element) {
          // print(element.price);
          // var totalPrice = 
          subTotal + element.price;
      });
    
      //   // subTotal.value + element.price;
      // });
      print(subTotal.value.toString());
    }
  }
}
