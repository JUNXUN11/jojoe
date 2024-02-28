import 'package:flutter/material.dart';
import 'package:jojoe/model/menu.dart';




class MenuModel extends ChangeNotifier{

  //menu list
  final List <Menu> _menuItems = [
    /*["咕嚕肉","Sweet and Sour Pork","lib/images/gulurou.png",],
    ["煎蛋","Fried Egg","lib/images/egg.png"],
    ["大白菜","Vegetables","lib/images/vege.png"],
    ["飯","Rice","lib/images/rice.png"],*/
   
    Menu(name: "咕嚕肉", cname: "Sweet and Sour Pork", url: "lib/images/gulurou.png",selected: false),
    Menu(name: "煎蛋", cname: "Fried Egg", url: "lib/images/egg.png",selected: false),
    Menu(name: "大白菜", cname: "Vegetables", url: "lib/images/vege.png",selected: false),
    Menu(name: "飯", cname: "Rice", url: "lib/images/rice.png",selected: false)

   

  ];

  //cart list
  List _cartItems = [];

  get menuItems => _menuItems;
  get cartItems => _cartItems;
  
  //add
  void addItemToCart(int index){    
    _cartItems.add(_menuItems[index]);
    notifyListeners();  
  }
  
  //remove
   void removeItemFromCart(int index){
    _cartItems.remove(_menuItems[index]);
    notifyListeners();   
  }

  //calculate
  String calculatePrice(){
    double totalPrice = 0 ;
    for(int i = 0 ; i < _cartItems.length ; i++){
      totalPrice += 1 ;
    }
    return totalPrice.toStringAsFixed(2);
  }
}