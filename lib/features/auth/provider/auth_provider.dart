import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pomotime/features/user/model/user_model.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;

  AuthProvider() {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  void _onAuthStateChanged(User? user) {
    if (user != null) {
      _user = user;
      notifyListeners();
    }
  }

  User? get user => _user;
  bool get isLoggedIn => _user != null;

  Future<String?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? newUser = userCredential.user;

      if (newUser != null) {
        UserModel userModel = UserModel(
          uid: newUser.uid,
          email: newUser.email!,
          displayName: null,
          totalCoins: 0,
          createdAt: Timestamp.now(),
        );
        await _firestore
            .collection('users')
            .doc(newUser.uid)
            .set(userModel.toMap());

        _user = newUser;
        notifyListeners();
      }
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return 'Bilinmeyen bir hata oluştu.';
    }
  }

  Future<String?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _user = userCredential.user;
      notifyListeners();

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return 'Bilinmeyen bir hata oluştu.';
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }
}

