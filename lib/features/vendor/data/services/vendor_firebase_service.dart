import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medlife_v2/features/vendor/data/models/vendor.dart';
import 'package:medlife_v2/utils/constants.dart';

class VendorFirebaseService {
  final _vendorsCollection =
      FirebaseFirestore.instance.collection(FirebasePath.vendors);

  Future<List<Vendor>> geVendors() async {
    final docSnapshot = await _vendorsCollection.get();
    return docSnapshot.docs.map((doc) => Vendor.fromJson(doc.data())).toList();
  }
}
