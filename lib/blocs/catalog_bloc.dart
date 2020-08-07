import 'dart:async';

import 'package:new_farmers_market_app/model/product.dart';
import 'package:new_farmers_market_app/services/catalog_services.dart';
import 'package:new_farmers_market_app/utils/generate_data.dart';
import 'package:rxdart/rxdart.dart';

class CatalogBloc{

  final CatalogService _service;

  

  //OUTPUT
  StreamController _productStreamController = BehaviorSubject<List<Product>>(seedValue: populateCatalog().availableProducts);

  //GETTERS
  Stream<List<Product>> get allProducts => _productStreamController.stream;

  List<StreamController<List<Product>>> _categoryController = [];
  List<Stream<List<Product>>> productStreamByCategory = [];

  
  CatalogBloc(this._service){

    //listen to catalogservice stream and add to bloc stream controller
    _service.streamProduct().listen((List<Product> data) { 
      _productStreamController.add(data);
    });

    //stream product by category
    ProductCategory.values.forEach((ProductCategory category) { 
      var _controller = BehaviorSubject<List<Product>>();
      
      //listen to catalogservice stream and
      //populate _controller stream controller with data of product model
      _service.streamProductCategory(category).listen((List<Product> data) {
        return _controller.add(data);
      });
      //populate category controller with _controller data(list of products of one category)
      return _categoryController.add(_controller);
    });

    //for each stream controller add to stream. Sttream products by respetive scategory
    _categoryController.forEach((StreamController<List<Product>> controller) { 
      productStreamByCategory.add(controller.stream);
    });

}

void dispose(){
  _productStreamController.close();
  _categoryController.forEach((controller) { 
    controller.close(); //close each stream controller
  });


}
  



}