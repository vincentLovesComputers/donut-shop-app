import 'dart:async';

import 'package:new_farmers_market_app/model/product.dart';
import 'package:new_farmers_market_app/services/cart_service.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc{
  final CartService _service;

  //input stream controllers
  StreamController<AddToCartEvent> addProductToCart = StreamController<AddToCartEvent>();

  StreamController<RemoveFromCartEvent> removeFromCart = StreamController<RemoveFromCartEvent>();

  //output stream controller
  StreamController _cartItemController = BehaviorSubject<Map<String, int>>(seedValue: {});
  StreamController _cartQtyController = BehaviorSubject<int>(seedValue: 0);

  StreamController _cartItemCostController = BehaviorSubject<Map<String, double>>(seedValue: {});
  StreamController _cartCostController = BehaviorSubject<double>(seedValue: 0.0);

  //stream output controllers
  Stream<Map<String,int>> get cartItemStreamer => _cartItemController.stream;
  Stream<int> get cartQtyStreamer => _cartQtyController.stream;

  Stream<Map<String, double>> get cartItemCostStreamer => _cartItemCostController.stream;
  Stream<double> get cartCostStreamer => _cartCostController.stream;

   CartBloc(this._service){
     addProductToCart.stream.listen((_handleAddToCart));
     removeFromCart.stream.listen((_handleRemoveFromCart));

    //listen to incoming stream from service
     _service.cartItemsStreamer().listen((Map<String, int> item) {//add stream to bloc controller to stream to app
      _cartItemController.add(item);
      });


      _service.cartCountStreamer().listen((int count) { 
        _cartQtyController.add(count);
      });

      _service.cartItemsCostStreamer().listen((Map<String, double> itemCost) {
        _cartItemCostController.add(itemCost);
      });
      _service.cartCostStreamer().listen((double cost) {
        _cartCostController.add(cost);
      });
  }

  close(){
    _cartItemController.close();
    _cartQtyController.close();
    _cartCostController.close();
    _cartItemCostController.close();
    removeFromCart.close();
    addProductToCart.close();

  }


  void _handleAddToCart(AddToCartEvent p){
    _service.addToCart(p.product, p.qty, p.cost);

  }

  void _handleRemoveFromCart(RemoveFromCartEvent p){
    _service.removeFromCart(p.productTitle, p.qtyInCart, p.cost);
  }


}

class AddToCartEvent{
  final Product product;
  final int qty;
  final double cost;
  AddToCartEvent({this.product, this.qty, this.cost});
}

class RemoveFromCartEvent{
  final String productTitle;
  final int qtyInCart;
  final Product cost;
  RemoveFromCartEvent({this.productTitle, this.qtyInCart, this.cost});
}