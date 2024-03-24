import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jojoe/auth/auth_page.dart';
import 'package:jojoe/roots/home_page.dart';
import 'package:jojoe/route/home.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context , snapshot){
          if (snapshot.hasData){
            return Home();
          }
          else{
            return AuthPage();
          }
        }       
      ),
    );
  }
}