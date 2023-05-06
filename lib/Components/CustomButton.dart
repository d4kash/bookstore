import 'package:bookstore/GlobalVariables/constant_page.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;
  const CustomButton({Key? key, required this.buttonText, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constant.height/10,
      width:Constant.width/1.5,
      child: ElevatedButton(
        style: ButtonStyle(
         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                ),
            ),),
        onPressed:  onTap, child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(buttonText,style:TextStyle(fontSize: Constant.height/30)),
           const  Icon(
                  Icons.shopping_bag_outlined,
                  size: 45,
                  color: Colors.white,
                ),
          ],
        )),
    );
  }
}
