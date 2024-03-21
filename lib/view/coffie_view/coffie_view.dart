import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChocolatePage extends StatefulWidget {
  const ChocolatePage({super.key});
 
  @override
  State<ChocolatePage> createState() => _ChocolatePageState();
}

class _ChocolatePageState extends State<ChocolatePage> {
  final maxHeight = 600;
  final minHeight = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: SliverAppbarDelegate(
                maxHeight: maxHeight / 2,
                minHeight: minHeight / 2,
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color(0xff4b5de0),
                            Color(0xff1e0c98),
                          ]
                      ),
                      
                      
                  ),
                )
            ),
          ),
        SliverPersistentHeader(
                pinned: true,
                delegate: SliverAppbarDelegate(
                    maxHeight: maxHeight / 2,
                    minHeight: minHeight / 2,
                    child: Container(
                      color: Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 16.0,bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(),
                            Text('Chips',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w700),),
                            SizedBox(height: 20,),
                            Text('\$12.99 ',style: TextStyle(color:Color(0xff1e0c98),fontWeight: FontWeight.w600,fontSize: 30),)
                          ],
                        ),
                      ),
                    )
                ),
              ),
          // recipeDetail()
        ],
      ),
    );
  }
}

class SliverAppbarDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final Widget child;

  SliverAppbarDelegate(
      {Key? key, required this.maxHeight, required this.minHeight, required this.child});


  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) => SizedBox.expand(child: child,);

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverAppbarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }

}