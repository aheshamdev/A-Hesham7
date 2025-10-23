import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon ?? Icons.arrow_back),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: kDarkGreen,
        foregroundColor: kWhite,
        minimumSize: const Size.fromHeight(48),
      ),
    );
  }
}
