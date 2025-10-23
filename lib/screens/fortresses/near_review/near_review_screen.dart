import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/daily_plan_provider.dart';
import '../../../widgets/rtl_scaffold.dart';

class NearReviewScreen extends StatelessWidget {
  const NearReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final planProvider = context.watch<DailyPlanProvider>();
    final items = planProvider.plan?.nearReviewToday ?? const [];

    return RtlScaffold(
      appBar: AppBar(title: const Text('مراجعة القريب')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.pages.join('، ')),
            trailing: const Icon(Icons.chevron_left),
          );
        },
      ),
    );
  }
}
