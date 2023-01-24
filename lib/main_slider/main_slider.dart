import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://ultimateapi.hostprohub.com/frontend/images/banner_images/35602.jpeg',
  'https://ultimateapi.hostprohub.com/frontend/images/banner_images/95629.jpeg',
  'https://ultimateapi.hostprohub.com/frontend/images/banner_images/18414.jpeg',
];
final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        child: Container(
          margin: EdgeInsets.all(0.0),
          child: ClipRRect(
            child: Stack(
              children: <Widget>[
                Image.network(
                  item,
                  // width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    )
    .toList();

class FullscreenSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Builder(
        builder: (context) {
          final double width = MediaQuery.of(context).size.width;
          return CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1.0,
              aspectRatio: 1.5,
              enlargeCenterPage: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
            ),
            items: imgList
                .map(
                  (item) => Container(
                    child: Center(
                      child: Image.network(
                        item,
                        fit: BoxFit.fill,
                        height: width,
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
