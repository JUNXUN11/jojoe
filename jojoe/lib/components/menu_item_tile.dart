import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MenuItemTile extends StatefulWidget {
   MenuItemTile({
    super.key, 
    required this.itemCName, 
    required this.itemName, 
    required this.imagePath,
    required this.price,
    required this.onPressed,  
    }
  );

  final String itemCName;
  final String itemName;
  final String imagePath;
  final double price; 

  void Function()? onPressed;

  @override
  State<MenuItemTile> createState() => _MenuItemTileState();
}

class _MenuItemTileState extends State<MenuItemTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: widget.onPressed,
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
                widget.imagePath,
                height: 50,
              ),
              SizedBox(height: 10,),
              Text(
                widget.itemCName,
                style: GoogleFonts.redRose(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
             //SizedBox(height: 10,),
              Text(
                widget.itemName,
                style: GoogleFonts.redRose(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'RM ${widget.price}'+'0',
                style: GoogleFonts.redRose(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
             /* MaterialButton(
               onPressed: widget.onPressed,
               child:  Icon(
               Icons.arrow_forward,
               color: Colors.black,
              )    
            ),  */                   
          ],),
        ),
      ),
    );
  }
}