import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  var _user;
  getUser() {
    return _user;
  }

  void setUser(user) {
    _user = user;
    notifyListeners();
  }
}
