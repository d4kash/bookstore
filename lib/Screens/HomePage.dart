import 'dart:convert';

import 'package:bookstore/Components/book_card.dart';
import 'package:bookstore/Components/scaffold_page.dart';
import 'package:bookstore/Controller/product_controller.dart';
import 'package:bookstore/GlobalVariables/constant_page.dart';
import 'package:bookstore/Helper/sharedPrefs.dart';
import 'package:bookstore/Screens/BookDetails.dart';
import 'package:bookstore/Widgets/Custom_widget.dart';
import 'package:bookstore/models/bookModel.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

// import 'package:searchfield/searchfield.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductController productController = Get.find<ProductController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCartData();
  }

  void getCartData() async {
    try {
      var data = await Helper.getCartData();
      var cartItem = await Helper.getCartItem();
      var prefSubTotal = await Helper.getItemSubTotal();

      productController.cartProducts.value = data;
      productController.itemCount.value = cartItem;
      productController.subTotal.value = prefSubTotal;
    } catch (e) {
      print("error: ${e.toString()}");
    }
  }

  List<Map<String, dynamic>> foundBooks = [];
  List<Map<String, dynamic>> bookCollection = [];
  void _runFilter(String query) {
    List<Map<String, dynamic>> results = [];
    if (query.isEmpty) {
      foundBooks = bookCollection;
    } else {
      foundBooks = bookCollection
          .where((book) =>
              book['title'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {
      // foundBooks = results;
    });

    print("foundBook : $foundBooks");
  }

  @override
  Widget build(BuildContext context) {
    return CustomPageScaffold(
      heading: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28.0, bottom: 8.0),
              child: SizedBox(
                  height: Constant.height / 16,
                  width: Constant.width / 1.5,
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      errorBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(),
                      labelText: 'Search',
                      hintText: 'Search \'Books\'',
                    ),
                  )),
            ),
            cartIcon(productController),
          ],
        ),
      ),
      body: Expanded(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString(kIsWeb ? Constant.webJsonUrl : Constant.jsonUrl),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                // var responseList = jsonDecode(snapshot.data.toString());

                final bookModelNew = bookModelNewFromJson(snapshot.data);
                for (int index = 0; index < bookModelNew.length; index++) {
                  bookCollection.add({
                    ...{
                      "title": bookModelNew[index].title,
                      "coverImageUrl": bookModelNew[index].coverImageUrl,
                      "priceInDollar": bookModelNew[index].priceInDollar,
                    }
                  });
                }
                // print(bookCollection);

                // print(bookModelNew);

                // print(bookModelNew[0].title);
                return CustomGridView(
                  foundBooks: foundBooks,
                  bookModelNew: bookModelNew,
                );
              } else {
                return const Text('Empty data');
              }
            } else {
              return SizedBox(
                  height: Constant.height / 2,
                  width: Constant.width / 2,
                  child: const Text("else"));
            }
          },
        ),
      ),
    );
  }
}

class CustomGridView extends StatelessWidget {
  final foundBooks;
  final bookModelNew;
  const CustomGridView(
      {super.key, required this.foundBooks, required this.bookModelNew});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const ClampingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: SizedBox(
        height: Constant.height,
        child: GridView.builder(
          shrinkWrap: true,
          itemCount:
              foundBooks.isEmpty ? bookModelNew.length : foundBooks.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookDetails(
                            bookDetails: bookModelNew[index],
                          ))),
              child: BookCard(
                image: foundBooks.isEmpty
                    ? bookModelNew[index].coverImageUrl
                    : foundBooks[index]['coverImageUrl'],
                bookName: foundBooks.isEmpty
                    ? bookModelNew[index].title
                    : foundBooks[index]['title'],
                price: foundBooks.isEmpty
                    ? bookModelNew[index].priceInDollar
                    : foundBooks[index]['priceInDollar'],
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 3,
          ),
        ),
      ),
    );
  }
}
