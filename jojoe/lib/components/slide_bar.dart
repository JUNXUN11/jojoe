import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jojoe/utils/size_config.dart';

class SlideBar extends StatefulWidget {
  final List <String> categories;
  final Function(int) onTap;
  
  const SlideBar({super.key, required this.categories, required this.onTap});

  @override
  State<SlideBar> createState() => _SlideBarState();
}

class _SlideBarState extends State<SlideBar> {
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left:12.0),
      child: Container(
        width: size.width,
        height: size.height * 0.05,
        child: Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget.categories.length,
            itemBuilder: (context, index){
              final String text = widget.categories[index];
              final TextStyle textStyle = GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                  fontSize: ScreenSize.vertical! * 3,
                  textStyle: TextStyle(
                    color: selectedIndex == index ? Colors.black : Colors.black.withOpacity(0.4),
                  ),
              );
              //final Size textSize = _textSize(text, textStyle);
      
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      widget.onTap(selectedIndex);
                    });
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: selectedIndex == index 
                          ? Colors.black
                          : Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15),),
                      margin: EdgeInsets.only(top: 15 , left: 8),
                      //height : size.height * 0.2,
                      //width : size.width * 0.2,
                    ),
                    Text(text,style: textStyle),
                    ],
                  )),
              );
            }
          )
        ),
      ),
    );
  }
}

  /*Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }*/