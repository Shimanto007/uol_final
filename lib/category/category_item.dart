import 'package:flutter/material.dart';
import '../products/category_products_screen.dart';

class CategoryItem extends StatelessWidget {
  final int id;
  final String title;
  final String image;

  CategoryItem(this.id, this.title, this.image);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      '/category-product',
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: const Color(0xFF63af40),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 9,
                offset: Offset(0, 1),
              ),
            ]
            // border: Border.all(
            //   width: 1,
            //   color: Color(0xFF0098B8),
            // )
            ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: NetworkImage(
                        'https://ultimateapi.hostprohub.com/frontend/images/category_images/$image'),
                    width: 30,
                  ),
                ),
              ),
              Container(
                height: 30,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Lato',
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
