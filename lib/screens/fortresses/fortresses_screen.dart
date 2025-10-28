import 'package:flutter/material.dart';

import '../../widgets/info_card.dart';
import '../../widgets/rtl_scaffold.dart';

class FortressesScreen extends StatelessWidget {
  const FortressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RtlScaffold(
      appBar: AppBar(title: const Text('الحصون الخمسة')),
      body: ListView(
        children: [
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
        ],
      ),
    );
  }
}
