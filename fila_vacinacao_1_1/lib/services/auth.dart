import 'package:fila_vacinacao_1_1/provider/users_shared_pre.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<UserModel> get user {
    return _auth
        .authStateChanges()
        .map((user) => (user != null) ? UserModel(id: user.uid) : null);
  }

  Future<String> singIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    return null;
  }

  Future<void> singOut() {
    Users().clearUser();
    try {
      _auth.signOut();
    } catch (e) {
      print('Error $e');
    }
    return null;
  }
}
