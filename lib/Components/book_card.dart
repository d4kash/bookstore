import 'package:bookstore/GlobalVariables/constant_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookCard extends StatelessWidget {
  final String image;
  final String bookName;
  final String price;
  const BookCard({super.key, required this.image, required this.bookName, required this.price});

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
                height: Constant.height / 2.5,
                child: Image.network(
                  image,fit: BoxFit.contain,
                ),
              ),
            ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: [
                    //  SizedBox(height: Constant.height/40,),
                           Text(bookName,style:GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
                           SizedBox(height: Constant.height/50,),
                           Text('\$ $price',style:GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.bold)),
                          //  SizedBox(height: Constant.height/40,),
                   ],
                 ),
               ),
          ],
        ),
      ),
    );
  }
}
