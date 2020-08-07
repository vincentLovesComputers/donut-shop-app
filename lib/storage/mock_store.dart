import 'dart:async';

import 'package:new_farmers_market_app/model/cart.dart';
import 'package:new_farmers_market_app/model/catalog.dart';
import 'package:new_farmers_market_app/utils/generate_data.dart';

/*
* get data from database and make available to other classes to use
*/

class AppStore{



  //instantiate catalog class
  Catalog _catalog;

  //instatiate cart
  Cart _cart;
  
  //stream catalog data to use in other parts of app
  StreamController<Catalog> catalogNotifier = StreamController<Catalog>.broadcast();
  StreamController<Cart> cartNotifier = StreamController<Cart>.broadcast();

  AppStore(){
    _catalog = populateCatalog();
    _cart = buildInitialCart();
    Future.delayed(Duration(milliseconds: 500), () {
      catalogNotifier.add(_catalog);
      cartNotifier.add(_cart);
    });  //add data to stream controller
            
  }  

  //GETTER
  Catalog get getCatalog => _catalog;
  Cart get getCart => _cart;

  //SETTER
  set catalog(Catalog c){
    _catalog = c;
    catalogNotifier.add(c);

  }

  set cart(Cart c){
    _cart = c;
    cartNotifier.add(c);
  }
  
  


}