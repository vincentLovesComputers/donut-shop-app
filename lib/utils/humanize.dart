import 'package:new_farmers_market_app/model/product.dart';

class Humanize{
  static String productCategoryFromEnum(ProductCategory c){
    return c.toString().split(".").last;
  }
}