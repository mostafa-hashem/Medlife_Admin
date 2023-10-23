import 'package:flutter/material.dart';
import 'package:medlife_v2/features/vendor/ui/widgets/vendors_list_view.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: const Column(
        children: [
          VendorsListView(),
        ],
      ),
    );
  }
}
