import 'package:flutter/material.dart';
import 'package:new_farmers_market_app/blocs/app_state.dart';
import 'package:new_farmers_market_app/blocs/cart_bloc.dart';
import 'package:new_farmers_market_app/utils/styles.dart';
import 'package:new_farmers_market_app/widgets/scrollables/sliver_header.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bloc = AppStateContainer.of(context).blocProvider.cartBloc;
    return CustomScrollView(
      slivers: <Widget>[
        CustomSliverHeader(
          headerText: "Cart Items",
        ),

        StreamBuilder(
          stream: _bloc.cartItemStreamer,                    
          initialData: <String, int>{},
          builder: (BuildContext context, AsyncSnapshot<Map<String, int>> snapshot){
            if(snapshot.data.keys.isEmpty){
              return SliverFillRemaining(child: Text("Your Cart is empty"));
            }
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                  var _product = snapshot.data.keys.toList()[index];
                  var qty = snapshot.data[_product];
                  //print(snapshot.data);                  
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: .5, color: Colors.black54),
                      )
                    ),

                    child:Dismissible(
                      direction: DismissDirection.endToStart,
                      background: Container(color: Colors.red[300]),
                      key: Key(_product),
                      
                      child:Container(
                        child:ListTile(
                          title:Text(_product, style: TextStyle(fontSize:20, color:Colors.white)),
                          subtitle: Text("Qty in cart: $qty", style: TextStyle(fontSize:20, color:Colors.white),),

                    trailing: StreamBuilder(
                      initialData: <String, double>{}, 
                      stream: _bloc.cartItemCostStreamer, 
                      
                      
                      builder: (BuildContext context, AsyncSnapshot<Map<String,double>> snapshot){
                        if(snapshot.data.keys.isEmpty){
                          return SliverFillRemaining(child: Text(""));
                        }
                        
                        var cost = snapshot.data.keys.toList()[index];
                        var newCost = snapshot.data[cost];
                        print(newCost);
                        return Text("$newCost", style: TextStyle(fontSize:20, color:Colors.white));
                      } ,                          
                      
                  ),
                        )
                      ),

                      onDismissed: (DismissDirection dir){
                        _bloc.removeFromCart.add(RemoveFromCartEvent(productTitle: _product, qtyInCart: qty));
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.blue[500],
                            content: Text(
                              "$_product removed from cart.",
                            ),
                          )
                        );
                      },
                    )

                  );

                },
                childCount: snapshot.data.keys.toList().length,
              ),
            );
          }
          
          ),
          SliverPersistentHeader(
          delegate: SliverAppBarDelegate(
            minHeight: Spacing.matGridUnit(scale: 4),
            maxHeight: Spacing.matGridUnit(scale: 8),
            child: Center(
              child: Text(
                "",
                style: Theme.of(context).textTheme.headline,
              ),
            ),
          ),
        ),

      ],
      
    );
  }
}