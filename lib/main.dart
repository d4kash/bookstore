import 'package:bookstore/Controller/controller_binding.dart';
import 'package:bookstore/Screens/Cart/CartPage.dart';
import 'package:bookstore/Screens/HomePage.dart';
import 'package:bookstore/models/bookModel.dart';
import 'package:bookstore/routes/AppPage.dart';
import 'package:bookstore/routes/AppRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/BookDetails.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  // overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor mycolor = MaterialColor(Colors.red.value, <int, Color>{
      50: Colors.red.withOpacity(0.1),
      100: Colors.red.withOpacity(0.2),
      200: Colors.red.withOpacity(0.3),
      300: Colors.red.withOpacity(0.4),
      400: Colors.red.withOpacity(0.5), 
      500: Colors.red.withOpacity(0.6),
      600: Colors.red.withOpacity(0.7),
      700: Colors.red.withOpacity(0.8),
      800: Colors.red.withOpacity(0.9),
      900: Colors.red.withOpacity(1),
    },
  ); 
 
    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      debugShowCheckedModeBanner: false,
      routes: AppPages.routes,
      title: 'BookStore',
      theme: ThemeData(
        primarySwatch: mycolor,
        textTheme: GoogleFonts.robotoTextTheme()
      ),
      home: const HomePage(),
      // home:  BookDetails(bookDetails: bookModelNew,),
    );
  }
}
