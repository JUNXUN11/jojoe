import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jojoe/components/button.dart';
import 'package:jojoe/model/menu.dart';
import 'package:jojoe/model/menu_model.dart';
import 'package:jojoe/theme/color.dart';
import 'package:jojoe/utils/size_config.dart';
import 'package:provider/provider.dart';

class FoodDetails extends StatefulWidget {
  
  final Menu menu;
  final Map<Addon, bool> selectedAddons = {};
  

  FoodDetails({
    super.key, 
    required this.menu, 
   })
    
    {
    for( Addon addon in menu.availableaddOn){
      selectedAddons[addon] = false ;
  }

  }

  
  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {

  
  int quantity = 0 ;
  bool addRice = false;

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

   String addonNote(){ 
    String note = '';
    for(int i = 0 ; i < widget.menu.availableaddOn.length ; i++){
      Addon addon = widget.menu.availableaddOn[i];
      if(widget.selectedAddons[addon] == true){
        note += addon.name + ' ';
        if(addon.name == 'add rice'){
          addRice = true;
        }
      }   
    }
     return note;
  }

  void addToCart(){
    if(quantity > 0){
      final choosemenu = context.read<MenuModel>();

      choosemenu.addItemToCart(widget.menu,quantity,addonNote(),addRice);
    
      showDialog(
        context: context, 
        barrierDismissible: false,
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
    ScreenSize().init(context);
    Size size = MediaQuery.of(context).size;

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
                height: ScreenSize.vertical! * 35,
                width: ScreenSize.horizontal! * 25,
              ),

              SizedBox(height: ScreenSize.vertical! *4,),

              Padding(
                padding: EdgeInsets.only(left:ScreenSize.vertical! * 2),
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
                    SizedBox(width: ScreenSize.horizontal! *3,),
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
                padding:EdgeInsets.all(ScreenSize.horizontal! * 4),
                child: Text(
                      'RM ${widget.menu.price}'+'0',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
              ),

              SizedBox(height: size.height * 0.03,),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: widget.menu.availableaddOn.length,
                itemBuilder: ((context, index) {
                  Addon addon = widget.menu.availableaddOn[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CheckboxListTile(                   
                      title: Row(                     
                        children: [
                          Text(
                          addon.cname,
                          style: GoogleFonts.openSans(                      
                          fontSize: 17
                          ),
                        ),
                        SizedBox(width: 10,),
                         Text(
                          addon.name,
                          style: GoogleFonts.openSans(                      
                          fontSize: 17
                          ),
                        ),
                        SizedBox(height: 20,)
                        ],
                      ),
                      subtitle: Text(
                        '+ RM'+addon.price.toStringAsFixed(2),
                        style: TextStyle(color: Colors.black.withOpacity(0.4)),
                      ),
                      value: widget.selectedAddons[addon],
                      onChanged:(bool? value){
                        setState(() {
                          widget.selectedAddons[addon] = value!;                 
                        });
                      }
                    ),
                  );
                })
              )
            ],
          )),
          Container(
            child: Column(              
              children: [
                Padding(
                  padding:EdgeInsets.all(ScreenSize.horizontal! * 4),
                  child: Column(
                    children: [
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: ScreenSize.horizontal! * 8,),
                        Container(                   
                          width:  ScreenSize.horizontal! * 10,
                          height:  ScreenSize.horizontal! * 10,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                      
                          ),
                          child: IconButton(
                            onPressed: decrementValue, 
                            icon: Icon(Icons.remove,color: Colors.white,)
                          ),
                        ),
                        SizedBox(width: ScreenSize.horizontal! * 1,),
                        //quantity
                        Text(
                          quantity.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                         SizedBox(width: ScreenSize.horizontal! * 2,),
                        Container(
                          width:  ScreenSize.horizontal! * 10,
                          height:  ScreenSize.horizontal! * 10,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                          ),
                          child: IconButton(
                            onPressed: incrementValue, 
                            icon: Icon(Icons.add,color: Colors.white,)
                          ),
                        ),
                         SizedBox(width: ScreenSize.horizontal! *3,),
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
      width:  ScreenSize.horizontal! *38,
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
       
         SizedBox(width: ScreenSize.horizontal! *3,),
    
        Icon(
        Icons.arrow_forward,
        color: Colors.white,
        )
    
      ],
    ),
    );
  }
}