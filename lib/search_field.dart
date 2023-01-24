import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 35,
            child: TextField(
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 16,
                color: Color(0xFF0098B8),
                height: null,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                filled: false,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    width: 2,
                    color: Color(0xFF0098B8),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    width: 2,
                    color: Color(0xFF0098B8),
                  ),
                ),
                hintText: 'Search your products',
                hintStyle: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 14,
                  height: 2.8,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF0098B8),
                ),
                prefixIconColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
