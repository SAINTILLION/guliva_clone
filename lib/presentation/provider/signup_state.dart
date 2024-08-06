import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  String _firstName = '';
  String _lastName = '';
  String _phoneNumber = '';
  String _email = '';
  String _password = '';
  DateTime? _dateOfBirth;
  bool _isAgreeToTerms = false;
  bool _isLoading = false;

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get phoneNumber => _phoneNumber;
  String get email => _email;
  String get password => _password;
  DateTime? get dateOfBirth => _dateOfBirth;
  bool get isAgreeToTerms => _isAgreeToTerms;
  bool get isLoading => _isLoading;

  void setFirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  void setLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setDateOfBirth(DateTime dateOfBirth) {
    _dateOfBirth = dateOfBirth;
    notifyListeners();
  }

  void setAgreeToTerms(bool agreeToTerms) {
    _isAgreeToTerms = agreeToTerms;
    notifyListeners();
  }

  Future<void> signUp() async {
    _isLoading = true;
    notifyListeners();

    // Simulate a network request
    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();
  }
}
