import 'package:flutter/cupertino.dart';

class MyCustomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
   

    var path = new Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.cubicTo(size.width - size.width/10, 100, size.width - size.width/8, 110, size.width/2, 120);
    path.cubicTo(size.width/8, 120, size.width/14, 150, 0, 180);
  
    path.close();
      return path;   
      
    }
  
    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) => false;



}