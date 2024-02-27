import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jojoe/components/menu_item_tile.dart';
import 'package:jojoe/model/menu_model.dart';
import 'package:jojoe/pages/cart_page.dart';
import 'package:jojoe/pages/order_page.dart';
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
          child: Padding(
            padding: const EdgeInsets.only(left:30),
            child: Text(
              'Jojoe Mixed Rice',
              style: GoogleFonts.oswald(
                fontWeight: FontWeight.bold
              ),
            ),
          )             
        ),
        actions: [   
          GestureDetector(
            onTap: (){
              FirebaseAuth.instance.signOut();
            },
          child: Padding(
            padding: const EdgeInsets.only(right:8),
            child: Icon(Icons.logout),
          ),
        ),
      ],    
    ),
    
    //order button
    floatingActionButton: FloatingActionButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(
        builder: (context){
          return CartPage();
        },      
      )),
    backgroundColor: Colors.black,
    child: Icon(Icons.food_bank,color: Colors.white,)
    ),
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [          
              Divider(),             
              SizedBox(height: 5),                                          
              Center(
                child: Text(
                  'Today Main Dish',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),      
              //menu 
              SizedBox(
                height: 400,
                child: Expanded(
                  child: Consumer<MenuModel>(
                    builder: (context, value, child) {
                      return GridView.builder(
                        itemCount: value.menuItems.length,
                    padding: EdgeInsets.all(12),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context,index){
                      return MenuItemTile(
                        itemCName: value.menuItems[index][0],              
                        itemName: value.menuItems[index][1],
                        imagePath: value.menuItems[index][2],                   
                        );}              
                      );
                    },
                  ),           
                ),
              ),
            SizedBox(height: 25,),

           Center(
                child: Text(
                  'Today Side Dish',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),      
        

            SizedBox(
                height: 200,
                child: Expanded(
                  child: Consumer<MenuModel>(
                    builder: (context, value, child) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.menuItems.length,
                    padding: EdgeInsets.all(12),                
                    itemBuilder: (context,index){
                      return MenuItemTile(
                        itemCName: value.menuItems[index][0],              
                        itemName: value.menuItems[index][1],
                        imagePath: value.menuItems[index][2],                   
                        );}              
                      );
                    },
                  ),           
                ),
              ),
           
            
          
            ],
          ),
        ),
      )
    );
  }
}