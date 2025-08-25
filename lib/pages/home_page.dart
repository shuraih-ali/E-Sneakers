import 'package:e_sneakers/Components/bottom_nav_bar.dart';
import 'package:e_sneakers/pages/CartPage.dart';
import 'package:e_sneakers/pages/ShopPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // index selection for bottom nav bar
  int _selectedIndex = 0;

  // for update of the index when the user taps its...
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages to display
  final List<Widget> _pages = [
    //shop page
    const ShopPage(),

    //cart page
    const CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
                Column(
                  children:
                  //logo
                   [
                    DrawerHeader(
                      child: Image.asset(
                        'lib/Images/nike-logo.png',
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Divider(color: Colors.grey[800]),
                    ),

                    //other pages
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        leading: Icon(Icons.home, color: Colors.white),
                        title: Text(
                          "Home ",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        leading: Icon(Icons.info, color: Colors.white),
                        title: Text(
                          "Info ",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    
                  ],
                ),
                Padding(
                      padding: const EdgeInsets.only(left: 25.0,bottom: 25),
                      child: ListTile(
                        leading: Icon(Icons.logout, color: Colors.white),
                        title: Text(
                          "Logout ",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
              ],
        ),
      ),
    );
  }
}
