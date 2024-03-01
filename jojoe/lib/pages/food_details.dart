import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jojoe/components/button.dart';
import 'package:jojoe/model/menu.dart';
import 'package:jojoe/model/menu_model.dart';
import 'package:jojoe/theme/color.dart';
import 'package:provider/provider.dart';

class FoodDetails extends StatefulWidget {
  
  final Menu menu;
  
  FoodDetails({super.key, required this.menu, });

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {

  
  int quantity = 0 ;

  void decrementValue(){
    setState(() {
      quantity --;
    });
  }

  void incrementValue(){
    setState(() {
      quantity ++;
    });
  }  

  void addToCart(){
    if(quantity > 0){
      final choosemenu = context.read<MenuModel>();

      choosemenu.addItemToCart(widget.menu,quantity);
    
      showDialog(
        context: context, 
        barrierDismissible: true,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.black,
          content: Text(
            'Successfully added to cart',
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
                  },
                  icon: Icon(Icons.done_outline,color: Colors.black,),
                ),
              ),
            )
          ],
        ),
      );
    }
    

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(),    
      body: Column(
        children: [
          Expanded(
            child: ListView(
            children: [
              //image
              Image.asset(
                widget.menu.url,
                height: 250,
                width: 250,
              ),

              const SizedBox(height: 25,),

              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(  
                  crossAxisAlignment: CrossAxisAlignment.start,          
                  children: [
                    Text(
                      widget.menu.cname,
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                      ),                  
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      widget.menu.name,
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                      'RM ${widget.menu.price}'+'0',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
              ),
            ],
          )),
          Container(
            child: Column(
              
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(width: 50,),
                        Container(                   
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                      
                          ),
                          child: IconButton(
                            onPressed: decrementValue, 
                            icon: Icon(Icons.remove,color: Colors.white,)
                          ),
                        ),
                        SizedBox(width: 5,),
                        //quantity
                        Text(
                          quantity.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                          ),
                          child: IconButton(
                            onPressed: incrementValue, 
                            icon: Icon(Icons.add,color: Colors.white,)
                          ),
                        ),
                        const SizedBox(width: 10,),
                       GestureDetector(
                        onTap: addToCart,
                        child: AddtoCartButton()),
                      ],                                    
                      ),                    
                    ], 
                                  
                  ),                 
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AddtoCartButton extends StatelessWidget {
  const AddtoCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(20),
    ),
    padding: EdgeInsets.all(20),
    child: Row(
      children: [
        Center(
          child: Text(
          'Add to Cart',
          style: TextStyle(color: Colors.white),),
        ),
       
        const SizedBox(width: 10,),
    
        Icon(
        Icons.arrow_forward,
        color: Colors.white,
        )
    
      ],
    ),
    );
  }
}