import 'package:flutter/material.dart';
import 'package:techtaste/ui/_core/app_colors.dart';
import 'package:techtaste/ui/_core/bag_provider.dart';
import 'package:techtaste/ui/checkout/checkout_screen.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

AppBar getAppBar({required BuildContext context, String? title}) {
  return AppBar(
    title: title != null ? Text(title) : null,
    centerTitle: true,
    actions: [
      Consumer<BagProvider>(
        builder: (context, bagProvider, child) {
          return badges.Badge(
            showBadge: bagProvider.dishesOnBag.isNotEmpty,
            position: badges.BadgePosition.topEnd(top: 2, end: 3),
            badgeStyle: badges.BadgeStyle(
              badgeColor: AppColors.mainColor,
              padding: EdgeInsets.all(6),
            ),
            badgeContent: AnimatedSwitcher(
              duration: Duration(milliseconds: 150),
              transitionBuilder:
                  (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
              child: Text(
                bagProvider.dishesOnBag.length.toString(),
                key: ValueKey(bagProvider.dishesOnBag.length),
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.backgroundColor,
                ),
              ),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckoutScreen()),
                );
              },
              icon: Icon(Icons.shopping_basket),
            ),
          );
        },
      ),
    ],
  );
}
