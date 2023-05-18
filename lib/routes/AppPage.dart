import 'package:bookstore/Screens/Cart/CartPage.dart';
import 'package:bookstore/Screens/HomePage.dart';
import 'package:get/get.dart';

class AppPage {
  static String homePage = '/';
  static String cartPage = '/cart';

  static String getHomeRoute() => homePage;
  static String getCartRoute() => cartPage;

  static List<GetPage> getPage = [
    GetPage(name: homePage, page: () => const HomePage()),
    GetPage(name: cartPage, page: () => const CartPage())
  ];
}
