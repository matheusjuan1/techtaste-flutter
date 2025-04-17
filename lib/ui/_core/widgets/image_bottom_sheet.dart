import 'package:flutter/material.dart';
import 'package:techtaste/ui/_core/app_colors.dart';

class ImageBottomSheet extends StatelessWidget {
  final String imagePath;
  final String title;
  final String? subtitle;
  final String description;
  final VoidCallback? onConfirm;
  final String confirmText;
  const ImageBottomSheet({
    super.key,
    required this.imagePath,
    required this.title,
    this.subtitle,
    required this.description,
    this.onConfirm,
    required this.confirmText,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (subtitle != null) ...[
                  SizedBox(height: 8),
                  Text(
                    subtitle!,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onConfirm?.call();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      confirmText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.backgroundColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
