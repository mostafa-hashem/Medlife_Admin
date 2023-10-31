import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medlife_v2/features/user/data/models/user.dart';
import 'package:medlife_v2/utils/constants.dart';

class UserFirebaseService {
  final _usersCollection =
      FirebaseFirestore.instance.collection(FirebasePath.users);

  Future<List<User>> getUsers() async {
    final docSnapshot = await _usersCollection.get();
    return docSnapshot.docs.map((doc) => User.fromJson(doc.data())).toList();
  }
}
