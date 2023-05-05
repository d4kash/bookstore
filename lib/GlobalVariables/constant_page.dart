import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Constant {
  static double height = Get.size.height;
  static double width = Get.size.width;
  static String jsonUrl = 'assets/book_data/all_books.json';
  static String webJsonUrl = 'book_data/all_books.json';
  static TextStyle googleStyle = GoogleFonts.roboto(fontSize: 12,fontWeight: FontWeight.bold);
}
