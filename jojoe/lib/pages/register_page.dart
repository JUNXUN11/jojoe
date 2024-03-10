import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //textController
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController =TextEditingController();
  final _locationController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future signUp() async{
    if (passwordConfirm()){

    UserCredential userCredential = 
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    FirebaseFirestore.instance.collection('users')
    .doc(userCredential.user!.email)
    .set({
      'username' : _emailController.text.split('@')[0],
      'first name': _firstNameController.text.trim(),
      'last name': _lastNameController.text.trim(),
      'email' : _emailController.text.trim(),
      'Phone Number' : double.parse(_phoneNumberController.text.trim()),
      'location' : _locationController.text.trim(),
      }
    ); 
  
    }
  }

  /*create user with all informations
  Future addUserDetails(
    String firstName , String lastName , String email , double phonenumber) async{
      await FirebaseFirestore.instance.collection('users')
      .add({
        
      });   
    }*/
  
  bool passwordConfirm(){
    if(_passwordController.text.trim() == _confirmpasswordController.text.trim()){
      return true ;
    }
    else {
      return false ;}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [          
                //Welcome text
                Text(
                  'Welcome to Jojoe Chicken Rice ',
                  style: GoogleFonts.oswald(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: size.height * 0.02,),
                Text(
                  'Please Register your Account ',
                  style: GoogleFonts.oswald(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: size.height * 0.05,),

                //firstname
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: TextField(
                        controller: _firstNameController,
                        decoration:InputDecoration(
                          border: InputBorder.none,
                          hintText: 'First Name',
                          hintStyle: TextStyle(fontStyle: FontStyle.italic),
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02,),

                //lastname
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: TextField(
                        controller: _lastNameController,
                        decoration:InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Last Name',
                          hintStyle: TextStyle(fontStyle: FontStyle.italic),
                        )
                      ),
                    ),
                  ),
                ),
               SizedBox(height: size.height * 0.02,),

                //email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: TextField(
                        controller: _emailController,
                        decoration:InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: TextStyle(fontStyle: FontStyle.italic),
                        )
                      ),
                    ),
                  ),
                ),
              SizedBox(height: size.height * 0.02,),
                
              //PhoneNumber
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: TextField(
                        controller: _phoneNumberController,
                        decoration:InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(fontStyle: FontStyle.italic),
                        )
                      ),
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.02,),

                //location
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: TextField(
                        controller: _locationController,
                        decoration:InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Location',
                          hintStyle: TextStyle(fontStyle: FontStyle.italic),
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),

                //password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: TextField(
                        controller: _passwordController,
                        decoration:InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(fontStyle: FontStyle.italic),
                        )
                      ),
                    ),
                  ),
                ),
               SizedBox(height: size.height * 0.02,),

                //confirm password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: TextField(
                        controller: _confirmpasswordController,
                        decoration:InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(fontStyle: FontStyle.italic),
                        )
                      ),
                    ),
                  ),
                ),
               SizedBox(height: size.height * 0.04,),

                GestureDetector(
                  onTap: signUp,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ),
                ),
             SizedBox(height: size.height * 0.02,),
             
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text(
                    'Already registered ? ',
                    style:TextStyle(
                    fontWeight:FontWeight.bold,),
                  ),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: Text(
                      'Login',
                      style:TextStyle(color: Colors.green,
                      fontWeight:FontWeight.bold,),
                      
                      ),
                  )
              ]
              ),
              SizedBox(height: size.height * 0.05,),
              ],),
          ),
        ),
      )
    );
  }
}