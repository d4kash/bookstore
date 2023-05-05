import 'dart:convert';

import 'package:bookstore/Components/book_card.dart';
import 'package:bookstore/Components/scaffold_page.dart';
import 'package:bookstore/GlobalVariables/constant_page.dart';
import 'package:bookstore/models/BookListModel.dart';
import 'package:bookstore/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// import 'package:searchfield/searchfield.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  child: const TextField(
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(),
                      labelText: 'Search',
                      hintText: 'Search \'Books\'',
                    ),
                  )),
            ),
            IconButton(
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  size: 50,
                  color: Colors.orange,
                ),
                onPressed: () {
                  debugPrint("Pressed");
                })
          ],
        ),
      ),
      body: Expanded(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString(Constant.jsonUrl),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                var data = json.decode(snapshot.data);

                // var mapData =
                //     data.map((job) => new BookModal.fromJson(job)).toList();
                // print(mapData);
                // List<BookModal> products = [];
                // s.forEach((element) {
                //   Map<String, dynamic> ma = jsonDecode(element);
                //   products.add(BookModal.fromJson(ma));
                // });
                // 'cover_image_url': coverImage,
                //'price_in_dollar': priceInDollar,

                // print(listData);
                return SingleChildScrollView(
                  physics: const ClampingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  child: SizedBox(
                    height: Constant.height,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        // var modalData = BookModal.fromMap(data);
                        BookList bookList = BookList.fromJson(data);
                        print(bookList);
                        return const BookCard();
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 3,
                      ),
                    ),
                  ),
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
