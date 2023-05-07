import 'package:bookstore/Screens/HomePage.dart';
import 'package:flutter/material.dart';

import '../../Components/scaffold_page.dart';

class CheckoutPage extends StatefulWidget {
  final String subtotal;
  const CheckoutPage({super.key, required this.subtotal});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
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
                'checkout',
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
            Container(child: Text(widget.subtotal),)
            // Container(child: Text(widget.bookDetails.toString())),
          ],
        ),
      ),
    );
  }
}
