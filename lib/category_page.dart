import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_organic_life_app/main.dart';
import './search_field.dart';
import 'main_slider/main_slider.dart';
import 'category/categories_screen.dart';
import './products/category_products_screen.dart';
import './products/single_product.dart';
import './providers/products_provider.dart';
import './providers/cart.dart';
import './cart/cart_screen.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = '/category-screen';

  @override
  Widget build(BuildContext context) {
    return CatStatefulWidget();
  }
}

class CatStatefulWidget extends StatefulWidget {
  static const routeName = '/category-page';


  @override
  State<CatStatefulWidget> createState() => _CatStatefulWidgetState();
}

class _CatStatefulWidgetState extends State<CatStatefulWidget> {
  void homeScreen(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: Colors.transparent,
              // Status bar brightness (optional)
              statusBarIconBrightness: Brightness.dark,
              // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            leading: const BackButton(
              color: Color(0xFF0098B8),
            ),
            title: Text(
              'Categories',
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                SearchBar(),
                CategoriesScreen(),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Color(0xFF0098B8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: IconButton(
                    onPressed: () => homeScreen(context),
                    icon: Icon(Icons.home),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.category),
                  color: Colors.white,
                ),
                IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                      icon: Icon(Icons.shopping_cart),
                      color: Colors.white,
                    ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                  color: Colors.white,
                ),
              ],
            ),

          ),
        ),
        routes: {
          '/category-product': (item) => CategoryProductsScreen(),
          SingleProduct.routeName: (item) => SingleProduct(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
