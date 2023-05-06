import 'dart:convert';

import 'package:bookstore/Components/scaffold_page.dart';
import 'package:bookstore/GlobalVariables/constant_page.dart';

import 'package:bookstore/Screens/HomePage.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetails extends StatefulWidget {
  final bookDetails;
  const BookDetails({super.key, required this.bookDetails});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
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
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 30,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    })),
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
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: Constant.height / 50,
                          ),
                          const Divider(
                            height: 1,
                          ),
                          Text('\$ ${widget.bookDetails.priceInDollar}',
                              style: GoogleFonts.roboto(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
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
            // Container(child: Text(widget.bookDetails.toString())),
          ],
        ),
      ),
    );
  }
}
