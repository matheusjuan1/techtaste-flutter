import 'package:flutter/material.dart';
import 'package:techtaste/ui/_core/app_colors.dart';
import 'package:techtaste/ui/_core/bag_provider.dart';
import 'package:techtaste/ui/checkout/checkout_screen.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

AppBar getAppBar({required BuildContext context, String? title}) {
  BagProvider bagProvider = Provider.of<BagProvider>(context);
  return AppBar(
    title: title != null ? Text(title) : null,
    centerTitle: true,
    actions: [
      badges.Badge(
        showBadge: bagProvider.dishesOnBag.isNotEmpty,
        position: badges.BadgePosition.topEnd(top: 8, end: 5),
        badgeContent: Text(
          bagProvider.dishesOnBag.length.toString(),
          style: TextStyle(fontSize: 10, color: AppColors.backgroundColor),
        ),
        badgeStyle: badges.BadgeStyle(badgeColor: AppColors.mainColor),
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CheckoutScreen();
                },
              ),
            );
          },
          icon: Icon(Icons.shopping_basket),
        ),
      ),
    ],
  );
}
