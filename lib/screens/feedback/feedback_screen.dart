import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ستعرض نتائج تحليل الصوت القادمة من FastAPI
    return Scaffold(
      appBar: AppBar(title: const Text('التغذية الراجعة')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('نتائج التحليل ستظهر هنا (فوري/بعد الجلسة).'),
      ),
    );
  }
}
