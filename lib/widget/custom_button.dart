import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';

class CustomButton extends StatelessWidget {
   CustomButton({this.onTap,required this.txt});
String txt;

VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8)
        ),
        width: double.infinity,
        height: 70,
       child:  Center(child: Text(txt),),
        
      ),
    );
  }
}