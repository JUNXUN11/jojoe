import 'package:flutter/material.dart';

class page1 extends StatelessWidget {
  final String imagePath;
  const page1({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.1),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    imagePath,
                    height: size.height * 0.35,
                    width: size.width ,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class page2 extends StatelessWidget {
  final String imagePath;
  const page2({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.1),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    imagePath,
                    height: size.height * 0.35,
                    width: size.width ,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class page3 extends StatelessWidget {
  final String imagePath;
  const page3({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.1),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    imagePath,
                    height: size.height * 0.35,
                    width: size.width ,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}