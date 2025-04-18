import 'package:flutter/material.dart';
import 'package:techtaste/domain/model/dish.dart';

class BagProvider extends ChangeNotifier {
  List<Dish> dishesOnBag = [];

  void addAllDishes(List<Dish> dishes) {
    dishesOnBag.addAll(dishes);
    notifyListeners();
  }

  void addToBag(Dish dish) {
    dishesOnBag.add(dish);
    notifyListeners();
  }

  void removeFromBag(Dish dish) {
    dishesOnBag.remove(dish);
    notifyListeners();
  }

  void clearBag() {
    dishesOnBag.clear();
    notifyListeners();
  }

  double getTotal() {
    double total = 0;
    for (Dish dish in dishesOnBag) {
      total += dish.price;
    }
    return total;
  }

  Map<Dish, int> getMapByAmount() {
    Map<Dish, int> mapResult = {};

    for (Dish dish in dishesOnBag) {
      if (mapResult[dish] == null) {
        mapResult[dish] = 1;
      } else {
        mapResult[dish] = mapResult[dish]! + 1;
      }
    }
    return mapResult;
  }
}
