import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItemTile extends StatelessWidget {
  const MenuItemTile({
    super.key, 
    required this.itemCName, 
    required this.itemName, 
    required this.imagePath, 
    }
  );

  final String itemCName;
  final String itemName;
  final String imagePath;
  


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 229, 179, 179),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 20,
              spreadRadius: 0.00,
            )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 10,),
            Image.asset(
              imagePath,
              height: 64,
            ),
            SizedBox(height: 10,),
            Text(
              itemCName,
              style: GoogleFonts.redRose(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
           SizedBox(height: 10,),
            Text(
              itemName,
              style: GoogleFonts.redRose(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),           
        ],),
      ),
    );
  }
}