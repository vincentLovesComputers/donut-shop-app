import 'package:flutter/material.dart';
import 'package:new_farmers_market_app/blocs/app_state.dart';
import 'package:new_farmers_market_app/utils/routes.dart';

class AppBarCartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bloc = AppStateContainer.of(context).blocProvider.cartBloc;
    return Stack(
      children: <Widget>[
        Container(
          child: CustomPaint(
            painter: AppBarIconBackground()
          ),
        ),
        IconButton(
          iconSize: 30,
          onPressed: () => Navigator.of(context).pushNamed(Routes.cartPage),
          icon: Icon(Icons.shopping_cart),
          color: Color.fromRGBO(35, 35, 50, .7),
        ),
        Positioned(
          top: 4.0,
          right:4.0,
          child: Container(
            alignment: Alignment.center,
            width: 16.0,
            height:16.0,
            decoration: BoxDecoration(
              shape:BoxShape.circle,
              color:Colors.blue

            ),
            child: StreamBuilder(
              initialData: 0,
              stream: _bloc.cartQtyStreamer,              
              builder: (BuildContext context, AsyncSnapshot snapshot){
                return Text(
                  snapshot.data.toString(),
                  
                  style: TextStyle(fontSize:12.0, color:Colors.white),
                  textAlign: TextAlign.center,

                );})
        
          ),
        )
      ],
    );
  }
}

class AppBarIconBackground extends CustomPainter{
  @override
  void paint(Canvas canvas,Size size) {
    var _paintBrush = Paint()..color = Colors.white;
    var right = size.width;
    var shadowPath = Path();  

    shadowPath.moveTo(right+90, 40.0);    
    shadowPath.lineTo(right+10, 40.0);
    shadowPath.arcToPoint(Offset(right+30.0, 0.0), radius: Radius.circular(20));
    shadowPath.lineTo(right + 90, 0.0);
    shadowPath.close();

    //draw shadow underneath
    canvas.drawShadow(shadowPath, Colors.black54, 3.0, false);


    var rightBase = Rect.fromLTWH(right +10+.0, 0.0, 70.0, 45.0);
    canvas.drawRect(rightBase, _paintBrush);
    canvas.drawCircle(Offset(right + 12, 22.5), 22.5, _paintBrush);


    }
  
    @override
    bool shouldRepaint(CustomPainter oldDelegate)=> false;

}