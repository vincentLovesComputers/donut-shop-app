import 'package:new_farmers_market_app/model/product.dart';
import 'package:new_farmers_market_app/storage/mock_store.dart';

abstract class CartService{
  Stream<int> cartCountStreamer();
  Stream<Map<String, int>> cartItemsStreamer();
  Stream<Map<String, double>> cartItemsCostStreamer();
  Stream<double> cartCostStreamer();
  Future addToCart(Product p, int qty, double cost);
  Future<void> removeFromCart(String p, int qty, Product cost);
}

class CartServiceTemporary extends CartService{
  final AppStore store;
  CartServiceTemporary(this.store);

  @override
  Future addToCart(Product p, int qty, double prodCost) async{
    var newTotalQtyCart = store.getCart.totalCartItems +  qty;
    var newProductTotalQty = _currentProductQty(p) + qty; 
  
    store.getCart.totalCartItems = newTotalQtyCart;
    store.getCart.items[p.title] = newProductTotalQty;

    var newTotalCostCart = store.getCart.totalCost + prodCost;
    var newProductToalCost = _currentProductCost(p) + prodCost;
    store.getCart.totalCost = newTotalCostCart;
    store.getCart.itemsCostMap[p.title] = newProductToalCost;

    store.cart= store.getCart;
    }

  @override
    Future<void> removeFromCart(String p, qty, Product cost) async {
      var newTotalQtyCart = store.getCart.totalCartItems - qty;
      store.getCart.totalCartItems = newTotalQtyCart;
      store.getCart.items.remove(p);
      store.cart = store.getCart; //reactivity
    
  }
  
  //stream quantity of items to bloc
  @override
  Stream<int> cartCountStreamer() {
    return store.cartNotifier.stream.map((dartData) => dartData.totalCartItems);
    
  }
  
  //stream cart items from stream broadcast to bloc
  @override
  Stream<Map<String, int>> cartItemsStreamer() {
    return store.cartNotifier.stream.map((dartData) => dartData.items);
    
  }
  @override
  Stream<Map<String, double>> cartItemsCostStreamer(){
    return store.cartNotifier.stream.map((dartData) => dartData.itemsCostMap);
  }

  @override
  Stream<double> cartCostStreamer() {
    return store.cartNotifier.stream.map((dartDat) => dartDat.totalCost);
  }

  //return value quantity of current product map key
  int _currentProductQty(Product p){
    //check if prod exists in count
    if(!store.getCart.items.containsKey(p.title)) return 0;    
    return store.getCart.items[p.title];
    
  }

  double _currentProductCost(Product p){
    if(!store.getCart.itemsCostMap.containsKey(p.title)) return 0;
    return store.getCart.itemsCostMap[p.title];
  }

  

  
  

}