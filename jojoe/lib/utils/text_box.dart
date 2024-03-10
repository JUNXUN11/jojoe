import 'package:flutter/material.dart';
import 'package:jojoe/utils/size_config.dart';

// ignore: must_be_immutable
class MyTextBox extends StatelessWidget {
  const MyTextBox({
    super.key, 
    required this.section, 
    required this.text,
    required this.onPressed
    }
  );

  final String section;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 25,
          spreadRadius: 0.00,
        )],
      ),
      padding: const EdgeInsets.only(left: 15 , bottom: 15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(section),

              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
              )
            ],
          ),
          Text(text),
        ],
      ),
    );
  }
}