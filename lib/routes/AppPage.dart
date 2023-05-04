import 'package:bookstore/Screens/HomePage.dart';
import 'package:bookstore/main.dart';
import 'package:bookstore/routes/AppRoute.dart';
import 'package:flutter/material.dart';

class AppPages {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    AppRoute.home: (BuildContext context) => const HomePage()
  };
}
