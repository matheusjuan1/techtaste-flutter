import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:techtaste/domain/model/address.dart';
import 'package:techtaste/domain/model/dish.dart';
import 'package:techtaste/domain/model/payment_method.dart';
import 'package:techtaste/ui/_core/app_colors.dart';
import 'package:techtaste/ui/_core/bag_provider.dart';
import 'package:techtaste/ui/_core/utils/bottom_sheet_utils.dart';
import 'package:techtaste/ui/_core/widgets/dish_widget.dart';
import 'package:techtaste/ui/checkout/widgets/card_info.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    bool isEnabled = bagProvider.dishesOnBag.isNotEmpty;

    PaymentMethod paymentMethod = PaymentMethod(
      id: "1",
      name: "VISA Classic",
      info: "****-0976",
      imagePath: "assets/others/visa.png",
    );

    Address address = Address(
      id: "1",
      cep: "05861-20",
      street: "Rua das Acácias",
      number: "28",
      complement: "Casa 10",
      neighborhood: "Jardim Ypê",
      city: "São Paulo",
      state: "SP",
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.bag),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              bagProvider.clearBag();
            },
            child: Text(
              AppLocalizations.of(context)!.clear,
              style: TextStyle(color: AppColors.mainColor),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          Text(
            AppLocalizations.of(context)!.order,
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          bagProvider.dishesOnBag.isEmpty
              ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  AppLocalizations.of(context)!.emptyBagMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              )
              : ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: bagProvider.getMapByAmount().keys.length,
                itemBuilder: (context, index) {
                  Dish dish = bagProvider.getMapByAmount().keys.toList()[index];
                  return DishWidget(
                    dish: dish,
                    onTap: () {
                      showImageBottomSheet(
                        context: context,
                        imagePath: 'assets/dishes/default.png',
                        title: dish.name,
                        subtitle:
                            "R\$ ${dish.price.toStringAsFixed(2).replaceAll(".", ",")}",
                        description: dish.description,
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 5.0),
              ),
          SizedBox(height: 24.0),
          Text(
            AppLocalizations.of(context)!.payment,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          CardInfo(
            title: paymentMethod.name,
            subtitle: paymentMethod.info,
            imagePath: paymentMethod.imagePath,
            onTap: () {},
          ),
          SizedBox(height: 24.0),
          Text(
            AppLocalizations.of(context)!.deliverToAddress,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          CardInfo(
            title: "${address.street}, ${address.number}",
            subtitle: address.complement,
            iconData: Icons.location_on,
            onTap: () {},
          ),
          SizedBox(height: 24.0),
          Text(
            AppLocalizations.of(context)!.confirm,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                spacing: 8.0,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.order_),
                      Text(
                        "R\$ ${bagProvider.getTotal().toStringAsFixed(2).replaceAll(".", ",")}",
                        style: TextStyle(color: AppColors.lightMainColor),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.delivery_),
                      Text(
                        "R\$ 6,00",
                        style: TextStyle(color: AppColors.lightMainColor),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.total_),
                      Text(
                        "R\$ ${(bagProvider.getTotal() + 6.0).toStringAsFixed(2).replaceAll(".", ",")}",
                        style: TextStyle(
                          color: AppColors.lightMainColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:
                          isEnabled
                              ? () {
                                bagProvider.clearBag();
                                showImageBottomSheet(
                                  context: context,
                                  imagePath: 'assets/others/cooking.png',
                                  title:
                                      AppLocalizations.of(
                                        context,
                                      )!.orderConfirmed,
                                  description:
                                      AppLocalizations.of(
                                        context,
                                      )!.textOrderConfirmed,
                                  onConfirm: () {
                                    Navigator.pop(context);
                                  },
                                );
                              }
                              : null,
                      child: Row(
                        spacing: 8.0,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.wallet, color: AppColors.backgroundColor),
                          Text(
                            AppLocalizations.of(context)!.orderNow,
                            style: TextStyle(
                              color: AppColors.backgroundColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
