import 'package:new_farmers_market_app/utils/product_seed.dart';
import 'package:new_farmers_market_app/utils/uuid.dart';

class Product{

  String id;
  ImageTitle imageTitle;
  ProductCategory category;
  String title;
  double cost;

  Product ({this.id, this.imageTitle, this.title, this.category, this.cost});

  String get uniqueId => Uuid().generateV4();
  String get imageUrl => productImageFile[imageTitle];
  
}
enum ProductCategory{
  Bread, Cakes, Cookies
}

enum ImageTitle{
  GingerBread,
  GarlicBread,
  SourDough,
  Baguette,
  Ciabatta,
  Croissant,
  TigerBread,
  TurkishBread,
  QholeWheat,

  BlueberryCake,
  CanoliCake,
  CaramelCake,
  CarrotCake,
  CocaColaCake,
  CoconutCake,
  IcecreamCake,
  OreoCake,
  RaspberryCake,
  VanillaCake,

  BiscottiCookies,
  GingerSnapsCookies,
  KissCookies,
  MolassesCookies,
  OatmealRasinCookie,
  PeanutButterCookies,
  SnickerdoodlesCookies,
  SnowballCookies,
  WhoopiePiesCookies,
}