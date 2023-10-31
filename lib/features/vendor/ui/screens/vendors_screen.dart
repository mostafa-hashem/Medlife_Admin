import 'package:flutter/material.dart';
import 'package:medlife_v2/features/vendor/ui/widgets/vendors_list_view.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          VendorsListView(),
        ],
      ),
    );
  }
}
