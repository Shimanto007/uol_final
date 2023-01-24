import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './search_field.dart';

// import 'main_slider/main_slider.dart';
// import 'category/categories_screen.dart';
import './products/category_products_screen.dart';
import './products/single_product.dart';
import './providers/products_provider.dart';
import './providers/cart.dart';
import './home_page.dart';
import './category_page.dart';
import './cart/cart_screen.dart';
import './providers/cart.dart';
import './cart/cart_screen.dart';
import './providers/orders.dart';
import './order/orders_screen.dart';
import '../authentication/auth_screen.dart';
import './providers/auth.dart';
import './main_home_page.dart';
import './authentication/reg_otp_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  void categoryScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      '/category-screen',
    );
  }


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (ctx, auth, previousOrders) => Orders(
              auth.token,
              previousOrders == null ? [] : previousOrders.orders),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AuthScreen(),
          routes: {
            '/reg_otp' : (item) => OtpScreen(),
            'home-page': (item) => NewStatefulWidget(),
            '/category-product': (ctx) => CategoryProductsScreen(),
            SingleProduct.routeName: (item) => SingleProduct(),
            CartScreen.routeName: (ctx) => CartScreen() ,
            '/category-screen': (item) => CategoryPage(),
            OrdersScreen.routeName: (ctx) => auth.isAuth ? OrdersScreen() : AuthScreen(),
          },
        ),
      ),
    );
  }
}
