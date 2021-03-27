import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authServicesProvider = Provider<AuthenticationService>((ref) {
  return AuthenticationService(ref.read(firebaseAuthProvider));
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authServicesProvider).authStateChange;
});
final emailProvider = StateProvider<String>((ref) {
  return '';
});

final passwordProvider = StateProvider<String>((ref) {
  return '';
});

class UserProvider {
  final FirebaseAuth _firebaseAuth;
  UserProvider(this._firebaseAuth);
  User? get usah => _firebaseAuth.currentUser;
  String? getName() {
    return usah!.displayName;
  }
}

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Login Successful";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  Future<String> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Signup Successful";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  Future<void> signout() async {
    await _firebaseAuth.signOut();
  }
}

Future<DocumentSnapshot> getDoc(x) async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  return await _firestore.collection('users').doc(x).get();
}
