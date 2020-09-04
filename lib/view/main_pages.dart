import 'package:flutter/material.dart';
import 'package:flutterbookstore/view/cart_screen.dart';
import 'package:flutterbookstore/view/home_screen.dart';
import 'package:flutterbookstore/view/profile_screen.dart';
import 'package:flutterbookstore/view/search_screen.dart';

class MainPages extends StatefulWidget {
  @override
  _MainPagesState createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  final List<Widget> pages = [
    new HomeScreen(),
    new SearchScreen(),
    new CartScreen(),
    new ProfileScreen()
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pages[selectedIndex],
          Positioned(left: 0, right: 0, bottom: 20, child: bottomNavigationBar)
        ],
      ),
    );
  }

  Widget get bottomNavigationBar {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xff0FB269),
          selectedFontSize: 0,
          elevation: 8,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              print(index.toString());
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  "images/bottom_nav_ic_home.png",
                  color: selectedIndex == 0
                      ? Color(0xff0FB269)
                      : Color(0xff707070),
                ),
                title: Text("")),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "images/bottom_nav_ic_search.png",
                  color: selectedIndex == 1
                      ? Color(0xff0FB269)
                      : Color(0xff707070),
                ),
                title: Text("")),
            BottomNavigationBarItem(
                icon: Image.asset("images/bottom_nav_ic_cart.png",
                    color: selectedIndex == 2
                        ? Color(0xff0FB269)
                        : Color(0xff707070)),
                title: Text("")),
            BottomNavigationBarItem(
                icon: Image.asset("images/bottom_nav_ic_user.png",
                    color: selectedIndex == 3
                        ? Color(0xff0FB269)
                        : Color(0xff707070)),
                title: Text("")),
          ],
        ),
      ),
    );
  }
}
