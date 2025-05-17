import 'dart:io';
import 'dart:convert';

import 'package:mvvm_with_provider/user_list/models/user_model.dart';
import 'package:mvvm_with_provider/user_list/repository/api_status.dart';
import 'package:mvvm_with_provider/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var response = await http.get(Uri.parse(USERS_LIST));
      if (response.statusCode == SUCCESS) {
        List<dynamic> jsonList = jsonDecode(response.body);
        List<UserModel> users =
            jsonList.map((json) => UserModel.fromJson(json)).toList();
        return Success(response.statusCode, users);
      }
      return Failure(USER_INVALID_RESPONSE, 'Invalid Response');
    } on HttpException {
      return Failure(NO_INTERNET, 'No Internet');
    } on SocketException {
      return Failure(NO_INTERNET, 'No Internet');
    } on FormatException {
      return Failure(INVALID_FORMAT, 'Invalid Format');
    } catch (e) {
      return Failure(UNKWON_ERROR, 'Unkown Error');
    }
  }
}
