import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_organic_life_app/app_drawer.dart';
import '../providers/cart.dart';
import './cart_item.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          iconTheme: IconThemeData(color: Color(0xFF0098B8),),
          systemOverlayStyle: const SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.transparent,
            // Status bar brightness (optional)
            statusBarIconBrightness: Brightness.dark,
            // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          title: Text(
            'Cart',
            style: TextStyle(
              fontFamily: 'Lato',
            ),
          ),
          // leading: IconButton(
          //   color: Color(0xFF0098B8),
          // ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xFF0098B8),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Chip(
                      label: Text(
                        'BDT ${cart.totalAmount}',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Color(0xFF0098B8),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(5.0),
                        backgroundColor: Color(0xFF0098B8),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.centerLeft,
                      ),
                      child: Text(
                        'Order Now',
                        style: TextStyle(
                          color: Colors.white,
                          backgroundColor: Color(0xFF0098B8),
                        ),
                      ),
                      onPressed: () {
                        Provider.of<Orders>(context, listen:false).addOrder(
                            cart.items.values.toList(),
                            cart.totalAmount,
                        );
                        cart.clearCart();
                      },
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => CartItems(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price.toDouble(),
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].title,
                    cart.items.values.toList()[i].image,
                ),
              ),
            ),

          ],
        ),
    );
  }
}
