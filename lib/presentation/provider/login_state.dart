import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  String _email = '';
  String _password = '';
  bool _isLoading = false;

  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<void> login() async {
    _isLoading = true;
    notifyListeners();

    // Simulate a network request
    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();
  }
}
