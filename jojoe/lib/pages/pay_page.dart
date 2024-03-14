import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jojoe/model/menu.dart';
import 'package:jojoe/model/menu_model.dart';
import 'package:provider/provider.dart';

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.email)
          .snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            final userData = snapshot.data!.data() as Map<String,dynamic>;
            return Column(
            children: [
            Address_Card(size: size, userData: userData),
            
            Payment_Card(),
            
            SizedBox(height: size.height * 0.2,),
            GestureDetector(
              onTap: () {
                Provider.of<MenuModel>(context,listen: false)
                .addToFirebase(
                  userData['username'],
                  userData['location'],
                  userData['Phone Number'],
                  currentOption
                );
                Provider.of<MenuModel>(context,listen: false).removeAllFromCart();
                showDialog(
                context: context, 
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.black,
                  content: Text(
                    'Payment Sucessfull !!!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                    ),
                  actions: [
                    Container(
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: Colors.white
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            context.go('/main')  ;                               
                          },
                          icon: Icon(Icons.sentiment_very_satisfied,color: Colors.black,),
                        ),
                      ),
                    )
                  ],
                ),
              );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black
                ),
                height: size.height * 0.1,
                width: size.width * 0.5,                
                child: Center(
                  child: Text(
                      'Place Order',
                      style: GoogleFonts.oswald(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white
                      ),
                    ),
                ),
              ),
            )
            
            
            
          ],
        );
            }
            else if(snapshot.hasError){
          return Center(
          child: Text('Error${snapshot.error}'));
        } 
        
        return const Center(child: CircularProgressIndicator());
        
        },     
            ),
      )
  );
}


  Card Payment_Card() {
    Size size = MediaQuery.of(context).size;
    return Card(
        margin: EdgeInsets.all(20),
        color: Colors.white,
        shadowColor: Colors.black,
          child:
            Column(
              children: [
            SizedBox(height: 20,),
            Text(
              'Choose Your Payment Method',
              style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              fontSize: 20
            )),

           SizedBox(height: 20,),

            RadioListTile(
            title: Text(
              'TNG',
              style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),),
            value: options[0], 
            groupValue: currentOption, 
            onChanged: (value){
              setState(() {
                currentOption = value.toString();
              });
            }
          ),

          RadioListTile(
             title: Text(
              'Bank',
              style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),),
            value: options[1], 
            groupValue: currentOption, 
            onChanged: (value){
              setState(() {
                currentOption = value.toString();
              });
            }
          ),

          RadioListTile(
             title: Text(
              'Jojoe Wallet',
              style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),),
            value: options[2], 
            groupValue: currentOption, 
            onChanged: (value){
              setState(() {
                currentOption = value.toString();
              });
            }
          ),
        ],
      ),             
    );
  }
}

class Address_Card extends StatelessWidget {
  const Address_Card({
    super.key,
    required this.size,
    required this.userData,
  });

  final Size size;
  final Map<String, dynamic> userData;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        SizedBox(height: size.height * 0.02,),
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
    );
  }
}