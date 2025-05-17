import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/components/info_section.dart';
import 'package:mvvm_with_provider/components/info_row.dart';
import 'package:mvvm_with_provider/user_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(usersViewModel.selectedUser.name ?? 'User Details'),
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoSection(
                title: 'Personal Information',
                children: [
                  InfoRow(label: 'ID', value: usersViewModel.selectedUser.id?.toString() ?? 'N/A'),
                  InfoRow(label: 'Name', value: usersViewModel.selectedUser.name ?? 'N/A'),
                  InfoRow(label: 'Username', value: usersViewModel.selectedUser.username ?? 'N/A'),
                  InfoRow(label: 'Email', value: usersViewModel.selectedUser.email ?? 'N/A'),
                  InfoRow(label: 'Phone', value: usersViewModel.selectedUser.phone ?? 'N/A'),
                  InfoRow(label: 'Website', value: usersViewModel.selectedUser.website ?? 'N/A'),
                ],
              ),
              const SizedBox(height: 20),
              if (usersViewModel.selectedUser.address != null)
                InfoSection(
                  title: 'Address',
                  children: [
                    InfoRow(label: 'Street', value: usersViewModel.selectedUser.address?.street ?? 'N/A'),
                    InfoRow(label: 'Suite', value: usersViewModel.selectedUser.address?.suite ?? 'N/A'),
                    InfoRow(label: 'City', value: usersViewModel.selectedUser.address?.city ?? 'N/A'),
                    InfoRow(label: 'Zip Code', value: usersViewModel.selectedUser.address?.zipcode ?? 'N/A'),
                    if (usersViewModel.selectedUser.address?.geo != null) ...[
                      InfoRow(label: 'Latitude', value: usersViewModel.selectedUser.address?.geo?.lat ?? 'N/A'),
                      InfoRow(label: 'Longitude', value: usersViewModel.selectedUser.address?.geo?.lng ?? 'N/A'),
                    ],
                  ],
                ),
              const SizedBox(height: 20),
              if (usersViewModel.selectedUser.company != null)
                InfoSection(
                  title: 'Company',
                  children: [
                    InfoRow(label: 'Name', value: usersViewModel.selectedUser.company?.name ?? 'N/A'),
                    InfoRow(label: 'Catch Phrase', value: usersViewModel.selectedUser.company?.catchPhrase ?? 'N/A'),
                    InfoRow(label: 'BS', value: usersViewModel.selectedUser.company?.bs ?? 'N/A'),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
