import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/components/app_error.dart';
import 'package:mvvm_with_provider/components/app_loading.dart';
import 'package:mvvm_with_provider/components/user_list_row.dart';
import 'package:mvvm_with_provider/user_list/models/user_model.dart';
import 'package:mvvm_with_provider/user_list/view_models/users_view_model.dart';
import 'package:mvvm_with_provider/utils/navigation_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Users"),
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto'),
        actions: [
          IconButton(
              onPressed: () async {
                openAddUser(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(children: [_ui(usersViewModel)]),
    );
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return const Expanded(
        child: Center(child: AppLoading()),
      );
    } else if (usersViewModel.userListModel.isEmpty) {
      return Expanded(
        child: Center(
            child: AppError(
          errorText: usersViewModel.userError.message.toString(),
        )),
      );
    }
    return Expanded(
      child: ListView.builder( 
        itemCount: usersViewModel.userListModel.length,
        itemBuilder: (context, index) {
          UserModel userModel = usersViewModel.userListModel[index];
          return UserListRow(
            userModel: userModel,
            onTap: () async {
              usersViewModel.setSelectedUser(userModel);
              openUserDetails(context);
            },
          );
        },
      ),
    );
  }
}
