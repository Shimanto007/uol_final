import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/category_product.dart';
import './product_item.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../models/popular_products.dart';

class popular_products_grid extends StatefulWidget {
  @override
  State<popular_products_grid> createState() => _popular_products_grid();
}

class _popular_products_grid extends State<popular_products_grid> {
  Future<PopularProducts> getPopularProductsApi() async {
    final response = await http.get(
      Uri.parse(
          'https://ultimateapi.hostprohub.com/api/popular'),
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return PopularProducts.fromJson(data);
    } else {
      return PopularProducts.fromJson(data);
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
    this.getPopularProductsApi();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(10),
      height: height,
      child: FutureBuilder<PopularProducts>(
        future: getPopularProductsApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final popularProduct = snapshot.data.data;
            return Center(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 0,
                  childAspectRatio: 0.9,
                ),
                itemCount: popularProduct.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => ProductItem(
                  popularProduct[i].id,
                  popularProduct[i].name,
                  popularProduct[i].image.small,
                  popularProduct[i].regularPrice,
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
