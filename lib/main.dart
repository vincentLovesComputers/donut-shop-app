import 'package:flutter/material.dart';
import 'package:new_farmers_market_app/app.dart';
import 'package:new_farmers_market_app/blocs/app_state.dart';
import 'package:new_farmers_market_app/blocs/cart_bloc.dart';
import 'package:new_farmers_market_app/blocs/catalog_bloc.dart';
import 'package:new_farmers_market_app/services/cart_service.dart';
import 'package:new_farmers_market_app/services/catalog_services.dart';
import 'package:new_farmers_market_app/storage/mock_store.dart';
Future<void> main() async{

  var store = AppStore();
  var catalogService = CatalogServiceTemporary(store: store);
  var cartService = CartServiceTemporary(store);

  var blocProvider = BlocProvider(
    catalogBloc: CatalogBloc(catalogService),
    cartBloc: CartBloc(cartService),
  );



  runApp(
    AppStateContainer(
    blocProvider: blocProvider,        
    child: FarmersMarketApp()));
}

