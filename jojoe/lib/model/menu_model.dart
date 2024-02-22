import 'package:flutter/material.dart';

class MenuModel extends ChangeNotifier{

  final List _menuItems = [
    ["咕嚕肉","4.00","lib/images/gulurou.png"],
    ["煎蛋","4.00","lib/images/egg.png"],
    ["大白菜","4.00","lib/images/vege.png"],
    ["飯","4.00","lib/images/rice.png"],
   
  ];

  get menuItems => _menuItems;
  
}