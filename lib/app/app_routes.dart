import 'package:flutter/material.dart';

import '../screens/auth/login_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/home/dashboard_screen.dart';
import '../screens/fortresses/fortresses_screen.dart';
import '../screens/fortresses/daily_recitation_fortress.dart';
import '../screens/fortresses/preparation/preparation_fortress.dart';
import '../screens/fortresses/preparation/weekly_preparation.dart';
import '../screens/fortresses/preparation/nightly_preparation.dart';
import '../screens/fortresses/preparation/pre_session_preparation.dart';
import '../screens/fortresses/memorization_fortress.dart';
import '../screens/fortresses/near_review_fortress.dart';
import '../screens/fortresses/far_review_fortress.dart';
import '../screens/progress/progress_screen.dart';
import '../screens/feedback/feedback_screen.dart';
import '../screens/profile/profile_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String dashboard = '/dashboard';
  static const String fortresses = '/fortresses';
  static const String preparation = '/preparation';
  static const String weeklyPreparation = '/preparation/weekly';
  static const String nightlyPreparation = '/preparation/nightly';
  static const String preSessionPreparation = '/preparation/pre-session';
  static const String memorization = '/memorization';
  static const String nearReview = '/near-review';
  static const String farReview = '/far-review';
  static const String dailyRecitation = '/daily-recitation';
  static const String progress = '/progress';
  static const String feedback = '/feedback';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> get routes => {
        login: (_) => const LoginScreen(),
        signup: (_) => const SignupScreen(),
        home: (_) => const HomeScreen(),
        dashboard: (_) => const DashboardScreen(),
        fortresses: (_) => const FortressesScreen(),
        preparation: (_) => const PreparationFortress(),
        weeklyPreparation: (_) => const WeeklyPreparationScreen(),
        nightlyPreparation: (_) => const NightlyPreparationScreen(),
        preSessionPreparation: (_) => const PreSessionPreparationScreen(),
        memorization: (_) => const MemorizationFortressScreen(),
        nearReview: (_) => const NearReviewFortressScreen(),
        farReview: (_) => const FarReviewFortressScreen(),
        dailyRecitation: (_) => const DailyRecitationFortressScreen(),
        progress: (_) => const ProgressScreen(),
        feedback: (_) => const FeedbackScreen(),
        profile: (_) => const ProfileScreen(),
      };
}
