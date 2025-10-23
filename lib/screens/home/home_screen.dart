import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/app_routes.dart';
import '../../providers/fortress_provider.dart';
import '../../providers/progress_provider.dart';
import '../../providers/user_provider.dart';
import '../../utils/constants.dart';
import '../../widgets/fortress_card.dart';
import '../../widgets/progress_card.dart';
import '../../widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<FortressProvider>().loadPlan();
      final user = context.read<UserProvider>().user;
      if (user != null) {
        context.read<ProgressProvider>().loadProgress(user.uid);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final plan = context.watch<FortressProvider>();
    final progress = context.watch<ProgressProvider>().progress;

    return Scaffold(
      appBar: AppBar(
        title: const Text('الرئيسية'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.dashboard),
            icon: const Icon(Icons.analytics_outlined),
            tooltip: 'اللوحة',
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.profile),
            icon: const Icon(Icons.person_outline),
            tooltip: 'الحساب',
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<FortressProvider>().loadPlan();
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SectionTitle(title: 'التقدم العام'),
            Row(
              children: const [
                Expanded(
                  child: ProgressCard(
                    title: 'سلسلة الأيام',
                    value: '0',
                    icon: Icons.local_fire_department_outlined,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ProgressCard(
                    title: 'الدروس المكتملة',
                    value: '0',
                    icon: Icons.check_circle_outline,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const SectionTitle(title: 'الحصون الخمسة'),
            FortressCard(
              title: FortressNames.preparation,
              subtitle: 'خطط التحضير من الخطة اليومية',
              icon: Icons.flag_outlined,
              onTap: () => Navigator.pushNamed(context, AppRoutes.preparation),
            ),
            FortressCard(
              title: FortressNames.memorization,
              subtitle: 'مهام الحفظ النشطة',
              icon: Icons.bookmark_border,
              onTap: () => Navigator.pushNamed(context, AppRoutes.memorization),
            ),
            FortressCard(
              title: FortressNames.nearReview,
              subtitle: 'مراجعات قريبة الأجل',
              icon: Icons.refresh_outlined,
              onTap: () => Navigator.pushNamed(context, AppRoutes.nearReview),
            ),
            FortressCard(
              title: FortressNames.farReview,
              subtitle: 'مراجعات بعيدة الأجل',
              icon: Icons.history_toggle_off,
              onTap: () => Navigator.pushNamed(context, AppRoutes.farReview),
            ),
            FortressCard(
              title: FortressNames.dailyRecitation,
              subtitle: 'ورد اليوم',
              icon: Icons.today_outlined,
              onTap: () => Navigator.pushNamed(context, AppRoutes.dailyRecitation),
            ),
            const SizedBox(height: 16),
            const SectionTitle(title: 'آخر من الخطة اليومية'),
            if (plan.isLoading) const Center(child: CircularProgressIndicator()),
            if (!plan.isLoading) ...[
              Text('عناصر التحضير الأسبوعي: ${plan.plan.preparation.weekly.length}'),
              Text('مهام الحفظ: ${plan.plan.memorization.length}'),
            ]
          ],
        ),
      ),
    );
  }
}
