
import 'package:new_farmers_market_app/model/product.dart';

Map<ImageTitle, String> productImageFile = {
  ImageTitle.Baguette: "assets/images/bread/Baguette.jpg",
  ImageTitle.Ciabatta: "assets/images/bread/Ciabatta.jpg",
  ImageTitle.Croissant: "assets/images/bread/Croissant.jpg",
  ImageTitle.GarlicBread: "assets/images/bread/GarlicBread.jpg",
  ImageTitle.GingerBread: "assets/images/bread/GingerBread.jpg",
  ImageTitle.SourDough: "assets/images/bread/SourDough.jpg",
  ImageTitle.TigerBread: "assets/images/bread/TigerBread.jpg",
  ImageTitle.TurkishBread: "assets/images/bread/TurkishBread.jpg",

  ImageTitle.BlueberryCake: "assets/images/cakes/BlueberryCake.jpg",
  ImageTitle.CanoliCake: "assets/images/cakes/CanoliCake.jpg",
  ImageTitle.CaramelCake: "assets/images/cakes/CaramelCake.jpg",
  ImageTitle.CarrotCake: "assets/images/cakes/CarrotCake.jpg",
  ImageTitle.CocaColaCake: "assets/images/cakes/CocaColaCake.jpg",
  ImageTitle.CoconutCake: "assets/images/cakes/CoconutCake.jpg",
  ImageTitle.IcecreamCake: "assets/images/cakes/IcecreamCake.jpg",
  ImageTitle.OreoCake: "assets/images/cakes/OreoCake.jpg",
  ImageTitle.RaspberryCake: "assets/images/cakes/RaspberryCake.jpg",
  ImageTitle.VanillaCake: "assets/images/cakes/VanillaCake.jpg",

  ImageTitle.BiscottiCookies: "assets/images/cookies/BiscottiCookies.jpg",
  ImageTitle.GingerSnapsCookies: "assets/images/cookies/GingerSnapsCookies.jpg",
  ImageTitle.KissCookies: "assets/images/cookies/KissCookies.jpg",
  ImageTitle.MolassesCookies: "assets/images/cookies/MolassesCookies.jpg",
  ImageTitle.OatmealRasinCookie: "assets/images/cookies/OatmealRasinCookie.jpg",
  ImageTitle.PeanutButterCookies: "assets/images/cookies/PeanutButterCookies.jpg",
  ImageTitle.SnickerdoodlesCookies: "assets/images/cookies/SnickerdoodlesCookies.jpg",
  ImageTitle.SnowballCookies: "assets/images/cookies/SnowballCookies.jpg",
  ImageTitle.WhoopiePiesCookies: "assets/images/cookies/WhoopiePiesCookies.jpg",

};

Map<String, ImageTitle> availableProductsToImage = {
  "Baguette": ImageTitle.Baguette,
  "Ciabatta": ImageTitle.Ciabatta,
  "Croissant": ImageTitle.Croissant,
  "Garlic bread": ImageTitle.GarlicBread,
  "Ginger bread": ImageTitle.GingerBread,
  "SourDough": ImageTitle.SourDough,
  "Tiger bread": ImageTitle.TigerBread,
  "Turkish bread": ImageTitle.TurkishBread,

  "Blueberry": ImageTitle.BlueberryCake,
  "Canoli": ImageTitle.CanoliCake,
  "Caramel": ImageTitle.CaramelCake,
  "Carrot": ImageTitle.CarrotCake,
  "Coca Cola": ImageTitle.CocaColaCake,
  "Coconut": ImageTitle.CoconutCake,
  "Ice Cream": ImageTitle.IcecreamCake,
  "Oreo": ImageTitle.OreoCake,
  "Raspberry": ImageTitle.RaspberryCake,
  "Vanilla": ImageTitle.VanillaCake,

  "Biscotti": ImageTitle.BiscottiCookies,
  "GingerSnaps": ImageTitle.GingerSnapsCookies,
  "Kiss": ImageTitle.KissCookies,
  "Molasses": ImageTitle.MolassesCookies,
  "OatmealRasin": ImageTitle.OatmealRasinCookie,
  "PeanutButter": ImageTitle.PeanutButterCookies,
  "Snickerdoodles": ImageTitle.SnickerdoodlesCookies,
  "Snowball": ImageTitle.SnowballCookies,
  "WhoopiePies": ImageTitle.WhoopiePiesCookies,

};

Map<String, ImageTitle> categoriesToImageMap = {
  "Bread": ImageTitle.GingerBread,
  "Cake": ImageTitle.CaramelCake,
  "Cookies": ImageTitle.WhoopiePiesCookies,
 
};

Map<ProductCategory, List<String>> categorizeProducts = {
  ProductCategory.Bread: [
    "Baguette",
    "Ciabatta",
    "Croissant",
    "Garlic bread",
    "Ginger bread",
    "SourDough",
    "Tiger bread",
    "Turkish bread",
  ],
  ProductCategory.Cakes: [
    "Blueberry",
    "Canoli",
    "Caramel",
    "Carrot",
    "Coca Cola",
    "Coconut",
    "Ice Cream",
    "Oreo",
    "Raspberry",
    "Vanilla",
  ],
  ProductCategory.Cookies: [
    "Biscotti",
    "GingerSnaps",
    "Kiss",
    "Molasses",
    "OatmealRasin",
    "PeanutButter",
    "Snickerdoodles",
    "Snowball",
    "WhoopiePies",
  ],
  
};
