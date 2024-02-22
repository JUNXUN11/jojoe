import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItemTile extends StatelessWidget {
  const MenuItemTile({
    super.key, 
    required this.itemName, 
    required this.itemPrice, 
    required this.imagePath, 
    }
  );

  final String itemName;
  final String itemPrice;
  final String imagePath;
  


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
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