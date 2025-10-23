import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/daily_plan_model.dart';

class DailyPlanService {
  Future<DailyPlan> loadDailyPlan() async {
    final jsonStr = await rootBundle
        .loadString('lib/backend/config/daily_plan.json');
    final Map<String, dynamic> data = json.decode(jsonStr);
    return DailyPlan.fromJson(data);
  }
}
