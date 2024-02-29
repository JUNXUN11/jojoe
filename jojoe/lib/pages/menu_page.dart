import 'package:flutter/material.dart';
import 'package:jojoe/components/menu_item_tile.dart';
import 'package:jojoe/model/menu_model.dart';
import 'package:jojoe/pages/food_details.dart';
import 'package:jojoe/theme/color.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 55),
            child: Text(
                  'Main Menu',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: primaryColor
                  ),
                ),
          ),
        ),
      ),

      body: Column(          
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [                                                                      
          //menu 
          Expanded(
            child: Consumer<MenuModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  itemCount: value.menuItems.length,
              padding: EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context,index){
                return MenuItemTile(
                      itemName: value.menuItems[index].name, 
                      itemCName: value.menuItems[index].cname,
                      imagePath: value.menuItems[index].url,
                      price : value.menuItems[index].price, 
                      onPressed: (){ 
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                          FoodDetails(menu: value.menuItems[index]),
                          )
                        );
          
                      },        
                  );
                }              
                );
              },
            ),           
          ),
        SizedBox(height: 25,),
        ]
      )
    );

  }
}