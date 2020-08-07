import 'package:new_farmers_market_app/model/product.dart';
import 'dart:async';

import 'package:new_farmers_market_app/storage/mock_store.dart';


abstract class CatalogService{
  Stream<List<Product>> streamProduct();
  Stream<List<Product>> streamProductCategory(ProductCategory category);

}

class CatalogServiceTemporary implements CatalogService{
  AppStore store;

  CatalogServiceTemporary({this.store});

  Stream<List<Product>> streamProduct(){
    return store.catalogNotifier.stream.map((snapshot){
      return snapshot.availableProducts;
    });
  }


  Stream<List<Product>> streamProductCategory(ProductCategory category){
    //return current product from the stream {'','',...}
    return store.catalogNotifier.stream.map((snapshot){
      //return all products where each category of the product
      // is equal to the category of the current product streamed from the store
      return store.getCatalog.availableProducts.where((Product p) =>
        p.category == category 
      ).toList(); //put those productts in a list
    });
  }

  
}