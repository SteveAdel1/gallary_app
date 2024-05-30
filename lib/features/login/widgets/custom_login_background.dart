import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoginBackground extends StatelessWidget {
  Widget child ;
   CustomLoginBackground({super.key , required this.child} );

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center ,
        decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
        image: AssetImage("assets/images/login.png",),
            fit: BoxFit.cover),
        ),
      child:child ,) ;
  }
}
