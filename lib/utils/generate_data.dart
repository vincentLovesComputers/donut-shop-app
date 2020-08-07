import 'dart:math' as math;
import 'package:new_farmers_market_app/model/cart.dart';
import 'package:new_farmers_market_app/model/catalog.dart';
import 'package:new_farmers_market_app/model/product.dart';
import 'package:new_farmers_market_app/utils/product_seed.dart';


//populate availabe products[catalog model] with data in product seed
Catalog populateCatalog(){
  var catalog = Catalog();
  availableProductsToImage.forEach((String productName, ImageTitle imageTitle) { 
    catalog.availableProducts.add(createProduct(productName));
  });

  return catalog;
    
}

Product createProduct(String product){
  return Product(
    title: product,
    category: getCategoryForProduct(product),
    cost: determineCost(),
    imageTitle: availableProductsToImage[product],      
  );
}


//get the category of the product
ProductCategory getCategoryForProduct(String product) => 
  categorizeProducts.entries.firstWhere(
    (MapEntry<ProductCategory, List<String>> entry) => 
      entry.value.contains(product)).key;


//get a random cost for the product
var _random = math.Random();
double determineCost(){
  var cost = (_random.nextDouble() *3.3).clamp(0.7, 3.3).toStringAsFixed(2);
  return double.parse(cost);
}


Cart buildInitialCart(){
  return Cart()
  .. items ={}
  .. totalCartItems = 0
  .. itemsCostMap = {}
  .. totalCost = 0.0;  
}



