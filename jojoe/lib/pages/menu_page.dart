import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jojoe/components/menu_item_tile.dart';
import 'package:jojoe/components/slide_bar.dart';
import 'package:jojoe/model/menu_model.dart';
import 'package:jojoe/pages/food_details.dart';
import 'package:jojoe/theme/color.dart';
import 'package:jojoe/utils/size_config.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int num = 0 ;
  
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);

    return Scaffold(
      appBar: AppBar(
        /*title: Center(
          child: Padding(
            padding:  EdgeInsets.only(right: ScreenSize.horizontal! * 12),
            child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: primaryColor
                  ),
                ),
          ),
        ),*/
      ),

      body: SafeArea(
        child: Column(          
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
                    
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.horizontal!),
            child: Center(
              child: Text(
                'MENU',
                style: GoogleFonts.oswald(
                  fontWeight: FontWeight.bold,
                  fontSize: 50
                ),
              ),
            ),
          ),

          SizedBox(height: ScreenSize.vertical! * 4), 

          SlideBar(
            categories: ['Classic Menu','Special Menu','Side Dish','Drinks'], 
            onTap: (index){
              setState(() {
                num = index;
              });
            },
          ), 

          Container(
            child: 
            (num == 0) ?
              Menu()
            : (num == 1)
              ? SpecialMenu()
              : Menu(),
          ),                                                                          
            
          SizedBox(height: ScreenSize.vertical! *3,),
          ]
        ),
      )
    );

  }
}

class SpecialMenu extends StatelessWidget {
  const SpecialMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<MenuModel>(
        builder: (context, value, child) {
          return GridView.builder(
            itemCount: value.specialMenuItems.length,
        padding: EdgeInsets.all(ScreenSize.vertical! * 2),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context,index){
          return MenuItemTile(
                itemName: value.specialMenuItems[index].name, 
                itemCName: value.specialMenuItems[index].cname,
                imagePath: value.specialMenuItems[index].url,
                price : value.specialMenuItems[index].price, 
                onPressed: (){ 
                  final menumodel = context.read<MenuModel>();
                  final choosemenu = menumodel.specialMenuItems;
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                    FoodDetails(menu: choosemenu[index]),
                    )
                  );
    
                },        
            );
          }              
          );
        },
      ),           
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<MenuModel>(
        builder: (context, value, child) {
          return GridView.builder(
            itemCount: value.menuItems.length,
        padding: EdgeInsets.all(ScreenSize.vertical! * 2 ),
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
                  final menumodel = context.read<MenuModel>();
                  final choosemenu = menumodel.menuItems;
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                    FoodDetails(menu: choosemenu[index]),
                    )
                  );
    
                },        
            );
          }              
          );
        },
      ),           
    );
  }
}