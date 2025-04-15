import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:techtaste/domain/model/restaurant.dart';

class RestaurantData extends ChangeNotifier {
  List<Restaurant> restaurants = [];

  Future<void> getRestaurants() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> data = json.decode(jsonString);

    List<dynamic> restaurantsData = data['restaurants'];

    for (var restaurantData in restaurantsData) {
      Restaurant restaurant = Restaurant.fromMap(restaurantData);
      restaurants.add(restaurant);
    }
  }
}
