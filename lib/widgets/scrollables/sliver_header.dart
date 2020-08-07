import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:new_farmers_market_app/utils/styles.dart';

class CustomSliverHeader extends StatelessWidget {

  final double scrollPosition;
  final String headerText;
  final Function onTap;

  CustomSliverHeader({Key key, this.headerText, this.scrollPosition, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(

        minHeight: Spacing.matGridUnit(scale: 2),
        maxHeight: Spacing.matGridUnit(scale: 3),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Container(
            child: GestureDetector(
              onTap: () => onTap(this.headerText),

              child: Container(
                decoration: BoxDecoration(
                  boxShadow:[
                    BoxShadow(                    
                      color: Colors.grey.withOpacity(0.6),
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                // child: Padding(
                //   padding: const EdgeInsets.fromLTRB(6.0, 0, 6.0, 0),
                  child: Stack(
                    
                    children: <Widget>[
                    Center(
                      child:Container(
                        decoration: BoxDecoration(color: AppColors.textColor),
                        height: .5,
                      )
                    ),
                    
                    Center(
                      child:Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Spacing.matGridUnit(),                      
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),

                        child: Text(
                          headerText,
                          style: Theme.of(context).textTheme.subhead.copyWith(fontSize: 12),
                        ),
                      )
                    )
                  ],

                  ),
                ),
                
                
              ),
            ),
        ),
        )

        

      
      
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate{
  final double minHeight;
  final double maxHeight;
  final Widget child;
  SliverAppBarDelegate({@required this.minHeight, @required this.maxHeight, @required this.child});

  @override
  Widget build(
    BuildContext context, double  shrinkOffset, bool overlapsContent) {
      return SizedBox.expand(child: child);
      
    }

    //size of header when it is not shrinking
    @override
    double get maxExtent => math.max(maxHeight, minHeight);

    //size of header when it is has shrunk
    @override
    double get minExtent => minHeight;

    //rebuilds header when return true 
    @override
    bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
      return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
          child != oldDelegate.child;    
  }


}