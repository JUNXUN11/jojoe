import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jojoe/components/button.dart';
import 'package:jojoe/components/menu_mainpage.dart';
import 'package:jojoe/components/menu_item_tile.dart';
import 'package:jojoe/model/menu_model.dart';
import 'package:jojoe/pages/cart_page.dart';
import 'package:jojoe/pages/menu_page.dart';
import 'package:jojoe/theme/color.dart';
import 'package:jojoe/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
       appBar: AppBar(
        title: Center(
          child: Text(
            'Jojoe Chicken Rice',
            style: GoogleFonts.oswald(
              fontWeight: FontWeight.bold
            ),
          ),             
        ),
        leading: GestureDetector(
            onTap: (){
              FirebaseAuth.instance.signOut();
            },
          child: Icon(Icons.logout),
        ),
        actions: [   
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: Colors.black, 
            onPressed: () {
            context.push('/cart');
            }
          )
      ],    
    ),  
      body: SingleChildScrollView(
        child: Column(       
          children: [
            SizedBox(height: ScreenSize.vertical! * 4,),
            Wallet(),

            SizedBox(height: ScreenSize.vertical! * 4,),
            SizedBox(              
              height: size.height * 0.45,
              child: PageView(  
                scrollDirection: Axis.horizontal,         
                controller: _controller,
                children: [
                  page1(imagePath: "lib/images/Logo.png",),
                  page2(imagePath: "lib/images/Logo2.png",),
                  page3(imagePath: "lib/images/Logo3.png",)                 
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _controller, 
              count: 3,
              effect: SlideEffect(
                activeDotColor: Colors.black,
                dotColor: Colors.black.withOpacity(0.4),
                dotHeight: 20,
                dotWidth: 20
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Wallet extends StatelessWidget {
  const Wallet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), 
        boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          blurRadius: 20,
          spreadRadius: 0.00,
        )
        ]
      ),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
               'Your Wallet Balance',
               style: GoogleFonts.aBeeZee(
                 fontSize:15,
                 fontWeight: FontWeight.bold
               ),              
            ),
            SizedBox(height: ScreenSize.vertical! *2,),
              Text(
               'RM 0 ',
               style: GoogleFonts.aBeeZee(
                 fontSize:35,
                 fontWeight: FontWeight.bold
               ),              
            ),
            ],
          ),
          SizedBox(height: ScreenSize.vertical! *2,),
                              
          GestureDetector(
           child: MyButton(
             text: 'Reload',
           ),
           onTap: () {            
           },
      ),
        ],
      ),
    );
  }
}