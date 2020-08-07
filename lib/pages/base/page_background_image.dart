import 'package:flutter/material.dart';
import 'package:new_farmers_market_app/model/product.dart';
import 'package:new_farmers_market_app/utils/background_image_clipper.dart';

class BackgroundImage extends StatelessWidget {
  final ImageTitle imageTitle;

  const BackgroundImage({Key key, this.imageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .8,
      child: ClipPath(
        clipper: BackgroundImageClipper(),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
            image: AssetImage("assets/background/bg3.jpg"),
          )),
        ),
      ),
    );
  }
}

class BackgroundImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height); // bottom left corner
    path.lineTo(size.width - 150.0, size.height);
    path.lineTo(size.width, size.height - 150.0); // bottom right corner
    path.lineTo(size.width, 0.0); // top right corner

    // Draws a straight line from current point to the first point of the path.
    // In this case (0, 0), since that's where the paths start by default.
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
