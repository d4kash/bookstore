import 'package:bookstore/Components/scaffold_page.dart';
import 'package:bookstore/GlobalVariables/constant_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageScaffold(
      heading: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () => Get.off(() => null),
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
            ),
            SizedBox(
              width: Constant.height / 28,
            ),
            Text(
              'Book Store',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Constant.height / 30,
                  wordSpacing: 4),
            ),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
