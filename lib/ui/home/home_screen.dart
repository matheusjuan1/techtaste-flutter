import 'package:flutter/material.dart';
import 'package:techtaste/domain/data/categories_data.dart';
import 'package:techtaste/domain/data/restaurant_data.dart';
import 'package:techtaste/domain/model/restaurant.dart';
import 'package:techtaste/ui/_core/widgets/appbar.dart';
import 'package:techtaste/ui/_core/widgets/outlined_text_field.dart';
import 'package:techtaste/ui/home/widgets/category_widget.dart';
import 'package:techtaste/ui/home/widgets/restaurant_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);

    return Scaffold(
      drawer: Drawer(),
      appBar: getAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24.0,
            children: [
              Center(child: Image.asset('assets/logo.png', width: 147)),
              Text(
                "Boas-vindas!",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              OutlinedTextField(
                label: "O que você quer para hoje?",
                prefixIcon: Icons.search,
              ),
              Text("Escolha por categoria", style: TextStyle(fontSize: 22.0)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8.0,
                  children: List.generate(
                    CategoriesData.listCategories.length,
                    (index) {
                      return CategoryWidget(
                        category: CategoriesData.listCategories[index],
                      );
                    },
                  ),
                ),
              ),
              Image.asset('assets/banners/banner_promo.png'),
              Text(
                "Bem avaliados",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              ),
              Column(
                spacing: 12.0,
                children: List.generate(restaurantData.restaurants.length, (
                  index,
                ) {
                  Restaurant restaurant = restaurantData.restaurants[index];
                  return RestaurantWidget(restaurant: restaurant);
                }),
              ),
              SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
