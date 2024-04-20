import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zudocoz/view/coffie_view/coffie_view.dart';
import 'package:zudocoz/view/home/home_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key, Key? ky});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

int currentIndex = 0;
final List<Widget> pages = [const HomeScreen(), const MapScreen()];

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: BottomNavigationBar(
              
              selectedFontSize: 17,
              selectedIconTheme:
                  const IconThemeData(color: Colors.brown, size: 28),
              selectedItemColor: Colors.brown,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.home,
                    // color: Colors.brown,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.cart_fill,
                    // color: Colors.brown,
                  ),
                  label: "My Cart",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.profile_circled,
                    // color: Colors.white,
                  ),
                  label: 'Profile',
                ),
              ],
              currentIndex: currentIndex,
              onTap: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
