import 'package:flutter/material.dart';

import '../../../widgets/rtl_scaffold.dart';

class DailyWardScreen extends StatelessWidget {
  const DailyWardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RtlScaffold(
      appBar: AppBar(title: const Text('الورد اليومي')),
      body: const Center(
        child: Text('تلاوة يومية (سيتم دمجها لاحقًا)'),
      ),
    );
  }
}
