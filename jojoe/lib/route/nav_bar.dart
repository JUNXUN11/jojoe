import 'package:flutter/material.dart';
import 'package:jojoe/utils/size_config.dart';

class NavModel{
  final Widget page;
  final GlobalKey<NavigatorState> navKey;

  NavModel({required this.page, required this.navKey});
  
}

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;
  
  const NavBar({super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return BottomAppBar(
        elevation: 0.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            //height: ScreenSize.vertical! * 3,
            color: Colors.white,
            child: Row(
              children: [
                navItem(
                  Icons.home,
                  pageIndex == 0, 
                  onTap: () => onTap(0),
                ),
                navItem(
                  Icons.food_bank,
                  pageIndex == 1, 
                  onTap: () => onTap(1),
                ),
                SizedBox(width: ScreenSize.horizontal! * 8,),
                navItem(
                  Icons.circle_notifications_rounded,
                  pageIndex == 2, 
                  onTap: () => onTap(2),
                ),
                navItem(
                  Icons.person,
                  pageIndex == 3, 
                  onTap: () => onTap(3),
                ),
              ],
            ),
          ),
        ),
      );
    
  }
}

Widget navItem(IconData icon, bool selected, {Function()? onTap}){
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        size: 35,
        color: selected ? Colors.black : Colors.black.withOpacity(0.4)
      ),
    ),
  );
}