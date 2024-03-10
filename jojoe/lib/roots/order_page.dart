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
    );
  }
}