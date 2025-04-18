import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:techtaste/domain/data/categories_data.dart';
import 'package:techtaste/domain/data/restaurant_data.dart';
import 'package:techtaste/domain/model/restaurant.dart';
import 'package:techtaste/ui/_core/widgets/appbar.dart';
import 'package:techtaste/ui/_core/widgets/outlined_text_field.dart';
import 'package:techtaste/ui/home/widgets/category_widget.dart';
import 'package:techtaste/ui/home/widgets/restaurant_widget.dart';
import 'package:techtaste/ui/restaurant/restaurant_screen.dart';
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
        child: ListView(
          padding: EdgeInsets.only(bottom: 24.0),
          children: [
            Center(child: Image.asset('assets/logo.png', width: 147)),
            SizedBox(height: 24.0),
            Text(
              AppLocalizations.of(context)!.welcome,
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            OutlinedTextField(
              label: AppLocalizations.of(context)!.searchHomeMessage,
              prefixIcon: Icons.search,
            ),
            SizedBox(height: 24.0),
            Text(
              AppLocalizations.of(context)!.chooseByCategory,
              style: TextStyle(fontSize: 22.0),
            ),
            SizedBox(height: 16.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(CategoriesData.listCategories.length, (
                  index,
                ) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CategoryWidget(
                      category: CategoriesData.listCategories[index],
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 24.0),
            Image.asset('assets/banners/banner_promo.png'),
            SizedBox(height: 24.0),
            Text(
              AppLocalizations.of(context)!.topRated,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16.0),
            ListView.separated(
              shrinkWrap: true,
              physics:
                  NeverScrollableScrollPhysics(), // desabilita scroll interno
              itemCount: restaurantData.restaurants.length,
              separatorBuilder: (context, index) => SizedBox(height: 12.0),
              itemBuilder: (context, index) {
                Restaurant restaurant = restaurantData.restaurants[index];
                return RestaurantWidget(
                  restaurant: restaurant,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                RestaurantScreen(restaurant: restaurant),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
