import 'dart:math';

import 'package:bookstore/Components/CustomButton.dart';
import 'package:bookstore/Components/scaffold_page.dart';
import 'package:bookstore/Controller/product_controller.dart';
import 'package:bookstore/GlobalVariables/constant_page.dart';
import 'package:bookstore/Helper/sharedPrefs.dart';
import 'package:bookstore/Screens/Cart/CheckoutPage.dart';
import 'package:bookstore/Screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final ProductController productController = Get.find<ProductController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getCartData();
    
    // productController.cartSubTotal();
  }

  void getCartData() async {
    try {
    var data = await Helper.getCartData();
    var cartItem = await Helper.getCartItem();
    productController.cartProducts.value = data;
    productController.itemCount.value = cartItem;

    print(data);
    print(cartItem);
      
    } catch (e) {
      print("error: ${e.toString()}"); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPageScaffold(
      heading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 30,
                      color: Colors.red[600],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    })),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20),
              child: Row(
                children: [
                  Text(
                    'Bag',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[600]),
                  ),
                  SizedBox(width: 6,),
                  Obx(() => Align(
alignment: Alignment.bottomCenter,
                    child: Text(
                                        '(${productController.cartProducts.length})',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
      body: Expanded(
        child: Column(
          children: [
            Expanded(
              child: Obx(() => SizedBox(
                    child: productController.cartProducts.length <= 0
                        ? const Center(child: Text('Your Bag is Empty',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: productController.cartProducts.length > 0
                                ? productController.cartProducts.length
                                : 0,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                  height: Constant.height / 4,
                                  child: Card(
                                      child: Row(
                                    children: [
                                      SizedBox(
                                        height: Constant.height,
                                        width: Constant.width / 3,
                                        child: Image(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                productController
                                                        .cartProducts[index]
                                                    ['image'])),
                                      ),
                                      SizedBox(
                                        width: Constant.width / 1.70,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, left: 12),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topCenter,
                                                child: Text(
                                                    productController
                                                            .cartProducts[index]
                                                        ['title'],
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    '\$ ${productController.cartProducts[index]['price']}',
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: SizedBox(
                                                  height: Constant.height / 12,
                                                  width: Constant.width,
                                                  child: Obx(
                                                    () => Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: <Widget>[
                                                        productController
                                                                        .itemCount[
                                                                    index] <
                                                                2
                                                            ? Container()
                                                            : _decrementButton(
                                                                productController
                                                                        .itemCount[
                                                                    index],
                                                                index),
                                                        Text(
                                                          '${productController.itemCount[index]}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      18.0),
                                                        ),
                                                        _incrementButton(
                                                            productController
                                                                    .itemCount[
                                                                index],
                                                            index),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 12.0),
                                                          child: IconButton(
                                                              icon: Icon(
                                                                Icons.delete,
                                                                size: 30,
                                                                color: Colors
                                                                    .red[600],
                                                              ),
                                                              onPressed: () {
                                                                productController.updateCartSubTotal(
                                                                    productController
                                                                            .cartProducts[index]
                                                                        [
                                                                        'price'],
                                                                    index);
                                                                productController
                                                                    .removeFromCart(
                                                                        productController
                                                                            .cartProducts[index],
                                                                        index);
                                                                debugPrint(
                                                                    "deleted");
                                                              }),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )));
                            }),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20,right: 20),
              child: Obx(() => Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                        ' SubTotal:',
                        style: TextStyle(
                            fontSize: Constant.width/20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(width: Constant.width/30,),
                  Text(
                        ' \$ ${productController.subTotal.value.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: Constant.width/20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[600]),
                      ),
                ],
              )),
            ),
            SizedBox(
              height: Constant.height / 35,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 35.0),
              child: Obx(() => CustomButton(
                    onTap: productController.subTotal.value <= 0.0 ||productController.cartProducts.length>5
                        ? null
                        : () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CheckoutPage(
                                        subtotal: productController
                                            .subTotal.value
                                            .toStringAsFixed(2))));
                          },
                    buttonText: 'Procceed to Checkout',
                  )),
            ),
            // Container(child: Text(widget.bookDetails.toString())),
          ],
        ),
      ),
    );
  }

  Widget _incrementButton(int index, tag) {
    // Random random = Random();

    return FloatingActionButton(
      heroTag: tag,
      child: const Icon(Icons.add, color: Colors.black87),
      backgroundColor: Colors.white,
      onPressed: () async {
        productController.itemCount[tag]++;
        await Helper.addCartItem(productController.itemCount);
        // print(productController.itemCount[tag]);
        productController.subTotal +
            (double.parse(productController.cartProducts[tag]['price']));
        // print(productController.subTotal);
        // setState(() {
        //   numberOfItems[index]++;
        // });
      },
    );
  }

  Widget _decrementButton(int index, tag) {
    // Random random = Random();
    return FloatingActionButton(
        heroTag: tag + 1,
        onPressed: () async {
          if (productController.itemCount[tag] > 0) {
            productController.itemCount[tag]--;
            await Helper.addCartItem(productController.itemCount);
            productController.subTotal -
                (double.parse(productController.cartProducts[tag]['price']));
          }
          // setState(() {
          //   numberOfItems[index]--;
          // });
        },
        child: const Icon(Icons.remove, color: Colors.black),
        backgroundColor: Colors.white);
  }
}
