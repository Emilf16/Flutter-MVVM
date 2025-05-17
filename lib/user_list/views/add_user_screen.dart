import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/user_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              bool userAdded = await usersViewModel.addUser();
              if(!userAdded){
                return;
              }
              Navigator.pop(context);
            },
          )
        ],
      ),

      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: 'Name'),
                onChanged: (value) async {
                  usersViewModel.addingUser.name = value;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email'),
                onChanged: (value) async {
                  usersViewModel.addingUser.email = value;
                },
              )
            ]),
      ),
    );
  }
}
