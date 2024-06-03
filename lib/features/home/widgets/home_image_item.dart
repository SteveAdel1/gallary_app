import 'package:flutter/material.dart';

class HomeImageItem extends StatelessWidget {
  const HomeImageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      //   image: DecorationImage(
      // image: AssetImage("assets/images/test.jpg",
      ),
       child: ClipRRect(
           borderRadius: BorderRadius.circular(10),
           child: Image.asset("assets/images/test.jpg")),
    );
  }
}
