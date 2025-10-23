import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/fortress_provider.dart';
import '../../../widgets/lesson_card.dart';
import '../../../widgets/section_title.dart';

class PreparationFortress extends StatelessWidget {
  const PreparationFortress({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FortressProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('حصن التحضير')),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const SectionTitle(title: 'التحضير الأسبوعي'),
                ...provider.plan.preparation.weekly.map(
                  (e) => LessonCard(
                    title: e.title,
                    description: e.description,
                    aiMode: e.aiMode,
                    onTap: () {},
                  ),
                ),
                const SectionTitle(title: 'التحضير الليلي'),
                ...provider.plan.preparation.nightly.map(
                  (e) => LessonCard(
                    title: e.title,
                    description: e.description,
                    aiMode: e.aiMode,
                    onTap: () {},
                  ),
                ),
                const SectionTitle(title: 'التحضير القبلي'),
                ...provider.plan.preparation.preSession.map(
                  (e) => LessonCard(
                    title: e.title,
                    description: e.description,
                    aiMode: e.aiMode,
                    onTap: () {},
                  ),
                ),
              ],
            ),
    );
  }
}
