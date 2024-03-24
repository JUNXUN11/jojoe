import 'package:cloud_firestore/cloud_firestore.dart';

class Order{
  final String payMethod;
  final String phoneNum;
  final Timestamp time;
  final String email;
  final String location;
  final String name;
  final String note;
  final String order;

  Order({
    required this.payMethod, 
    required this.phoneNum, 
    required this.time, 
    required this.email, 
    required this.location, 
    required this.name, 
    required this.note, 
    required this.order}
  );
}