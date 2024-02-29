import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jojoe/components/button.dart';
import 'package:jojoe/components/menu_item_tile.dart';
import 'package:jojoe/model/menu_model.dart';
import 'package:jojoe/pages/cart_page.dart';
import 'package:jojoe/pages/menu_page.dart';
//import 'package:jojoe/pages/cart_page.dart';
import 'package:jojoe/pages/order_page.dart';
import 'package:jojoe/theme/color.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Center(
          child: Text(
            'Jojoe Chicken Rice',
            style: GoogleFonts.oswald(
              fontWeight: FontWeight.bold
            ),
          )             
        ),
        leading: GestureDetector(
            onTap: (){
              FirebaseAuth.instance.signOut();
            },
          child: Padding(
            padding: const EdgeInsets.only(right:8),
            child: Icon(Icons.logout),
          ),
        ),
        actions: [   
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: Colors.black, 
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
               builder: (context){
               return CartPage();
              },      
            ));
            }
          )
      ],    
    ),
    
    //order button
    floatingActionButton: FloatingActionButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(
        builder: (context){
          return MenuPage();
        },      
      )),
      backgroundColor: Colors.black,
      child: Icon(Icons.food_bank,color: Colors.white,)
    ),
      
      body: Column(       
        children: [
          const SizedBox(height: 20,),
          Wallet(),
        ],
      ),
    );
  }
}

class Wallet extends StatelessWidget {
  const Wallet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), 
        boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          blurRadius: 20,
          spreadRadius: 0.00,
        )
        ]
      ),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
               'Your Wallet Balance',
               style: GoogleFonts.aBeeZee(
                 fontSize:15,
                 fontWeight: FontWeight.bold
               ),              
            ),
            const SizedBox(height: 20,),
              Text(
               'RM 0 ',
               style: GoogleFonts.aBeeZee(
                 fontSize:35,
                 fontWeight: FontWeight.bold
               ),              
            ),
            ],
          ),
          const SizedBox(height: 20,),
                              
          GestureDetector(
           child: MyButton(
             text: 'Reload',
           ),
           onTap: () {            
           },
      ),
        ],
      ),
    );
  }
}