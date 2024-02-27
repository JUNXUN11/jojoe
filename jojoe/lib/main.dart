import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jojoe/auth/main_page.dart';
import 'package:jojoe/firebase_options.dart';
import 'package:jojoe/model/menu_model.dart';
import 'package:jojoe/pages/cart_page.dart';
import 'package:jojoe/pages/home_page.dart';
import 'package:jojoe/pages/login_page.dart';
import 'package:jojoe/profile/profile_page.dart';
import 'package:jojoe/pages/register_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MenuModel(),
      child:MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mainpage()
    ),
    );
  }
}