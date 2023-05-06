import 'package:bookstore/Components/CustomButton.dart';
import 'package:bookstore/Components/scaffold_page.dart';
import 'package:bookstore/GlobalVariables/constant_page.dart';
import 'package:bookstore/Screens/HomePage.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
                    icon:  Icon(
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
              padding: const EdgeInsets.only(right:12.0),
              child: IconButton(
                  icon:  Icon(
                    Icons.shopping_bag_outlined,
                    size: 50,
                    color: Colors.red[600],
                  ),
                  onPressed: () {
                    debugPrint("Pressed");
                  }),
            )
          ],
        ),
      ),
      body: Expanded(
        child: Column(
          children: [

           
           
            SizedBox(height: Constant.height/25,),
            CustomButton(onTap:   () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },buttonText: 'Add to bag',),
            // Container(child: Text(widget.bookDetails.toString())),
          ],
        ),
      ),
    );
  }
}