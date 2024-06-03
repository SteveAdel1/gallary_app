import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainBg extends StatelessWidget {
  Widget child ;

  MainBg({super.key , required this.child} );

  @override
  Widget build(BuildContext context) {
    var mediaQuey = MediaQuery.of(context).size;
    return Stack(
      children:[
        Container(
       width: mediaQuey.width .spMax,
        height: mediaQuey.height .spMax,
        decoration: BoxDecoration(
          color: Color(0xFFDDCDFF),
          image: DecorationImage(
              image: AssetImage("assets/images/homebg.png"
              ),
              fit: BoxFit.cover),
        ),
        child:child,),
    ]) ;
  }
}
