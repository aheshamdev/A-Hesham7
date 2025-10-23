import 'package:flutter/material.dart';

class NightlyPreparationScreen extends StatelessWidget {
  const NightlyPreparationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('التحضير الليلي')),
      body: const Center(
        child: Text('سيتم عرض مهام التحضير الليلي')
      ),
    );
  }
}
