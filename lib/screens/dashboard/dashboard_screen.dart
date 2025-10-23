import 'package:flutter/material.dart';

import '../../widgets/rtl_scaffold.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RtlScaffold(
      appBar: AppBar(title: const Text('لوحة التحكم')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text('تفاصيل الأداء بالأرقام والرسوم (قريبًا)'),
        ],
      ),
    );
  }
}
