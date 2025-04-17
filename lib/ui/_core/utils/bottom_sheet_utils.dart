import 'package:flutter/material.dart';
import 'package:techtaste/ui/_core/app_colors.dart';
import 'package:techtaste/ui/_core/widgets/image_bottom_sheet.dart';

void showImageBottomSheet({
  required BuildContext context,
  required String imagePath,
  required String title,
  String? subtitle,
  required String description,
  VoidCallback? onConfirm,
  String confirmText = 'Fechar',
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.lightBackgroundColor,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: ImageBottomSheet(
          imagePath: imagePath,
          title: title,
          subtitle: subtitle,
          description: description,
          onConfirm: onConfirm,
          confirmText: confirmText,
        ),
      );
    },
  );
}
