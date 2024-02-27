import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jojoe/profile/text_box.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final currentUser = FirebaseAuth.instance.currentUser!;
  String docID = "";

  CollectionReference user = FirebaseFirestore.instance.collection('users');

 
  //edit 
  Future <void> editField(String field) async{
    String input = "";
    await showDialog(
      context: context, 
      builder: (context) =>
      AlertDialog(
        title: Text('Edit',
        style: const TextStyle(color: Colors.black)),
      content: TextField(
        autofocus: true,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: 'Enter your new $field',
          hintStyle: TextStyle(color: Colors.grey)
        ),
      ),
      )
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(
          child: 
          Text('Profile Page',
          style: GoogleFonts.oswald(
            fontWeight: FontWeight.bold,
          ),
          )),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.email)
        .snapshots(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          final userData = snapshot.data!.data() as Map <String,dynamic>;
          return ListView(
            children: [
              const SizedBox(height: 50,),
          
              //profile picture
              const Icon(
                Icons.person,
                size: 72,
              ),
          
              const SizedBox(height: 10,),
          
              Text(
                currentUser.email!,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
          
              const SizedBox(height: 50,),
          
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                'My Details',
                style: TextStyle(color: Colors.grey),
                ),
              ),
          
              //username
              MyTextBox(
                section: 'Username',
                text: '${userData['username']}',
                onPressed: () => editField('username'),
              ),
          
              //Email
              MyTextBox(
                section: 'Email',
                text: '${userData['email']}',
                onPressed: () => editField('Email'),
              ),
          
              //PhoneNumber
              MyTextBox(
                section: 'Phone Number',
                text: '0${userData['Phone Number'].toInt()}',
                onPressed: () => editField('Phone Number'),
              ),
          
              //location
              MyTextBox(
                section: 'Location',
                text: '${userData['location']}',
                onPressed: () => editField('Location'),
              ),  

            const SizedBox(height: 20,),
            ],

            
          );
        }
        else if(snapshot.hasError){
          return Center(
            child: Text('Error${snapshot.error}'));
        }

        return const Center(child: CircularProgressIndicator());
        
      },
      )
    );
  }
}