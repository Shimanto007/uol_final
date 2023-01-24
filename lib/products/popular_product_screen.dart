import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/category_product.dart';
import 'category_products_grid.dart';
import '../app_drawer.dart';
import './popular_products_grid.dart';

class PopularProductScreen extends StatefulWidget {
  static const routeName = 'popular-product';


  @override
  State<PopularProductScreen> createState() => _PopularProductScreen();
}
class _PopularProductScreen extends State<PopularProductScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          child: Text(
            'Popular Products',
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF0098B8),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
            child: popular_products_grid(),
        ),
      ],
    );
  }
}


