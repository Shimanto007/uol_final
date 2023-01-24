import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './search_field.dart';
import 'main_slider/main_slider.dart';
import 'category/categories_screen.dart';
import './products/category_products_screen.dart';
import './products/single_product.dart';
import './providers/products_provider.dart';
import './providers/cart.dart';
import './cart/cart_screen.dart';
import '../products/popular_product_screen.dart';
import '../app_drawer.dart';

class NewStatefulWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return NewStatesfulWidget();
  }
}


class NewStatesfulWidget extends StatefulWidget {
  static const routeName = '/home-page';

  @override
  State<NewStatesfulWidget> createState() => _NewStatesfulWidgetState();
}

class _NewStatesfulWidgetState extends State<NewStatesfulWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              children: [
                SearchBar(),
                FullscreenSliderDemo(),
                CategoriesScreen(),
                PopularProductScreen()
              ],
            ),
        ),
      );
  }
}
