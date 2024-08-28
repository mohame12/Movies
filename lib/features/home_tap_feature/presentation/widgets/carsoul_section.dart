import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'car_slider_item.dart';

class CarsoulSlider extends StatelessWidget {
  const CarsoulSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(items: const [CarSlider(),CarSlider(),CarSlider()], options: CarouselOptions(
      height: 289,
      viewportFraction:BorderSide.strokeAlignOutside,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.3,
      scrollDirection: Axis.horizontal,
    ),);
  }
}