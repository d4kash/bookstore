import 'dart:convert';

import 'package:bookstore/Components/CustomButton.dart';
import 'package:bookstore/Components/scaffold_page.dart';
import 'package:bookstore/Controller/product_controller.dart';
import 'package:bookstore/GlobalVariables/constant_page.dart';
import 'package:bookstore/Screens/Cart/CartPage.dart';

import 'package:bookstore/Screens/HomePage.dart';
import 'package:bookstore/Widgets/Custom_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetails extends StatefulWidget {
  final bookDetails;
  const BookDetails({super.key, required this.bookDetails});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  final ProductController productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    // print(widget.bookDetails.title);

    return CustomPageScaffold(
      heading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 28.0, bottom: 8.0),
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
              padding: const EdgeInsets.only(right: 12.0),
              child: cartIcon(productController),
            )
          ],
        ),
      ),
      body: Expanded(
        child: Column(
          children: [
            Card(
              elevation: 2,
              color: Colors.white,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: Constant.height / 2.5,
                      child: Image.network(
                        widget.bookDetails.coverImageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Constant.height / 40,
                          ),
                          Text(
                            widget.bookDetails.title,
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            // overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: Constant.height / 50,
                          ),
                          const Divider(
                            height: 1,
                          ),
                          SizedBox(
                            height: Constant.height / 15,
                            width: Constant.width / 1,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount:
                                    widget.bookDetails.availableFormat.length,
                                itemBuilder: (context, index) {
                                  return Chip(
                                    elevation: 20,
                                    padding: EdgeInsets.all(8),
                                    backgroundColor: Colors.greenAccent[100],
                                    shadowColor: Colors.black,

                                    label: Text(
                                      '${widget.bookDetails.availableFormat[index]}',
                                      style: TextStyle(fontSize: 20),
                                    ), //Text
                                  );
                                }),
                          ),
                          SizedBox(
                            height: Constant.height / 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Constant.height / 30, left: Constant.width / 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: Constant.height / 20,
                  child: Text('Price \$ ${widget.bookDetails.priceInDollar}',
                      style: GoogleFonts.roboto(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(
              height: Constant.height / 25,
            ),
            CustomButton(
              onTap: () {
                // print("tapped");
                productController.selectedProduct = {
                  "image": widget.bookDetails.coverImageUrl,
                  "title": widget.bookDetails.title,
                  "price": widget.bookDetails.priceInDollar,
                };
                productController.addToCart();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
                print(productController.cartProducts);
              },
              buttonText: 'Add to bag',
            ),
            // Container(child: Text(widget.bookDetails.toString())),
          ],
        ),
      ),
    );
  }
}
