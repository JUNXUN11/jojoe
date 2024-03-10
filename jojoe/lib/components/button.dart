import 'package:flutter/material.dart';
import 'package:jojoe/theme/color.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.text});

  final String text;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
    padding: EdgeInsets.all(20),

    child: Row(
      children: [
      Text(
        text,
        style: TextStyle(color: Colors.white),
      ),

      const SizedBox(width: 10,),

      Icon(
        Icons.arrow_forward,
        color: Colors.white,
      )
    ]),
    );
  }
}