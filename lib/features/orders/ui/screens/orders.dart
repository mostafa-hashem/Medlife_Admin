import 'package:flutter/material.dart';
import 'package:medlife_v2/features/orders/ui/widgets/orders_list.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          OrdersList(),
        ],
      ),
    );
  }
}
