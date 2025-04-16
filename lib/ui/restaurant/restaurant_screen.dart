import 'package:flutter/material.dart';
import 'package:techtaste/domain/model/dish.dart';
import 'package:techtaste/domain/model/restaurant.dart';
import 'package:techtaste/ui/_core/bag_provider.dart';
import 'package:techtaste/ui/_core/widgets/appbar.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12.0,
          children: [
            SizedBox(height: 16.0),
            Center(
              child: Image.asset('assets/${restaurant.imagePath}', width: 112),
            ),
            Text(
              "Mais pedidos",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
            ),
            Column(
              children: List.generate(restaurant.dishes.length, (index) {
                Dish dish = restaurant.dishes[index];
                return ListTile(
                  leading: Image.asset('assets/dishes/default.png', width: 48),
                  title: Text(dish.name),
                  subtitle: Text("R\$${dish.price.toStringAsFixed(2)}"),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<BagProvider>().addAllDishes([dish]);
                    },
                    icon: Icon(Icons.add),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
