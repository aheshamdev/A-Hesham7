import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:firebase_database/firebase_database.dart';

import '../models/user_model.dart';
import '../models/progress_model.dart';
import '../utils/constants.dart';

// خدمة Firebase: مصادقة + قراءة/كتابة تقدم المستخدم
class FirebaseService {
  final fb_auth.FirebaseAuth _auth = fb_auth.FirebaseAuth.instance;
  final FirebaseDatabase _db = FirebaseDatabase.instance;

  Stream<AppUser?> get authStateChanges => _auth.authStateChanges().map(
        (user) => user == null
            ? null
            : AppUser(
                uid: user.uid,
                email: user.email,
                displayName: user.displayName,
                photoUrl: user.photoURL,
              ),
      );

  Future<AppUser?> signInWithEmail(String email, String password) async {
    final cred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = cred.user;
    if (user == null) return null;
    return AppUser(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoURL,
    );
  }

  Future<AppUser?> signUpWithEmail(String email, String password) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = cred.user;
    if (user == null) return null;
    return AppUser(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoURL,
    );
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  DatabaseReference _userRef(String uid) =>
      _db.ref().child(DbKeys.users).child(uid);

  Future<UserProgress> getUserProgress(String uid) async {
    final snap = await _userRef(uid).child(DbKeys.progress).get();
    if (!snap.exists) {
      return const UserProgress();
    }
    final data = Map<String, dynamic>.from(snap.value as Map);
    return UserProgress.fromJson(data);
  }

  Future<void> updateUserProgress(String uid, UserProgress progress) async {
    await _userRef(uid).child(DbKeys.progress).set(progress.toJson());
  }
}
