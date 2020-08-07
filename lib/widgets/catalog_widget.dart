import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_farmers_market_app/blocs/app_state.dart';
import 'package:new_farmers_market_app/blocs/cart_bloc.dart';
import 'package:new_farmers_market_app/blocs/catalog_bloc.dart';
import 'package:new_farmers_market_app/model/product.dart';
import 'package:new_farmers_market_app/pages/base/page_container.dart';
import 'package:new_farmers_market_app/utils/custom_clipper.dart';
import 'package:new_farmers_market_app/utils/humanize.dart';
import 'package:new_farmers_market_app/utils/material_route_transition.dart';
import 'package:new_farmers_market_app/utils/styles.dart';
import 'package:new_farmers_market_app/widgets/product_details.dart';
import 'package:new_farmers_market_app/widgets/scrollables/add_to_cart_bottom_sheet.dart';
import 'package:new_farmers_market_app/widgets/scrollables/sliver_header.dart';

class CatalogWidget extends StatefulWidget {
  
  
  @override
  _CatalogWidgetState createState() => _CatalogWidgetState();
}

class _CatalogWidgetState extends State<CatalogWidget> {


  List<Widget> slivers =[];
  CatalogBloc _bloc;


  void didChangeDependencies() {
    super.didChangeDependencies();
    slivers = [];
    _bloc = AppStateContainer.of(context).blocProvider.catalogBloc;
  }
  void showBottomSheet(BuildContext context, Product product) async {
    var _cartBloc = AppStateContainer.of(context).blocProvider.cartBloc;
    
    
    int qty = await showModalBottomSheet(
      context: context, 
      builder: (BuildContext context){
        return AddToCartBottomSheet(key: Key(product.id),);
      });

    

    


      addToCart(product, qty, product.cost , _cartBloc );

  }

  void addToCart(Product p, int q, double cost, CartBloc bloc){
    bloc.addProductToCart.add(AddToCartEvent(product: p, qty: q, cost: cost));
  }

 


  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[ 
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Column(             
            
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[                                                           
                            Container(height:55,child: Text("Primo's", style: GoogleFonts.bangers(letterSpacing: 2,textStyle: TextStyle(fontSize: 50, color: Colors.yellow)))),

                             Text("Bakery", style: GoogleFonts.bangers(textStyle: TextStyle(letterSpacing: 2,fontSize: 40, color: Colors.orangeAccent))),
                          
                             
                            
                            ],
                          ),
                        ),
                        
                      ],
                    ),
 
                  ],
                
            ),
          ),           
        
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: AppColors.colorGradient,
                  stops:[0.05,0,0.5,0.7,0.8,1]
                  ),
              ),
             
              child: Padding(
                padding: const EdgeInsets.only(top:140),
                child: CustomScrollView(
                  slivers: _buildSlivers(context),
                  physics: BouncingScrollPhysics(),
                  
                ),
              
            ),
          ),
        ),

        ],
        
      
    );
  }

  List<Widget> _buildSlivers(BuildContext context){
    if(slivers.isNotEmpty && slivers!=null){
      return slivers;
    }

    _bloc.productStreamByCategory.forEach((Stream<List<Product>> dataStream) {

      slivers.add(
      StreamBuilder(
        stream: dataStream,      
        builder: (context, AsyncSnapshot<List<Product>> snapshot){
          return CustomSliverHeader(
              headerText: Humanize.productCategoryFromEnum(snapshot?.data?.first?.category) ?? "header",
              onTap: (String text)=> print(text),
              
            
          );
        }
        )
    );

    slivers.add(
      StreamBuilder(
        stream: dataStream,
        builder: (context, AsyncSnapshot<List<Product>> snapshot){
          return SliverGrid(            
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,             
             ),
             delegate: SliverChildBuilderDelegate(
               (BuildContext context, int index){
                 var _product  = snapshot.data[index];
                 return ProductDetailCard(
                   key: ValueKey(_product.imageTitle.toString()),
                   onTap: (){
                     _toProductDetailsPage(_product);
                   },
                   onLongPress: () => showBottomSheet(context, _product),
                   product: _product,

                 );

               },
               childCount: snapshot.data?.length ?? 0,
             ));
        },
      )
    );

     });

     return slivers;   


  }
  Future _toProductDetailsPage(Product product) async{
    await Navigator.push(context, FadeInSildeOutRoute(
      builder: (context) => ProductDetailPagecontainer(
        product: product,
      ),
    ));
  }
}