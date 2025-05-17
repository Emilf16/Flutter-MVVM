import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/components/app_title.dart';
import 'package:mvvm_with_provider/user_list/models/user_model.dart';

class UserListRow extends StatelessWidget {
  final UserModel userModel;
  final VoidCallback onTap;
  
  const UserListRow({
    super.key,
    required this.userModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              userModel.name?.substring(0, 1).toUpperCase() ?? 'U',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: AppTitle(
            title: userModel.name ?? 'Unknown User',
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userModel.email ?? 'No email',
                style: const TextStyle(color: Colors.black54),
              ),
              Text(
                userModel.phone ?? 'No phone',
                style: const TextStyle(color: Colors.black45, fontSize: 12),
              ),
            ],
          ),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
