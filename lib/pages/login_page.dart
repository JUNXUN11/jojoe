import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jojoe/pages/forget_pw_page.dart';
import 'package:jojoe/utils/size_config.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({super.key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async{
    showDialog(
      context: context, 
      builder: (context){
        return Center(child: CircularProgressIndicator());
    },
  );
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

}

  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar:AppBar(),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.food_bank,
                  size: 80,
              ),
              Text(
                'JOJOE MIX RICE',
                style:GoogleFonts.oswald(
                  fontSize: 48,                
                ),              
              ),
              SizedBox(height: ScreenSize.vertical! *13),
         
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),              
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      ),
                      
                    ),
                  ),
                ),
              ),
              SizedBox(height: ScreenSize.vertical! *3),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),              
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: TextField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      ),                     
                    ),
                  ),                  
                ),
              ),
              SizedBox(height: ScreenSize.vertical! *7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, 
                         MaterialPageRoute(builder: (context){
                          return ForgetPasswordPage();
                         },
                         ),
                      );
                      },
                      child: Text('forget password',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),

              SizedBox(height: ScreenSize.vertical! *3),

              //sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:BorderRadius.circular(12),
                    ),               
                    child: Center(
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )
                    ),
                  ),
                ),
              ),
             SizedBox(height: ScreenSize.vertical! *3),
                          
              //register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?', 
                    style: TextStyle(
                      fontWeight: FontWeight.bold),
                    ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Text(
                      ' Register Now',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                      ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}