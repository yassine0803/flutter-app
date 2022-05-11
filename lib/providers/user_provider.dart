import 'package:flutter/material.dart';
import 'package:notify/constants/users.dart';
import 'package:notify/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> users = [];

  void getUsers() {
    users = usersData.map((item) {
      UserModel user = UserModel.fromJson(item);
      return user;
    }).toList();
    notifyListeners();
  }

  void deleteUser(int index) {
    if (index < users.length) {
      users.removeAt(index);
      notifyListeners();
    }
  }

  void editUserRole(int index, String role) {
    users[index].role = role;
    notifyListeners();
  }

  void editUserBranch(int index, String branch) {
    users[index].branch = branch;
    notifyListeners();
  }
}
