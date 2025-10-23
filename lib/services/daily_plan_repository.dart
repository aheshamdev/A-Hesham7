import 'package:flutter/services.dart' show rootBundle;

import '../models/plan_models.dart';

/// Repository responsible for loading the local daily plan JSON and parsing it.
/// In production, this can be replaced by a remote source.
class DailyPlanRepository {
  static const String defaultPath = 'lib/data/daily_plan.json';

  /// Loads the daily plan from a bundled JSON file.
  /// Note: For a real Flutter app, declare the JSON under assets in pubspec.yaml
  /// and use `assets/daily_plan.json` instead of a lib path.
  Future<DailyPlan> loadDailyPlan({String path = defaultPath}) async {
    try {
      final jsonStr = await rootBundle.loadString(path);
      return DailyPlan.decode(jsonStr);
    } catch (_) {
      // Fallback to embedded minimal plan to keep UI functional in skeleton mode.
      const String fallback = '{"preparation": {"weekly": [], "nightly": [], "pre": []}, "memorization": {"today": []}, "near_review": {"today": []}, "far_review": {"today": []}}';
      return DailyPlan.decode(fallback);
    }
  }
}
