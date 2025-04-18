import 'package:flutter/material.dart';
import 'package:techtaste/ui/_core/app_colors.dart';

class CardInfo extends StatelessWidget {
  final String? imagePath;
  final IconData? iconData;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const CardInfo({
    super.key,
    this.imagePath,
    this.iconData,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightBackgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
          leading: SizedBox(
            height: 16.0,
            child:
                (imagePath != null
                    ? Image.asset(imagePath!)
                    : Icon(iconData ?? Icons.fastfood)),
          ),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
          subtitle: Text(subtitle, style: TextStyle(color: Colors.grey)),
          trailing: Icon(Icons.arrow_forward_ios, color: AppColors.mainColor),
        ),
      ),
    );
  }
}
