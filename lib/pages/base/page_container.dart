import 'package:flutter/src/widgets/framework.dart';
import 'package:new_farmers_market_app/model/catalog.dart';
import 'package:new_farmers_market_app/model/product.dart';
import 'package:new_farmers_market_app/pages/base/page_background_image.dart';
import 'package:new_farmers_market_app/pages/base/page_base.dart';
import 'package:flutter/material.dart';
import 'package:new_farmers_market_app/pages/catalog_page.dart';
import 'package:new_farmers_market_app/pages/product_detail_page.dart';
import 'package:new_farmers_market_app/utils/product_seed.dart';
import 'package:new_farmers_market_app/widgets/catalog_widget.dart';

import '../cart_page.dart';


class PageContainer extends PageContainerBase{

  final PageType pageType;
  PageContainer({Key key, @required this.pageType});

  @override
  Widget get background => Container(
    decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/bg2.jpg"),
            fit: BoxFit.cover,
            
          ))
   );
  

  @override
  String get pageTitle{
    
      
    switch(pageType){
      case PageType.Cart:
        return "Shopping Cart";
      case PageType.Catalog:
    default:  
    return "";
  }}

  @override
  Widget get body{
    var page;
    switch (pageType){
      case PageType.Catalog:
        page = CatalogPage();
        break;
      case PageType.Cart:
        page = CartPage();
        break;
      default:
        page = CatalogPage();
    }

    return page;
  }

  @override
  Color get backgroundColor => Colors.transparent;
}



class ProductDetailPagecontainer extends PageContainerBase{
  final Product product;

  ProductDetailPagecontainer({@required this.product});

  ImageTitle get _getImageForCategory => categoriesToImageMap[product.category];

  @override
  Widget get background => BackgroundImage(
    key: PageStorageKey(product),
    imageTitle: _getImageForCategory,
  );

  @override
  String get pageTitle => "Product Detail";

  @override
  Widget get body => ProductDetailPage(product: product,);

  @override
  Color get backgroundColor => Colors.transparent;

  

  

}