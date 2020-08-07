import 'package:flutter/material.dart';
import 'package:new_farmers_market_app/blocs/cart_bloc.dart';
import 'package:new_farmers_market_app/blocs/catalog_bloc.dart';
import 'package:new_farmers_market_app/services/cart_service.dart';
import 'package:new_farmers_market_app/services/catalog_services.dart';

class AppStateContainer extends StatefulWidget {

  final Widget child;
  final BlocProvider blocProvider;

  const AppStateContainer({Key key, @required this.child, @required this.blocProvider}) :super(key:key);
  
  @override
  State createState() => AppState();

  static AppState of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(_AppStateContainer) as _AppStateContainer).appData;
  }

  
}

class AppState extends State<AppStateContainer> {
  BlocProvider get blocProvider => widget.blocProvider;

  //build widget as inherited widget
  @override
  Widget build(BuildContext context) {
    return _AppStateContainer(
      appData: this,
      blocProvider: widget.blocProvider,
      child: widget.child,
    );
    
  }
  void dispose(){
    super.dispose();
  }
}

//inherited widget
class _AppStateContainer extends InheritedWidget{
  final AppState appData;
  final BlocProvider blocProvider;

  _AppStateContainer({Key key, @required this.appData, @required child, @required this.blocProvider}) : super(key:key, child:child);

  @override
  bool updateShouldNotify(_AppStateContainer oldWidget) =>
    oldWidget.appData != this.appData;
  
  

}

class ServiceProvider{
  final CatalogService catalogService;
  final CartService cartService;
  ServiceProvider({
    @required this.catalogService,
    @required this.cartService
    });
}

class BlocProvider{
  final CatalogBloc catalogBloc;
  final CartBloc cartBloc;

  BlocProvider({
    @required this.catalogBloc,
    @required this.cartBloc
    });
}