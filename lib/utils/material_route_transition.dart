import 'package:flutter/material.dart';

class FadeInSildeOutRoute<T> extends MaterialPageRoute<T>{
  FadeInSildeOutRoute({WidgetBuilder builder, RouteSettings settings}): super(builder: builder, settings: settings);


  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, 
    Animation<double> secondaryAnimation, Widget child){
      if(animation.status == AnimationStatus.reverse){
        return super
          .buildTransitions(context, animation, secondaryAnimation, child);
      }

      return FadeTransition(opacity: animation, child: child);
    }
}