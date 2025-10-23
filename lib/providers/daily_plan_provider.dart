import 'package:flutter/foundation.dart';

import '../models/plan_models.dart';
import '../services/daily_plan_repository.dart';

class DailyPlanProvider with ChangeNotifier {
  final DailyPlanRepository repository;
  DailyPlan? _plan;
  bool _loading = false;
  Object? _error;

  DailyPlanProvider({required this.repository});

  DailyPlan? get plan => _plan;
  bool get isLoading => _loading;
  Object? get error => _error;

  Future<void> load() async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      _plan = await repository.loadDailyPlan();
    } catch (e) {
      _error = e;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
