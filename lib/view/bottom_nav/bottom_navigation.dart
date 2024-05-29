import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:zudocoz/view/coffie_view/coffie_view.dart';
import 'package:zudocoz/view/home/home_page.dart';
import 'package:zudocoz/view/profile_page/profile_view.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int currentIndex = 0;
  final List<Widget> pages = [
    const HomeScreen(),
    const MapScreen(),
     ProfileViewscreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      extendBody: true,
      bottomNavigationBar: SizedBox(
        height: 158.0,
        child: DotNavigationBar(
          
          backgroundColor: Colors.white54,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            DotNavigationBarItem(
              icon: const Icon(
                CupertinoIcons.home,
                color: Colors.black, 
              ),
              selectedColor: Colors.brown, 
              unselectedColor: Colors.grey, 
              
            ),
            DotNavigationBarItem(
              icon: const Icon(
                CupertinoIcons.cart_fill,
                color: Colors.black, 
              ),
              selectedColor: Colors.brown, 
              unselectedColor: Colors.grey, 
              
            ),
            DotNavigationBarItem(
              icon: const Icon(
                CupertinoIcons.profile_circled,
                color: Colors.black, 
              ),
              selectedColor: Colors.brown, 
              unselectedColor: Colors.grey, 
              
            ),
          ],
        ),
      ),
    );
  }
}
