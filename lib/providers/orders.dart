import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({this.id, this.amount, this.products, this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders =[];
  final String authToken;

  Orders(this.authToken, this._orders);

  List<OrderItem> get orders{
    return[..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount:total, dateTime: DateTime.now(),
            products: cartProducts,
        ),
    );
    notifyListeners();
  }
}