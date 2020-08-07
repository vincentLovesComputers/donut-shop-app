import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_farmers_market_app/model/product.dart';

class ProductDetailCard extends StatelessWidget {
  final Product product;
  final GestureTapCallback onTap;
  final GestureLongPressCallback onLongPress;
  ProductDetailCard({Key key, this.product, this.onTap, this.onLongPress});


  @override
  Widget build(BuildContext context) {
    var _radius = BorderRadius.circular(50.0);
    return Padding(
      padding: const EdgeInsets.only(bottom:10.0,top:20.0,left:20.0, right: 20.0),
      child: Container(
        width: 200,
        child: Card(
          
          shape: RoundedRectangleBorder(borderRadius: _radius),
          elevation: 2.0,
          child: GestureDetector(
            onTap: onTap,
            onLongPress: onLongPress,
            child: RepaintBoundary(
              child:Hero(
                tag: product.uniqueId,
                child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(  
                                
                  borderRadius: _radius,
                  image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(product.imageUrl)
                    )
                ),       
                

                child: Padding(                
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container( 
                    height: 40, 
                    width: 150,                
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(15),
                      
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text(                      
                          product.title,
                          style:  GoogleFonts.poppins(textStyle: TextStyle(letterSpacing: 2,fontSize: 10, color: Colors.black)),
                        ),
                      ),
                    )
                  ),
                ),

                // child:Container(
                //   constraints: BoxConstraints.expand(
                //     height: Spacing.matGridUnit(scale: 5),

                //   ),

                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.only(
                //       bottomRight: Radius.circular(10),
                //       bottomLeft: Radius.circular(10),
                //     )
                //   ),

                //   // padding: EdgeInsets.all(Spacing.matGridUnit(scale: 0.5)),
                //   // child: Center(
                //   //   child:Text(
                //   //     product.title,
                //   //     style:Theme.of(context).primaryTextTheme.subhead,
                //   //   )
                //   // )
                //   ),

                  
                )
                )
              )
            ),
        ),
      ),
    );
  }
}