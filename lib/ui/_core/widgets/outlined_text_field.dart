import 'package:flutter/material.dart';
import 'package:techtaste/ui/_core/app_colors.dart';

class OutlinedTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? contoller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool enabled;
  final IconData? prefixIcon;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final Function()? onTap;

  const OutlinedTextField({
    super.key,
    required this.label,
    this.hint,
    this.contoller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.enabled = true,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contoller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor, width: 2.0),
        ),
        floatingLabelStyle: const TextStyle(color: AppColors.mainColor),
      ),
    );
  }
}
