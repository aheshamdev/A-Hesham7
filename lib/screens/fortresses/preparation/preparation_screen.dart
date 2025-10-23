import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/daily_plan_provider.dart';
import '../../../widgets/rtl_scaffold.dart';
import '../../../widgets/section_header.dart';

class PreparationScreen extends StatelessWidget {
  const PreparationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final planProvider = context.watch<DailyPlanProvider>();

    return RtlScaffold(
      appBar: AppBar(title: const Text('التحضير')),
      body: planProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                const SectionHeader(title: 'التحضير الأسبوعي'),
                ..._buildSection(planProvider.plan?.preparation.weekly ?? const []),
                const SectionHeader(title: 'التحضير الليلي'),
                ..._buildSection(planProvider.plan?.preparation.nightly ?? const []),
                const SectionHeader(title: 'التحضير القبلي'),
                ..._buildSection(planProvider.plan?.preparation.pre ?? const []),
              ],
            ),
    );
  }

  List<Widget> _buildSection(List items) {
    return items.map((item) {
      return ListTile(
        title: Text(item.title ?? ''),
        subtitle: Text((item.pages as List<String>).join('، ')),
        trailing: const Icon(Icons.chevron_left),
        onTap: () {},
      );
    }).toList();
  }
}
