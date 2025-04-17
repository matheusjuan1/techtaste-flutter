import 'package:flutter/material.dart';
import 'package:techtaste/domain/model/restaurant.dart';
import 'package:techtaste/ui/_core/app_colors.dart';
import 'package:techtaste/ui/_core/utils/bottom_sheet_utils.dart';
import 'package:techtaste/ui/_core/widgets/appbar.dart';
import 'package:techtaste/ui/restaurant/widgets/dish_widget.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: [
          SizedBox(height: 12.0),
          Center(
            child: Column(
              spacing: 5.0,
              children: [
                Image.asset('assets/${restaurant.imagePath}', width: 90),
                SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 6.0,
                  children: List.generate(restaurant.categories.length, (
                    index,
                  ) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.lightBackgroundColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        restaurant.categories[index],
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }),
                ),
                Text(
                  "${restaurant.distance} Km",
                  style: TextStyle(color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    restaurant.stars.toInt(),
                    (index) => Image.asset('assets/others/star.png'),
                  ),
                ),
                Text(
                  restaurant.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Text(
            "Mais pedidos",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
          ),
          SizedBox(height: 12.0),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: restaurant.dishes.length,
            itemBuilder: (context, index) {
              final dish = restaurant.dishes[index];
              return DishWidget(
                dish: dish,
                onTap: () {
                  showImageBottomSheet(
                    context: context,
                    imagePath: 'assets/dishes/default.png',
                    title: dish.name,
                    subtitle:
                        "R\$${dish.price.toStringAsFixed(2).replaceAll(".", ",")}",
                    description: dish.description,
                  );
                },
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 5.0),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
