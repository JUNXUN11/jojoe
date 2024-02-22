import 'package:flutter/material.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
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