import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:medlife_v2/features/vendor/data/models/vendor.dart';
import 'package:medlife_v2/utils/constants.dart';

class VendorFirebaseService {
  final _vendorsCollection =
      FirebaseFirestore.instance.collection(FirebasePath.vendors);

  Future<List<Vendor>> geVendors() async {
    final queryDocSnapshot = await _vendorsCollection.get();
    return queryDocSnapshot.docs
        .map((docSnapshot) => Vendor.fromJson(docSnapshot.data()))
        .toList();
  }

  Future<Vendor?> getMostOrdersVendor() async {
    int highestNumOfOrders = 0;
    late QueryDocumentSnapshot mostOrdersVendorDoc;
    final vendorsQuerySnapshot = await _vendorsCollection.get();
    if (vendorsQuerySnapshot.docs.isEmpty) {
      return null;
    } else {
      for (final vendorDoc in vendorsQuerySnapshot.docs) {
        final vendorOrdersQuerySnapshot =
            await vendorDoc.reference.collection(FirebasePath.orders).get();
        final vendorNumOfOrders = vendorOrdersQuerySnapshot.docs.length;
        if (vendorNumOfOrders > highestNumOfOrders) {
          highestNumOfOrders = vendorNumOfOrders;
          mostOrdersVendorDoc = vendorDoc;
        }
      }
      return Vendor.fromJson(
        mostOrdersVendorDoc.data()! as Map<String, dynamic>,
      );
    }
  }
}
