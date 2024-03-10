import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:jojoe/auth/main_page.dart';
import 'package:jojoe/firebase_options.dart';
import 'package:jojoe/model/menu_model.dart';
import 'package:jojoe/pages/cart_page.dart';
import 'package:jojoe/roots/home_page.dart';
import 'package:jojoe/pages/login_page.dart';
import 'package:jojoe/pages/menu_page.dart';
import 'package:jojoe/pages/pay_page.dart';
import 'package:jojoe/roots/notification.dart';
import 'package:jojoe/roots/order_page.dart';
import 'package:jojoe/roots/profile_page.dart';
import 'package:jojoe/pages/register_page.dart';
import 'package:jojoe/route/home.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(myApp());
}

class myApp extends StatelessWidget {
  myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MenuModel(),
      child:MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    ),
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/main',
    routes: [
    GoRoute(
      path: '/main' , 
      builder: (context, state) => Mainpage(),),

    //homepage  
    GoRoute(
      path: '/homepage' , 
      builder: (context, state) => HomePage(),routes: [
          
    ]),

     GoRoute(
      path: '/cart' , 
      builder: (context, state) => CartPage(),),

     GoRoute(
      path: '/menu' , 
      builder: (context, state) => MenuPage(),),

    //orderpage
     GoRoute(
      path: '/order' , 
      builder: (context, state) => OrderPage(),),

    //notification page
    GoRoute(
      path: '/notification' , 
      builder: (context, state) => NotificationPage()),

    //profile page
    GoRoute(
      path: '/profile' , 
      builder: (context, state) => ProfilePage(),),

    //pay page
    GoRoute(
      path: '/pay' , 
      builder: (context, state) => PayPage(),)
      
  ]
  );


}

  