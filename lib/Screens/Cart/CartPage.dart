import 'dart:math';

import 'package:bookstore/Components/CustomButton.dart';
import 'package:bookstore/Components/scaffold_page.dart';
import 'package:bookstore/Controller/product_controller.dart';
import 'package:bookstore/GlobalVariables/constant_page.dart';
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
    // productController.cartSubTotal();
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
              child: Text(
                'Bag',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[600]),
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
                        ? Center(child: Text('Empty cart'))
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
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    '\$ ${productController.cartProducts[index]['price']}',
                                                    style: TextStyle(
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
                                                        _decrementButton(
                                                            productController
                                                                .itemCount
                                                                .value),
                                                        Text(
                                                          '${productController.itemCount}',
                                                          style: TextStyle(
                                                              fontSize: 18.0),
                                                        ),
                                                        _incrementButton(
                                                            productController
                                                                .itemCount
                                                                .value),
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
                                                                        'price']);
                                                                productController
                                                                    .removeFromCart(
                                                                        productController
                                                                            .cartProducts[index]);
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
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Obx(() => Text(
                    ' SubTotal : \$ ${productController.subTotal.value.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[600]),
                  )),
            ),
            SizedBox(
              height: Constant.height / 35,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 35.0),
              child: Obx(() => CustomButton(
                              onTap:productController.subTotal.value<=0.0?null: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CheckoutPage(
                                            subtotal: productController.subTotal.value
                                                .toStringAsFixed(2))));
                              },
                              buttonText: 'Checkout',
                            )),
            ),
            // Container(child: Text(widget.bookDetails.toString())),
          ],
        ),
      ),
    );
  }

  Widget _incrementButton(int index) {
    Random random = Random();

    return FloatingActionButton(
      heroTag: random.nextInt(500).toString(),
      child: Icon(Icons.add, color: Colors.black87),
      backgroundColor: Colors.white,
      onPressed: () {
        productController.itemCount.value++;
        // setState(() {
        //   numberOfItems[index]++;
        // });
      },
    );
  }

  Widget _decrementButton(int index) {
    Random random = Random();
    return FloatingActionButton(
        heroTag: random.nextInt(500).toString(),
        onPressed: () {
          if (productController.itemCount.value > 0) {
            productController.itemCount.value--;
          }
          // setState(() {
          //   numberOfItems[index]--;
          // });
        },
        child: Icon(Icons.remove, color: Colors.black),
        backgroundColor: Colors.white);
  }
}
