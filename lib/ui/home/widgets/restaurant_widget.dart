import 'package:flutter/material.dart';
import 'package:techtaste/domain/model/restaurant.dart';

class RestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.0,
      children: [
        Image.asset('assets/${restaurant.imagePath}', width: 72),
        Column(
          spacing: 8.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.name,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
            ),
            Row(
              children: List.generate(restaurant.stars.toInt(), (index) {
                return Image.asset('assets/others/star.png');
              }),
            ),
            Text("${restaurant.distance} km"),
          ],
        ),
      ],
    );
  }
}
