// import 'dart:convert';
//
// import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';
// import '../models/category_product.dart';
// import 'package:http/http.dart' as http;
//
//
// class productsProviders with ChangeNotifier {
//   Future<List<productsProviders>> getCategoryApi() async {
//     final response = await http.get(
//       Uri.parse('https://ultimateapi.hostprohub.com/api/get-products'),
//     );
//     var data = jsonDecode(response.body);
//     dynamic result;
//     print(data);
//     if (response.statusCode == 200) {
//       result =  CategoryProduct.fromJson(data);
//     } else {
//       result = CategoryProduct.fromJson(data);
//     }
//     return result;
//   }
//
//   Future<List<productsProviders>> get result {
//     return result;
//   }
//
//   void addProduct() {
//     // _items.add(value);
//     notifyListeners();
//   }
// }