import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBg extends StatelessWidget {
  Widget child ;

  MainBg({super.key , required this.child} );

  @override
  Widget build(BuildContext context) {
    var mediaQuey = MediaQuery.of(context).size;
    return Container(
     width: mediaQuey.width,
      alignment: Alignment.topRight,
      decoration: BoxDecoration(
        color: Colors. transparent,
        image: DecorationImage(
            image: AssetImage("assets/images/homebg.png",
            ),
            fit: BoxFit.fill),
      ),
      child:child ,) ;
  }
}
