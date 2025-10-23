import 'package:flutter/foundation.dart';

import '../services/firebase_service.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseService firebaseService;

  AuthProvider({required this.firebaseService});

  bool get isLoggedIn => firebaseService.isLoggedIn;
  String? get userId => firebaseService.userId;
  String? get displayName => firebaseService.displayName;

  Future<void> init() async {
    await firebaseService.init();
    notifyListeners();
  }

  Future<void> signInAnonymously() async {
    await firebaseService.signInAnonymously();
    notifyListeners();
  }

  Future<void> signOut() async {
    await firebaseService.signOut();
    notifyListeners();
  }
}
