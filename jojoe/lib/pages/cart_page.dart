import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jojoe/components/button.dart';
import 'package:jojoe/model/menu.dart';
import 'package:jojoe/model/menu_model.dart';
import 'package:jojoe/pages/pay_page.dart';
import 'package:jojoe/utils/size_config.dart';
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
    Size size = MediaQuery.of(context).size; 
    return Scaffold(
      appBar: AppBar(     
      ),
      body: Consumer<MenuModel>(
        builder: (context, value, child) {
          return Column(           
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: ScreenSize.horizontal! * 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'CART',
                      style: GoogleFonts.oswald(
                        fontWeight: FontWeight.bold,
                        fontSize: 50
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: ScreenSize.vertical! * 4), 

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
                        color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.8),
                            blurRadius:5,
                            spreadRadius: 0.00,
                          )],
                        ),
                      margin: EdgeInsets.all(size.width * 0.04),
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name ,
                              style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                              ),
                            ),
                            Text(
                              cname,
                              style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                              ),
                            ),
                            SizedBox(height: 8,)
                          ],
                        ),
                                                                                                                                                         
                        subtitle:                     
                        Text(
                          'RM ${price.toStringAsFixed(2)}',
                            style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
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
                            style: GoogleFonts.nunito(
                              color: Colors.white, 
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            )
                          ),
                          const SizedBox(height: 5,),
                          Text('RM '+calculatePrice(),
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 20,
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
                                size: 23,
                                color: Colors.black,
                              ),                             
                              onPressed: () {
                              Provider.of<MenuModel>
                                (context,listen: false).isCartEmpty()
                                ? showDialog(
                                context: context, 
                                barrierDismissible: false,
                                builder: (context) => AlertDialog(
                                  backgroundColor: Colors.black,
                                  content: Text(
                                    'Your Cart is empty',
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
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(Icons.mood_bad_sharp,color: Colors.black,),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                              : context.push('/pay');                                                                                                                                 
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