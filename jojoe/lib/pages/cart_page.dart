import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jojoe/components/button.dart';
import 'package:jojoe/model/menu.dart';
import 'package:jojoe/model/menu_model.dart';
import 'package:jojoe/pages/pay_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

  
class _CartPageState extends State<CartPage> {

  String calculatePrice(){
    return Provider.of<MenuModel>(context,listen: false)
          .calculatePrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer<MenuModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartItems.length,
                  itemBuilder: (context,index){
                    final Menu menu = value.cartItems[index];
                    final String cname = value.cartItems[index].cname;
                    final String name = value.cartItems[index].name;
                    final double price = value.cartItems[index].price;
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius:5,
                            spreadRadius: 0.00,
                          )],
                        ),
                      margin: const EdgeInsets.only(left: 20 , top: 20, right: 20),
                      child: ListTile(
                        title: Text(
                          name + '   ' + cname,
                          style: GoogleFonts.courgette(
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                          ),
                        ),                                                                                                                                             
                        subtitle: Text('RM ${price}'+'0',
                            style: GoogleFonts.courgette(
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                          ),),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed:(){
                            Provider.of<MenuModel>(context,listen: false)
                            .removeItemFromCart(menu);
                          }
                        ),
                      ),
                    );
                  }
                ),
              
              ),
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                              color: Colors.white, 
                              fontWeight: FontWeight.bold
                            )
                          ),
                          const SizedBox(height: 5,),
                          Text('RM '+calculatePrice(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),                          
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          /*Text(
                            'Pay',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),     
                          ),*/
                          const SizedBox(width: 10,),
                          Container(
                            decoration: ShapeDecoration(
                              shape: CircleBorder(),
                              color: Colors.white
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_forward,
                                size: 20,
                                color: Colors.black,
                              ),                             
                              onPressed: () { 
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return PayPage();
                                }));
                               },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
            
          );
        },
      )
    );
  }
}