import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:medlife_v2/features/auth/data/models/login_data.dart';
import 'package:medlife_v2/utils/constants.dart';

import '../../../user/data/models/user.dart';

class AuthFirebaseService {
  final _usersCollection =
      FirebaseFirestore.instance.collection(FirebasePath.users);


  Future<User> login(LoginData loginData) async {
    final userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginData.email,
      password: loginData.password,
    );
    final uId = userCredential.user!.uid;
    final docSnapShot = await _usersCollection.doc(uId).get();
    final userModel = User.fromJson(docSnapShot.data()!);
    return userModel;
  }

  Future<void> logout() => FirebaseAuth.instance.signOut();

  Future<void> requestPasswordReset(String email) =>
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);

  bool getAuthStatus() => FirebaseAuth.instance.currentUser != null;
}
