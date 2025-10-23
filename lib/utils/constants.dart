import 'package:flutter/material.dart';

// ألوان التطبيق
const Color kDarkGreen = Color(0xFF0A6F44);
const Color kLightGold = Color(0xFFE5C76D);
const Color kWhite = Colors.white;

// نصوص عامة
const String kAppName = 'تصحيح تلاوة القرآن بالذكاء الاصطناعي';

// مفاتيح Firebase Database
class DbKeys {
  static const String users = 'users';
  static const String progress = 'progress';
  static const String streak = 'streak';
  static const String lessonsCompleted = 'lessonsCompleted';
}

// أسماء الحصون
class FortressNames {
  static const String preparation = 'التحضير';
  static const String memorization = 'الحفظ';
  static const String nearReview = 'مراجعة القريب';
  static const String farReview = 'مراجعة البعيد';
  static const String dailyRecitation = 'الورد اليومي';
}

// أنماط AI
class AiModes {
  static const String readingValidation = 'reading_validation';
  static const String memorizationCheck = 'memorization_check';
}
