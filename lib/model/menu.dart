
class Menu {
  final String cname ;
  final String name;
  final String url;
  final double price;
  String note;
  List <Addon> availableaddOn;

  Menu( {
    required this.cname , 
    required this.name , 
    required this.url,
    required this.price,
    required this.note,
    required this.availableaddOn
  });


  
}

    
class Addon{
  
  String name;
  String cname;
  double price;

  Addon({
    required this.name,
    required this.cname,
    required this.price
  });

}  
  
    