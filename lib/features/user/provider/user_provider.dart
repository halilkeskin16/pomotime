import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:pomotime/features/user/model/user_model.dart';

class UserProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserModel? _userModel;
  StreamSubscription? _userSubscription;

  UserModel? get userModel => _userModel;

  void updateUser(User? authUser) {
    if (authUser == null) {
      _userSubscription?.cancel();
      _userModel = null;
      notifyListeners();
    } else {
      _listenToUserData(authUser.uid);
    }
  }


  void _listenToUserData(String uid) {
    _userSubscription?.cancel();
    _userSubscription = _firestore.collection('users').doc(uid).snapshots().listen(
      (snapshot) {
        if (snapshot.exists && snapshot.data() != null) {
          _userModel = UserModel.fromMap(snapshot.data()!);
        } else {
          _userModel = null;
        }
        notifyListeners();
      },
    );
  }

  Future<void> addCoins(int amount) async {
    if (_userModel != null) {
      await _firestore.collection('users').doc(_userModel!.uid).update({
        'totalCoins': FieldValue.increment(amount),
      });
    }
  }

  @override
  void dispose() {
    _userSubscription?.cancel();
    super.dispose();
  }
}