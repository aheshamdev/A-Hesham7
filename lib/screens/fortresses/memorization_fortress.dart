import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/fortress_provider.dart';
import '../../widgets/lesson_card.dart';

class MemorizationFortressScreen extends StatelessWidget {
  const MemorizationFortressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FortressProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('حصن الحفظ')),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: provider.plan.memorization
                  .map((e) => LessonCard(
                        title: e.title,
                        description: e.description,
                        aiMode: e.aiMode,
                        onTap: () {},
                      ))
                  .toList(),
            ),
    );
  }
}
