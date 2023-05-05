import 'package:bookstore/Components/scaffold_page.dart';
import 'package:bookstore/GlobalVariables/constant_page.dart';
import 'package:bookstore/Screens/HomePage.dart';
import 'package:bookstore/routes/AppPage.dart';
import 'package:bookstore/routes/AppRoute.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  final Map bookDetails;
  const BookDetails({super.key, required this.bookDetails});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
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
          child: Container(child: Text(widget.bookDetails.toString()))),
    );
  }
}
