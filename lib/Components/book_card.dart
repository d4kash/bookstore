import 'package:bookstore/GlobalVariables/constant_page.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: Constant.height / 2,
                child: Image.network(
                  'https://images-na.ssl-images-amazon.com/images/I/41k1JwQ6zVL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg',
                ),
              ),
            ),
            Text("Book name"),
            Text('author name')
          ],
        ),
      ),
    );
  }
}
