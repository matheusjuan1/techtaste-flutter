import 'package:flutter/material.dart';
import 'package:techtaste/ui/_core/app_colors.dart';

class IconButtonCircle extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const IconButtonCircle({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: AppColors.mainColor,
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(width: 22.0, height: 22.0),
      child: Icon(icon, color: AppColors.backgroundColor, size: 16.0),
    );
  }
}
