
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jojoe/roots/home_page.dart';
import 'package:jojoe/roots/notification.dart';
import 'package:jojoe/roots/order_page.dart';
import 'package:jojoe/roots/profile_page.dart';
import 'package:jojoe/route/nav_bar.dart';


import 'package:jojoe/utils/size_config.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final homeNavKey = GlobalKey<NavigatorState>();
  final orderNavKey = GlobalKey<NavigatorState>();
  final notifiacationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List <NavModel> items = [];

  @override
  void initState(){
    super.initState();
    items = [
      NavModel(
        page: HomePage(),
        navKey: homeNavKey,
     ),
     NavModel(
        page: OrderPage(),
        navKey: orderNavKey,
     ),
     NavModel(
        page: NotificationPage(),
        navKey: notifiacationNavKey,
     ),
     NavModel(
        page: ProfilePage(),
        navKey: profileNavKey
     )
    ];
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return PopScope(
      child: Scaffold(
        body: IndexedStack(
          index: selectedTab,
          children: items.map((page) => Navigator(
            key: page.navKey,
            onGenerateInitialRoutes: (navigator, initialRoute) {
              return [MaterialPageRoute(builder: (context) => page.page)
              ];
            },
          ))
          .toList()
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: ScreenSize.vertical! * 2),
        height: 64,
        width: 64,
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          elevation: 0,
          onPressed:() {
            context.push('/menu');
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(width: 5, color: Colors.transparent)
          ),
          child: const Icon(
            Icons.add,
            size: 42,
            color: Colors.white,
          ) ,
      ),),
      bottomNavigationBar: NavBar(
        pageIndex: selectedTab,
        onTap: (index){
          if(index == selectedTab){
            items[index].navKey.currentState
            ?.popUntil((route) => route.isFirst);
          } else {
            setState(() {
              selectedTab = index;
            });
          }
        }
      ),
      )
    );
}
}