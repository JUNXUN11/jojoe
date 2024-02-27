import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jojoe/pages/notification.dart';
import 'package:jojoe/pages/home_page.dart';
import 'package:jojoe/pages/order_page.dart';
import 'package:jojoe/profile/profile_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  final user = FirebaseAuth.instance.currentUser!;
  
  int _selectedIndex = 0 ;

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
     HomePage(),
     OrderPage(),
     NotificationPage(),
     ProfilePage()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     

      //body
      body:      
      _pages[_selectedIndex],
      //bottom navigation botton
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_notifications_rounded),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],        
      ),       
    );
  }
}