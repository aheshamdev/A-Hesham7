/// Firebase integration skeleton for Auth and Realtime Database/Firestore.
/// Wire actual Firebase packages and initialization when ready.
class FirebaseService {
  bool _initialized = false;
  String? _userId;
  String? _displayName;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _userId != null;
  String? get userId => _userId;
  String? get displayName => _displayName;

  Future<void> init() async {
    // TODO: Firebase.initializeApp()
    _initialized = true;
  }

  Future<void> signInAnonymously() async {
    // TODO: FirebaseAuth.instance.signInAnonymously()
    _userId = 'demo-user';
    _displayName = 'مستخدم';
  }

  Future<void> signOut() async {
    // TODO: FirebaseAuth.instance.signOut()
    _userId = null;
    _displayName = null;
  }

  /// Fetch daily progress from Firebase Database/Firestore.
  /// Map<Date, points>
  Future<Map<DateTime, int>> fetchDailyProgress(String userId) async {
    // TODO: Fetch from Firebase. Stubbed data below.
    final now = DateTime.now();
    return {
      DateTime(now.year, now.month, now.day): 3,
      DateTime(now.year, now.month, now.day - 1): 1,
      DateTime(now.year, now.month, now.day - 2): 2,
    };
  }
}
