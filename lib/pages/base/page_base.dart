import 'package:flutter/material.dart';
import 'package:new_farmers_market_app/model/catalog.dart';
import 'package:new_farmers_market_app/utils/styles.dart';
import 'package:new_farmers_market_app/widgets/appbar_cart_icon.dart';

enum PageType {Catalog, Cart, ProductDetail}

abstract class PageContainerBase extends StatelessWidget {

  Widget get body;
  Widget get background;
  String get pageTitle;
  Color get backgroundColor;

  const PageContainerBase({Key key}) : super(key: key); 

  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: AppColors.colorGradient,
          stops:[0.2,0.6,0.7,0.6,0.8,1]
          ),
          //borderRadius: BorderRadius.circular(25.0),
          boxShadow:[
            BoxShadow(
              color: Colors.black26,
              offset: Offset(1.0, 1.0),
              blurRadius: 1.0
            ),              
              
              ]
            ),
          
          //color background          
        ),
        background,
        
        Scaffold( 
          backgroundColor: backgroundColor,
          appBar: PreferredSize(
            
          
            preferredSize: Size.fromHeight(120.0),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 120, width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                    image: AssetImage("assets/background/logo.png"),
                                   
                                  ),                      
                              ),
                            ),

                      Center(child: Text(pageTitle, style: TextStyle(fontSize:20, color:Colors.white))),
                       
                      
                    ],
                  ),
                  AppBarCartIcon(),
                  
                 
                ],
              ),
            ),
          ),
        
           body:body,
          ),
        
      ],
      
    );
  }
}