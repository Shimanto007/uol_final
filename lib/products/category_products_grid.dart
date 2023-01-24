import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/category_product.dart';
import './product_item.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class category_products_grid extends StatefulWidget {
  @override
  State<category_products_grid> createState() => _category_products_gridState();
}

class _category_products_gridState extends State<category_products_grid> {
  Future<CategoryProduct> getCategoryApi() async {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final categoriesId = routeArgs['id'];
    final response = await http.get(
      Uri.parse(
          'https://ultimateapi.hostprohub.com/api/get-category-products/$categoriesId'),
    );

    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return CategoryProduct.fromJson(data);
    } else {
      return CategoryProduct.fromJson(data);
    }
  }

  @override
  void initState() {
    super.initState();
    // this.getCategoryApi();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    this.getCategoryApi();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(10),
      height: height,
      child: FutureBuilder<CategoryProduct>(
        future: getCategoryApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final categoriesProduct = snapshot.data.data.data;
            return Center(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.8,
                ),
                itemCount: categoriesProduct.length,
                itemBuilder: (context, i) => ProductItem(
                  categoriesProduct[i].id,
                  categoriesProduct[i].name,
                  categoriesProduct[i].image.small,
                  categoriesProduct[i].regularPrice,
                ),
              ),
            );
          } else {
            return Text("loading");
          }
        },
      ),
    );
  }
}
