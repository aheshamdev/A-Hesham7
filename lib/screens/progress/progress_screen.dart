import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // سيقرأ لاحقًا من Firebase Database لعرض تقويم التقدم
    return Scaffold(
      appBar: AppBar(title: const Text('التقدم')),
      body: const Center(
        child: Text('تقويم التقدم اليومي سيظهر هنا'),
      ),
    );
  }
}
