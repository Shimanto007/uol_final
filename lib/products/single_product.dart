import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:html/parser.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../cart/badge.dart';
import '../cart/cart_screen.dart';
import '../models/singular_product.dart';

// import '../models/category_product.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../providers/auth.dart';

class SingleProduct extends StatefulWidget {
  static const routeName = '/single-product';

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct>
    with SingleTickerProviderStateMixin {
  Future<CategorySingularProduct> getCategoryApi() async {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final productId = routeArgs['id'];
    final response = await http.get(
      Uri.parse(
          'https://ultimateapi.hostprohub.com/api/get-product/$productId'),
    );

    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return CategorySingularProduct.fromJson(data);
    } else {
      return CategorySingularProduct.fromJson(data);
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
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final productName = routeArgs['product_name'];
    final cart = Provider.of<Cart>(context, listen: false);


    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.transparent,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        title: Text(
          productName,
        ),
        leading: const BackButton(
          color: Color(0xFF0098B8),
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
      body: FutureBuilder<CategorySingularProduct>(
          future: getCategoryApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final singularProduct = snapshot.data.product[0];
              print(singularProduct.id);
              // String myHtml = """${singularProduct.description}""";
              // var document = parse(myHtml);
              // String parsedString = document.documentElement.text;.
              final String htmlCode = """${singularProduct.description}""";

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Image(
                      image: NetworkImage(singularProduct.productImage.small),
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        singularProduct.productName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF0098B8),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "lato",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'BDT ${singularProduct.productPrice}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF0098B8),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "lato",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "lato",
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Color(0xFF0098B8),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      // child: Text(
                      //   'parsedString',
                      // ),
                      child: HtmlWidget(
                        htmlCode,
                      ),
                    ),
                    Consumer<Cart>(
                      builder: (_, cartData, ch) => Badges(
                        child: ch,
                        value: cart.itemCount.toString(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          semanticLabel: 'cart',
                        ),
                        onPressed: () {
                          cart.addItem(
                              singularProduct.id.toString(),
                              singularProduct.productPrice,
                              singularProduct.productName,
                              singularProduct.productImage.small,
                          );
                        },
                      ),
                    ),
                    Container(
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(CartScreen.routeName);
                        },
                        icon: Icon(Icons.shopping_cart),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Text("loading");
            }
          }),
    );
  }
}
