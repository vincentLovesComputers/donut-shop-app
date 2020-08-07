import 'dart:ui';

import 'package:flutter/material.dart';

class Spacing{
  static const double _matGridUnit = 8.0;
  static double matGridUnit({scale = 1}){
  
  //only accept real numbers
  assert(scale % .5 == 0);
  return _matGridUnit * scale;
  }
}

class AppColors{
  static const textColor = Color.fromRGBO(35, 35, 50, .7);

  static const displayTextColor = Colors.black;
  static const background = Colors.transparent;


  static const List<Color> colorGradient =  [Color(0xFFb29f94), Color(0xFFb29f94), Color(0xFFD1913C), Color(0xFFD1913C), Color(0xFFb29f94), Color(0xFFb29f94)];


}


