import 'package:flutter/material.dart';
import 'package:jojoe/model/menu.dart';




class MenuModel extends ChangeNotifier{

  //menu list
  final List <Menu> _menuItems = [
    
    Menu(cname: "燒鷄飯", name: "chicken rice", url: "lib/images/shaojifan.png",price: 7,selected: false),
    Menu(cname: "白雞飯", name: "Hainan chicken rice", url: "lib/images/baijifan.png",price: 7,selected: false),
    Menu(cname: "叉燒飯", name: "Barbecue pork rice", url: "lib/images/chashaofan.png",price: 8,selected: false),
    Menu(cname: "燒肉飯", name: "Roast pork rice", url: "lib/images/shaoroufan.png",price: 8,selected: false),
    Menu(cname: "三拼飯", name: "Threesome rice", url: "lib/images/sanping.png",price: 10,selected: false),
    
  ];

  final List <Menu> _specialMenuItems = [
    Menu(cname: "炒飯", name: "fried rice", url: "lib/images/chaofan.png",price: 7,selected: false),
    Menu(cname: "滷肉飯", name: "Braised pork rice", url: "lib/images/luroufan.png",price: 9,selected: false),
  ];

  //cart list
  final List <Menu> _cartItems = [
    
  ];

  get menuItems => _menuItems;
  get specialMenuItems => _specialMenuItems;
  get cartItems => _cartItems;
  
  //add
  void addItemToCart(Menu menu , int quantity){  
    for(int i = 0 ; i < quantity ; i++) {
       _cartItems.add(menu);
    } 
    notifyListeners();  
  }
  
  //remove
   void removeItemFromCart(Menu menu){
    _cartItems.remove(menu);
    notifyListeners();   
  }

  //calculate
  String calculatePrice(){
    double totalPrice = 0 ;
    for(int i = 0 ; i < _cartItems.length ; i++){
      totalPrice += _cartItems[i].price;
    }
    return totalPrice.toStringAsFixed(2);
  }
}