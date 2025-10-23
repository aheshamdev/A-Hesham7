import 'package:flutter/material.dart';

class WeeklyPreparationScreen extends StatelessWidget {
  const WeeklyPreparationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('التحضير الأسبوعي')),
      body: const Center(
        child: Text('سيتم عرض مهام التحضير الأسبوعي')
      ),
    );
  }
}
