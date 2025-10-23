import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/fortress_provider.dart';
import '../../widgets/lesson_card.dart';

class FarReviewFortressScreen extends StatelessWidget {
  const FarReviewFortressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FortressProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('مراجعة البعيد')),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: provider.plan.farReview
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
