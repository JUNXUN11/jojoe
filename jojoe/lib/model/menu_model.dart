import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jojoe/model/menu.dart';


final currentUser = FirebaseAuth.instance.currentUser!;

 

void getUserData() async{
  QuerySnapshot querySnapshot = 
    await FirebaseFirestore.instance
    .collection('users')
    .get();

}


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

  final List <Menu> _sideMenuItems =[
    Menu(cname: "叉燒包", name: "Char Siew Pau", url: "lib/images/charsiubao.png",price: 5,selected: false),
  ];

  final List <Menu> _drinksMenuItems=[
    Menu(cname: "咖啡", name: "Kopi Ais", url: "lib/images/kopi.png",price: 4,selected: false),
    Menu(cname: "奶茶", name: "Teh Ais", url: "lib/images/teh.png",price: 4,selected: false),
    Menu(cname: "美露", name: "Milo Ais", url: "lib/images/milo.png",price: 4,selected: false),
  ];

  //cart list
  final List <Menu> _cartItems = [];
    
  
  get menuItems => _menuItems;
  get specialMenuItems => _specialMenuItems;
  get sideMenuItems => _sideMenuItems;
  get drinksMenuItems => _drinksMenuItems;
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

  //remove all after successfully paid
  void removeAllFromCart(){
   for(int i = 0 ; i < _cartItems.length ; i++) {
       _cartItems.remove(_cartItems[i]);
    } 
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

  //check cart empty
  bool isCartEmpty(){
    if(_cartItems.isEmpty){
      return true;
    }
    else{
      return false;
    }   
  }


  Future <void> addToFirebase(String _name, String _location, double _phoneNumber ,String _paymethod ) async{
  for(int i = 0 ; i < _cartItems.length ; i++){
    FirebaseFirestore.instance.collection('orders')
  .add({
    'name' : _name,
    'order name' : _cartItems[i].name,
    'location' : _location,
    'Phone Number' : '0' +_phoneNumber.toStringAsFixed(0),
    'Pay Method' : _paymethod
  });
  }
}
}

