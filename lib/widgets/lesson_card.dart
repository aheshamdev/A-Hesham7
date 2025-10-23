import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  final String title;
  final String? description;
  final String aiMode;
  final VoidCallback? onTap;

  const LessonCard({
    super.key,
    required this.title,
    this.description,
    required this.aiMode,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              if (description != null) ...[
                const SizedBox(height: 8),
                Text(description!, style: Theme.of(context).textTheme.bodyMedium),
              ],
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.auto_awesome, size: 16),
                  const SizedBox(width: 6),
                  Text('وضع الذكاء: $aiMode'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
