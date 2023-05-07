import 'package:bookstore/Components/CustomButton.dart';
import 'package:bookstore/GlobalVariables/constant_page.dart';
import 'package:bookstore/Screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                'Checkout',
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
            SizedBox(
              height: Constant.height/3,
              child: Text('Total Payable Amount is', style: TextStyle(
                              fontSize: Constant.width/15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),),
            ),

            SizedBox(
               height: Constant.height/3,
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                          ' SubTotal:',
                          style: TextStyle(
                              fontSize: Constant.width/18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(width: Constant.width/30,),
                    Text(
                          ' \$ ${widget.subtotal}',
                          style: TextStyle(
                              fontSize: Constant.width/14,
                              fontWeight: FontWeight.bold,
                              color: Colors.red[600]),
                        ),
                  ],
                ),
            ),Padding(
              padding: const EdgeInsets.only(bottom: 35.0),
              child: CustomButton(
                    onTap: (){},
                       
                    buttonText: 'Make Payment',
                  ),
            ),
            // Container(child: Text(widget.bookDetails.toString())),
          ],
        ),
      ),
    );
  }
}
