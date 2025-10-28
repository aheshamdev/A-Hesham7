import 'package:flutter/material.dart';

class PlaceholderChart extends StatelessWidget {
  const PlaceholderChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Center(child: Text('رسم بياني (قريبًا)')),
    );
  }
}
