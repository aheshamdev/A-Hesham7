import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../providers/progress_provider.dart';
import '../../widgets/rtl_scaffold.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  void initState() {
    super.initState();
    final auth = context.read<AuthProvider>();
    if (auth.userId != null) {
      Future.microtask(() => context.read<ProgressProvider>().refresh(auth.userId!));
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = context.watch<ProgressProvider>();

    return RtlScaffold(
      appBar: AppBar(title: const Text('التقدم')),
      body: progress.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text('تقويم التقدم اليومي (قريبًا)'),
                const SizedBox(height: 12),
                Text('عدد الأيام المسجلة: ${progress.dailyPoints.length}')
              ],
            ),
    );
  }
}
