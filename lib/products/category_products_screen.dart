import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/category_product.dart';
import 'category_products_grid.dart';
import '../app_drawer.dart';

class CategoryProductsScreen extends StatefulWidget {
  static const routeName = 'category-product';

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}
class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final categoriesTitle = routeArgs['title'];
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF0098B8),),
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.transparent,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark,
          // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        // leading: const BackButton(
        //   color: Color(0xFF0098B8),
        // ),
        title: Text(
          categoriesTitle,
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
      drawer: AppDrawer(),
      body: category_products_grid(),
    );
  }
}


