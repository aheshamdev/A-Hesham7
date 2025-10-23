import 'package:flutter/foundation.dart';

import '../models/progress_model.dart';
import '../services/firebase_service.dart';

class ProgressProvider extends ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();

  UserProgress _progress = const UserProgress();
  bool _loading = false;
  String? _error;

  UserProgress get progress => _progress;
  bool get isLoading => _loading;
  String? get error => _error;

  Future<void> loadProgress(String uid) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      _progress = await _firebaseService.getUserProgress(uid);
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> updateProgress(String uid, UserProgress newProgress) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      await _firebaseService.updateUserProgress(uid, newProgress);
      _progress = newProgress;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
