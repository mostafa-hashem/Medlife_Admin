import 'package:flutter/material.dart';
import 'package:medlife_v2/features/user/ui/widgets/users_list_view.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          UsersListView(),
        ],
      ),
    );
  }
}
