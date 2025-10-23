import 'package:flutter/foundation.dart';

import '../services/firebase_service.dart';

class ProgressProvider with ChangeNotifier {
  final FirebaseService firebaseService;

  ProgressProvider({required this.firebaseService});

  Map<DateTime, int> _dailyPoints = const {};
  bool _loading = false;

  Map<DateTime, int> get dailyPoints => _dailyPoints;
  bool get isLoading => _loading;

  Future<void> refresh(String userId) async {
    _loading = true;
    notifyListeners();
    try {
      _dailyPoints = await firebaseService.fetchDailyProgress(userId);
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
