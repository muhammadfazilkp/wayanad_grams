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
final List<Widget> pages = [const HomeScreen(), const  MapScreen()];

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
              selectedIconTheme: const IconThemeData(color: Colors.black),
              unselectedItemColor: Colors.black,
              elevation: 30.8,
              mouseCursor: MaterialStateMouseCursor.clickable,
              backgroundColor: const Color.fromARGB(255, 11, 9, 9),
              fixedColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.home,
                    color: Colors.white,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.cart_fill,
                    color: Colors.white,
                  ),
                  label: "My Cart",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.white,
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
