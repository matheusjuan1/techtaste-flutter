import 'package:flutter/material.dart';
import 'package:techtaste/domain/model/dish.dart';
import 'package:techtaste/ui/_core/app_colors.dart';
import 'package:techtaste/ui/_core/bag_provider.dart';
import 'package:techtaste/ui/_core/widgets/quantity_selector.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sacola"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              bagProvider.cleaBag();
            },
            child: Text("Limpar", style: TextStyle(color: AppColors.mainColor)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Pedido", textAlign: TextAlign.start),
              Column(
                children: List.generate(
                  bagProvider.getMapByAmount().keys.length,
                  (index) {
                    Dish dish =
                        bagProvider.getMapByAmount().keys.toList()[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Image.asset(
                        'assets/dishes/default.png',
                        width: 48,
                        height: 48,
                      ),
                      title: Text(dish.name),
                      subtitle: Text("R\$${dish.price.toStringAsFixed(2)}"),
                      trailing: QuantitySelector(
                        quantity: bagProvider.getMapByAmount()[dish] ?? 0,
                        onAdd: () => bagProvider.addToBag(dish),
                        onRemove: () => bagProvider.removeFromBag(dish),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
