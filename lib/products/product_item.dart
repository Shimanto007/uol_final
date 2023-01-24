import 'package:flutter/material.dart';
import '../products/single_product.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {

  final dynamic id;
  final String product_name;
  final dynamic product_image;
  final int regularPrice;

  ProductItem(
    this.id,
    this.product_name,
    this.product_image,
    this.regularPrice,
  );

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen:false);
    double height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              SingleProduct.routeName,
              arguments: {
                'id': id,
                'product_name': product_name,
                'podcut_image': product_image,
                'product_price': regularPrice,
              },
            );
          },
          child: Image(
            image: NetworkImage(
                product_image),
            fit: BoxFit.cover,
          ),
        ),
        footer: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              SingleProduct.routeName,
              arguments: {
                'id': id,
                'product_name': product_name,
                'podcut_image': product_image,
                'product_price': regularPrice,
              },
            );
          },
          child: GridTileBar(
            backgroundColor: Color(0xFF0098B8),
            title: Center(
              child: Text(
                product_name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: "lato",
                ),
              ),
            ),
            subtitle: Center(child: Text("BDT $regularPrice")),
          //   trailing: IconButton(
          //   icon: Icon(
          //     Icons.shopping_cart,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     cart.addItem(id, product_price, product_name);
          //   },
          //   color: Theme.of(context).accentColor,
          // ),
          ),
        ),
      ),
    );
  }
}
