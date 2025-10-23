import 'package:flutter/material.dart';

import '../../app/app_routes.dart';
import '../../utils/constants.dart';
import '../../widgets/fortress_card.dart';

class FortressesScreen extends StatelessWidget {
  const FortressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الحصون الخمسة')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          FortressCard(
            title: FortressNames.preparation,
            subtitle: 'التحضير الأسبوعي/الليلي/القبلي',
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
        ],
      ),
    );
  }
}
