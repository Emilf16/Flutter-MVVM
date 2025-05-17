import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/user_list/views/add_user_screen.dart';
import 'package:mvvm_with_provider/user_list/views/user_details_screen.dart';

void openUserDetails(BuildContext context) async {
  await Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => UserDetailsScreen()));
}

void openAddUser(BuildContext context) async {
  await Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => AddUserScreen()));
}
