import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/user_list/models/user_error.dart';
import 'package:mvvm_with_provider/user_list/models/user_model.dart';
import 'package:mvvm_with_provider/user_list/repository/api_status.dart';
import 'package:mvvm_with_provider/user_list/repository/user_service.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  late UserError _userError;
  late UserModel _selectedUser;
  UserModel _addingUser = UserModel();
  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError get userError => _userError;
  UserModel get selectedUser => _selectedUser;
  UserModel get addingUser => _addingUser;

  UsersViewModel() {
    getUsers();
  }

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
    notifyListeners();
  }

  setSelectedUser(UserModel userModel) {
    _selectedUser = userModel;
  }

  addUser() {
    if (!isValid()) {
      return false;
    }
    _userListModel.add(_addingUser);
    _addingUser = UserModel();
    notifyListeners();
    return true;
  }

  isValid() {
    if (addingUser.name == null || addingUser.name!.isEmpty) {
      return false;
    }
    if (addingUser.email == null || addingUser.email!.isEmpty) {
      return false;
    }
    return true;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      _userError =
          UserError(code: response.code, message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }
}
