import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('لوحة الأداء')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.insights_outlined),
            title: Text('معدل الدقة'),
            subtitle: Text('سيتم عرضه لاحقًا عبر FastAPI'),
          ),
          ListTile(
            leading: Icon(Icons.timer_outlined),
            title: Text('مدة التلاوة'),
            subtitle: Text('وقت القراءة اليومي/الأسبوعي'),
          ),
          ListTile(
            leading: Icon(Icons.emoji_events_outlined),
            title: Text('النقاط المكتسبة'),
            subtitle: Text('حساب النقاط من الدروس المكتملة'),
          ),
        ],
      ),
    );
  }
}
