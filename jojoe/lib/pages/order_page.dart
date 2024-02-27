import 'package:flutter/material.dart';
import 'package:jojoe/model/menu_model.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
      ),
      body: Consumer<MenuModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartItems.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text(
                        value.cartItems[index][0],
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    );
                  }
                )
              )
            ],
          );
        },
      )
    );
  }
}