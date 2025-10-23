import 'package:flutter/material.dart';

class PreSessionPreparationScreen extends StatelessWidget {
  const PreSessionPreparationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('التحضير القبلي')),
      body: const Center(
        child: Text('سيتم عرض مهام التحضير القبلي')
      ),
    );
  }
}
