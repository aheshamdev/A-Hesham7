import 'package:flutter/foundation.dart';

import '../models/user_model.dart';
import '../services/firebase_service.dart';

class UserProvider extends ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();

  AppUser? _user;
  bool _loading = false;
  String? _error;

  UserProvider() {
    _firebaseService.authStateChanges.listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  AppUser? get user => _user;
  bool get isAuthenticated => _user != null;
  bool get isLoading => _loading;
  String? get error => _error;

  Future<void> signIn(String email, String password) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      _user = await _firebaseService.signInWithEmail(email, password);
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> signUp(String email, String password) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      _user = await _firebaseService.signUpWithEmail(email, password);
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await _firebaseService.signOut();
  }
}
