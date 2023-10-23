import 'package:flutter/material.dart';
import 'package:medlife_v2/features/user/ui/widgets/users_list_view.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: const Column(
        children: [
          UsersListView(),
        ],
      ),
    );
  }
}
