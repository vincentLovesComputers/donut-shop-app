import 'package:flutter/cupertino.dart';

class BackgroundImageClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height); //bottom left corner
    path.lineTo(size.width - 150.0, size.height);
    path.lineTo(size.width, size.height - 150); //bottom right corner -150
    path.lineTo(size.width, 0); //top right corner 

    path.close();
    return path;  
    }
  
    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}