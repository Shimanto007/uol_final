import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_organic_life_app/authentication/auth_screen.dart';
import './search_field.dart';
import 'cart/badge.dart';
import 'main_slider/main_slider.dart';
import 'category/categories_screen.dart';
import './products/category_products_screen.dart';
import './products/single_product.dart';
import './providers/products_provider.dart';
import './providers/cart.dart';
import './cart/cart_screen.dart';
import '../products/popular_product_screen.dart';
import '../home_page.dart';
import './authentication/auth_screen.dart';
import './providers/auth.dart';
import './app_drawer.dart';
import './providers/auth.dart';
import './main.dart';
import './products/single_product.dart';

class MainHomePage extends StatefulWidget {
  static const routeName = '/home-page';

  @override
  State<MainHomePage> createState() => _MainHomePage();
}

class _MainHomePage extends State<MainHomePage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    NewStatefulWidget(),
    CartScreen(),
    NewStatefulWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xFF0098B8),
            ),
            systemOverlayStyle: const SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: Colors.transparent,
              // Status bar brightness (optional)
              statusBarIconBrightness: Brightness.dark,
              // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            title: Text(
              'Ultimate Organic Life',
              style: TextStyle(
                fontFamily: 'Lato',
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Color(0xFF0098B8),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // drawer: AppDrawer(),
          body: IndexedStack(
            index: _selectedIndex,
            children: _widgetOptions,
          ),
          // _widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              backgroundColor: Color(0xFFf1f6f7),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Stack(
                    children: <Widget>[
                      IconButton(
                            icon: Icon(
                              Icons.home,
                              semanticLabel: 'cart',
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/');
                            },
                          ),
                    ],
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Stack(
                      children: <Widget>[
                        Consumer<Cart>(
                            builder: (_, cartData, ch) => Badges(
                              child: ch,
                              value: cart.itemCount.toString(),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.shopping_cart,
                                semanticLabel: 'cart',
                              ),
                              // onPressed: () {
                              //   Navigator.of(context).pushNamed(CartScreen.routeName);
                              // },
                            ),
                          ),
                      ],
                    ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.man),
                  label: '',
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.school),
                //   label: 'School',
                // ),
              ],
              currentIndex: _selectedIndex,
              selectedIconTheme: IconThemeData(
                color: Color(0xFF0098B8),
              ),
              onTap: _onItemTapped,
              unselectedItemColor: Color(0xFF0098B8).withOpacity(0.5),
              elevation: 0.8,
            ),

        );
  }
}
