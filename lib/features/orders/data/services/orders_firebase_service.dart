import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:medlife_v2/features/orders/data/models/order.dart';
import 'package:medlife_v2/utils/constants.dart';

class OrdersFirebaseService {
  Future<List<Order>> getOrders() async {
    final List<Order> allOrders = [];

    final vendorsQuerySnapshot =
        await FirebaseFirestore.instance.collection(FirebasePath.vendors).get();

    for (final vendorDoc in vendorsQuerySnapshot.docs) {
      final vendorOrdersQuerySnapshot =
          await vendorDoc.reference.collection(FirebasePath.orders).get();
      final vendorOrders = vendorOrdersQuerySnapshot.docs
          .map((queryDocSnapshot) => Order.fromJson(queryDocSnapshot.data()))
          .toList();
      allOrders.addAll(vendorOrders);
    }

    allOrders.sort(
      (order, nextOrder) => nextOrder.dateTime.compareTo(order.dateTime),
    );
    return allOrders;
  }
}
