import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// ignore: must_be_immutable
class OrderItemTile extends StatefulWidget {
    OrderItemTile({
    super.key, 
    required this.itemCName, 
    required this.itemName, 
    required this.imagePath, 
      
    required this.onPressed, 
    });


  final String itemCName;
  final String itemName;
  final String imagePath;
   
  void Function()? onPressed;

 
  
  
 

  @override
  State<OrderItemTile> createState() => _OrderItemTileState();
}

class _OrderItemTileState extends State<OrderItemTile> {

  bool status = false;


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
        child: Row(          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [               
            SizedBox(height: 10,),
            SizedBox(
              width: 200,
              child: Column(             
                children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    widget.itemCName,
                    style: GoogleFonts.redRose(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),                   
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                  widget.itemName,
                  style: GoogleFonts.redRose(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ), 
                        ],
                      ),
            ),
        
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset(
                widget.imagePath,                
              ),
            ),  
      
      
            MaterialButton(
             onPressed: widget.onPressed,
             child:  Icon(
              status ? Icons.favorite: Icons.favorite_border,
             color:status ? Colors.red : Colors.grey,
            )    
          ),
      
                   
           
           
                                     
        ],),
      ),
    );
  }

}





