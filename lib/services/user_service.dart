import 'package:bavito/models/user.dart';
import 'package:flutter/material.dart';

///Contains all logic of acting with [User] in the app.
class UserService with ChangeNotifier {
  User? _user;

  ///Saves the `user`
  void createUser(User user) {
    _user = user;

    notifyListeners();
  }

  ///Sets `user` to `null`
  void deleteUser() {
    _user = null;
    notifyListeners();
  }

  User? get user => _user;

  bool get hasUser => _user != null;
}
