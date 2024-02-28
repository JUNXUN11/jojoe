import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jojoe/components/order_item_tile.dart';
import 'package:jojoe/model/menu_model.dart';
import 'package:jojoe/pages/food_details.dart';
import 'package:jojoe/pages/order_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}


  
class _CartPageState extends State<CartPage> {

  bool isPressed = false;
  
  /*void navigateFoodDetails(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context)=> FoodDetails(
       list,
      )
    ));
  }*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(right: 45),
            child: Align(
              alignment: Alignment.center,
              child: Text(           
                'Order',
                style:GoogleFonts.oswald(
                fontWeight: FontWeight.bold)   
              ),
            ),
          )),
        body: 
          SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      'Main Dish',
                      style:GoogleFonts.gloock(
                        fontWeight: FontWeight.bold,
                        fontSize: 38,
                      )
                      
                    ),
                  ],
                ),
                    
                SizedBox(
                  height: 300,
                  child: Expanded(       
                  child: Consumer<MenuModel>(
                    builder: (context, value, child) {
                      return ListView.builder(
                        itemCount: value.menuItems.length,
                    padding: EdgeInsets.all(12),         
                    itemBuilder: (context,index){
                      return OrderItemTile(
                        itemCName: value.menuItems[index].name,              
                        itemName: value.menuItems[index].cname,
                        imagePath: value.menuItems[index].url,
                        onPressed: () {                        
                          Provider.of<MenuModel>(context, listen: false)
                          .addItemToCart(index);                            
                        },
                                                         
                        );             
                        }              
                      );
                    },
                  ),           
                        ),
                ),

                SizedBox(height: 30,),
                
               Column(
                  children: [
                    Text(
                      'Side Dish',
                      style:GoogleFonts.gloock(
                        fontWeight: FontWeight.bold,
                        fontSize: 38,
                      )
                      
                    ),
                  ],
                ),
                SizedBox(
                  height: 300,
                  child: Expanded(       
                  child: Consumer<MenuModel>(
                    builder: (context, value, child) {
                      return ListView.builder(
                        itemCount: value.menuItems.length,
                    padding: EdgeInsets.all(12),         
                    itemBuilder: (context,index){
                      return OrderItemTile(
                        itemCName: value.menuItems[index].cname,             
                        itemName: value.menuItems[index].name,
                        imagePath: value.menuItems[index].url,
                        onPressed: () {   
                                      
                        Provider.of<MenuModel>(context, listen: false)
                        .addItemToCart(index);                                                                    
                        },                                                        
                                           
                        );}              
                      );
                    },
                  ),           
                        ),
                ),

                 SizedBox(height: 30,),

                 Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    
                  ),
                   child: TextButton(                    
                    onPressed:() => Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return OrderPage();
                      },                                  
                    )), child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                      )
                    ),                   
                  ),
                 ),

                SizedBox(height: 30,),
              ],
            ),
          )   
      ),
    );
  }
}