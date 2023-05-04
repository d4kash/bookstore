import 'package:bookstore/GlobalVariables/constant_page.dart';
import 'package:flutter/material.dart';

class CustomPageScaffold extends StatefulWidget {
  final Widget heading;
  final Widget body;
  // final Widget? icon;
  // final Widget? floatingButton;
  const CustomPageScaffold({
    Key? key,
    required this.heading,
    required this.body,
    //  this.icon,
  }) : super(key: key);

  @override
  State<CustomPageScaffold> createState() => _CustomPageScaffoldState();
}

class _CustomPageScaffoldState extends State<CustomPageScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: Constant.height / 27),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Container(
              height: Constant.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: const Alignment(0, 0.1),
                end: const Alignment(0, 0.9),
                colors: [
                  const Color.fromARGB(255, 52, 143, 135),
                  const Color.fromARGB(255, 86, 108, 31).withOpacity(0.5),
                ],
              )),
              child: Column(
                children: [
                  widget.heading,
                  widget.body,
                ],
              )),
        ),
      ),
    );
  }
}
