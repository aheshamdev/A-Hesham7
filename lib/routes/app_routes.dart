import 'package:flutter/material.dart';

import '../screens/auth/auth_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/fortresses/fortresses_screen.dart';
import '../screens/fortresses/preparation/preparation_screen.dart';
import '../screens/fortresses/memorization/memorization_screen.dart';
import '../screens/fortresses/near_review/near_review_screen.dart';
import '../screens/fortresses/far_review/far_review_screen.dart';
import '../screens/fortresses/daily_ward/daily_ward_screen.dart';
import '../screens/progress/progress_screen.dart';
import '../screens/feedback/feedback_screen.dart';
import '../screens/profile/profile_screen.dart';

class AppRoutes {
  static const String auth = '/auth';
  static const String home = '/';
  static const String dashboard = '/dashboard';
  static const String fortresses = '/fortresses';
  static const String preparation = '/fortresses/preparation';
  static const String memorization = '/fortresses/memorization';
  static const String near = '/fortresses/near';
  static const String far = '/fortresses/far';
  static const String dailyWard = '/fortresses/daily_ward';
  static const String progress = '/progress';
  static const String feedback = '/feedback';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> routes() => {
        auth: (context) => const AuthScreen(),
        home: (context) => const HomeScreen(),
        dashboard: (context) => const DashboardScreen(),
        fortresses: (context) => const FortressesScreen(),
        preparation: (context) => const PreparationScreen(),
        memorization: (context) => const MemorizationScreen(),
        near: (context) => const NearReviewScreen(),
        far: (context) => const FarReviewScreen(),
        dailyWard: (context) => const DailyWardScreen(),
        progress: (context) => const ProgressScreen(),
        feedback: (context) => const FeedbackScreen(),
        profile: (context) => const ProfileScreen(),
      };
}
