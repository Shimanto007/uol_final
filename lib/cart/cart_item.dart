import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  final String image;

  CartItems(this.id, this.productId, this.price, this.quantity, this.title, this.image);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4,),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: Image(
              image: NetworkImage('$image'),
            ),
            title: Text(title),
            subtitle: Text('price: ${(price)}'),
            trailing:
                  Text('quantity $quantity'),
            ),

          ),
        ),
      );
  }
}
