import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PayPage extends StatefulWidget {
  const PayPage({super.key});

  @override
  State<PayPage> createState() => _PayPageState();
}

List<String> options = ['TNG', 'Bank', 'Jojoe Wallet'];

class _PayPageState extends State<PayPage> {

  final currentUser = FirebaseAuth.instance.currentUser!;
  CollectionReference user = FirebaseFirestore.instance.collection('users');

  
  String currentOption = options[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.email)
        .snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          final userData = snapshot.data!.data() as Map<String,dynamic>;
          return Column(
          children: [
            Container(
            padding: EdgeInsets.all(21),
            margin: EdgeInsets.all(21),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white.withOpacity(0.9),
              boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                blurRadius:5,
                spreadRadius: 0.00,
              )],
            ),
            child: Column(       
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Address',
                      style:GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                      
                    ),

                    Icon(Icons.edit),
                  ],
                ),
                const SizedBox(height: 12,),
                Text(
                  '${userData['location']}',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.5)
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          Divider(),

          Text('Choose Your Payment Method'),

          const SizedBox(height: 20,),

          RadioListTile(
            title: Text('TNG'),
            value: options[0], 
            groupValue: currentOption, 
            onChanged: (value){
              setState(() {
                currentOption = value.toString();
              });
            }
          ),
          RadioListTile(
            title: Text('Bank'),
            value: options[1], 
            groupValue: currentOption, 
            onChanged: (value){
              setState(() {
                currentOption = value.toString();
              });
            }
          ),
          RadioListTile(
            title: Text('Jojoe Wallet'),
            value: options[2], 
            groupValue: currentOption, 
            onChanged: (value){
              setState(() {
                currentOption = value.toString();
              });
            }
          ),
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