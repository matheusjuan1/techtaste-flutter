import 'package:flutter/material.dart';
import 'package:techtaste/domain/model/dish.dart';
import 'package:techtaste/ui/_core/app_colors.dart';
import 'package:techtaste/ui/_core/bag_provider.dart';
import 'package:techtaste/ui/_core/widgets/quantity_selector.dart';
import 'package:provider/provider.dart';

class DishWidget extends StatelessWidget {
  final Dish dish;
  final VoidCallback onPressed;
  const DishWidget({super.key, required this.dish, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final bagProvider = context.watch<BagProvider>();
    final bagMap = bagProvider.getMapByAmount();
    final quantity = bagMap[dish] ?? 0;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SizedBox(
          width: 60.0,
          height: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6),
              bottomLeft: Radius.circular(6),
            ),
            child: Image.asset(
              'assets/dishes/default.png',
              width: 48,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(dish.name, style: TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(
          "R\$${dish.price.toStringAsFixed(2).replaceAll(".", ",")}",
        ),
        trailing:
            quantity == 0
                ? IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    bagProvider.addToBag(dish);
                  },
                )
                : QuantitySelector(
                  quantity: quantity,
                  onAdd: () => bagProvider.addToBag(dish),
                  onRemove: () => bagProvider.removeFromBag(dish),
                ),
      ),
    );
  }
}
