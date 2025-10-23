import 'package:flutter/foundation.dart';

import '../models/daily_plan_model.dart';
import '../services/daily_plan_service.dart';

class FortressProvider extends ChangeNotifier {
  final DailyPlanService _planService = DailyPlanService();

  DailyPlan _plan = const DailyPlan();
  bool _loading = false;
  String? _error;

  DailyPlan get plan => _plan;
  bool get isLoading => _loading;
  String? get error => _error;

  Future<void> loadPlan() async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      _plan = await _planService.loadDailyPlan();
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
