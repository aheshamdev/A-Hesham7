import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../providers/daily_plan_provider.dart';
import '../../widgets/rtl_scaffold.dart';
import '../../widgets/info_card.dart';
import '../../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<DailyPlanProvider>().load());
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final planProvider = context.watch<DailyPlanProvider>();

    final streak = 5; // Placeholder
    final points = 120; // Placeholder

    return RtlScaffold(
      appBar: AppBar(title: const Text('الرئيسية')),
      body: RefreshIndicator(
        onRefresh: () => context.read<DailyPlanProvider>().load(),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('مرحبا ${auth.displayName ?? 'مستخدم'}',
                                style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 8),
                            Text('سلسلة الأيام: $streak يوم')
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('النقاط', style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 8),
                            Text(points.toString())
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SectionHeader(title: 'الحصون الخمسة'),
            InfoCard(
              title: 'التحضير',
              subtitle: 'تحضير أسبوعي / ليلي / قبلي',
              icon: Icons.school,
              onTap: () => Navigator.of(context).pushNamed('/fortresses/preparation'),
            ),
            InfoCard(
              title: 'الحفظ',
              subtitle: 'صفحات الحفظ لليوم',
              icon: Icons.menu_book,
              onTap: () => Navigator.of(context).pushNamed('/fortresses/memorization'),
            ),
            InfoCard(
              title: 'مراجعة القريب',
              subtitle: 'صفحات قريبة للمراجعة',
              icon: Icons.history,
              onTap: () => Navigator.of(context).pushNamed('/fortresses/near'),
            ),
            InfoCard(
              title: 'مراجعة البعيد',
              subtitle: 'صفحات بعيدة للمراجعة',
              icon: Icons.calendar_month,
              onTap: () => Navigator.of(context).pushNamed('/fortresses/far'),
            ),
            InfoCard(
              title: 'الورد اليومي',
              subtitle: 'تلاوة يومية',
              icon: Icons.self_improvement,
              onTap: () => Navigator.of(context).pushNamed('/fortresses/daily_ward'),
            ),

            const SectionHeader(title: 'خطة اليوم'),
            if (planProvider.isLoading)
              const Center(child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              ))
            else if (planProvider.error != null)
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text('تعذر تحميل الخطة.'),
              )
            else ...[
              if (planProvider.plan != null) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('عناصر الحفظ اليوم: ${planProvider.plan!.memorizationToday.length}')
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text('مراجعة قريب: ${planProvider.plan!.nearReviewToday.length}، مراجعة بعيد: ${planProvider.plan!.farReviewToday.length}')
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
