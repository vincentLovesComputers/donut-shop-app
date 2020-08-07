import 'package:flutter/material.dart';
import 'package:new_farmers_market_app/model/product.dart';
import 'package:new_farmers_market_app/utils/styles.dart';

class ProductDetailPage extends StatefulWidget {

  final Product product;

  const ProductDetailPage({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: <Widget>[
        Positioned(
          bottom: 100.0,
          left: 20.0,
          child:Container(
            padding: EdgeInsets.all(Spacing.matGridUnit(scale: 3)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
              boxShadow:[
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 4.0,
                ),
              
              
              ]
            ),

            width: MediaQuery.of(context).size.width -40.0,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.product.title,
                          style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.bold),

                        ),
                      ],
                    ),
                    Text("R ${widget.product.cost} /donut",
                    style: Theme.of(context).textTheme.headline.copyWith(color:AppColors.displayTextColor),                  
                    
                    )
                  ],
                ),


                Padding(
                  padding: EdgeInsets.symmetric(vertical: Spacing.matGridUnit(scale: 2)),

                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Hero(
                          tag: widget.product.uniqueId,
                          child: Image.asset(widget.product.imageUrl),
                        ),
                      ),

                      Flexible(
                        flex:1,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            "${widget.product.title}, A nice sweet treat for a happy you"
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: (){
                      if(quantity > 0){
                        setState((){
                          quantity --;
                        });}                       
                      },
                      icon:Icon(Icons.remove),
                    ),

                    Text(quantity.toString(),
                      style: Theme.of(context).primaryTextTheme.headline
                    ),

                    IconButton(
                      onPressed: (){
                        setState((){
                          quantity ++;
                        });
                      }    ,
                      icon: Icon(Icons.add),                  
                    )
                  ],
                )
              ],

            ),
            
          )
        ),
      ],

    );
  }
}