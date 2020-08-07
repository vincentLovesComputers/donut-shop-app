import 'package:flutter/material.dart';
import 'package:new_farmers_market_app/pages/base/page_base.dart';
import 'package:new_farmers_market_app/pages/base/page_container.dart';
import 'package:new_farmers_market_app/utils/routes.dart';
import 'package:new_farmers_market_app/utils/styles.dart';

class FarmersMarketApp extends StatefulWidget {
  @override
  _FarmersMarketAppState createState() => _FarmersMarketAppState();
}

class _FarmersMarketAppState extends State<FarmersMarketApp> {

  


  @override
  Widget build(BuildContext context) {

    var _theme = ThemeData(

    
    
    primaryTextTheme: Theme.of(context).textTheme.apply(
      bodyColor: AppColors.displayTextColor,
      displayColor: AppColors.displayTextColor,

    )

  );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _theme,
      routes: {
        Routes.catalogPage: (context) => PageContainer(
          pageType: PageType.Catalog,
                    
        ),
        Routes.cartPage: (context) => PageContainer(pageType: PageType.Cart)
      },
    ) ;         
      
    
  }
}