import 'package:diix_mvvm_ecommerce/models/user.dart';
import 'package:diix_mvvm_ecommerce/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';

enum AuthState{ Idle, Loading, Success, Error }

class AuthViewModel with ChangeNotifier {
  AuthState _state = AuthState.Idle;
  String? _errorMessage;
  final FirebaseAuthService _authService;

  AuthState get state => _state;
  String? get errorMessage => _errorMessage;

  User? _user;

  User? get user => _user;

  AuthViewModel(this._authService);

  Future<bool> login(String email, String password) async {
    _state = AuthState.Loading;
    notifyListeners();

    final user = await _authService.signInWithEmailAndPassword(email, password);
    if (user != null) {
      _user = user;
      _state = AuthState.Success;
      notifyListeners();
      return true;
    }
    _state = AuthState.Error;
    notifyListeners();
    return false;
  }

  Future<void> logout() async {
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }
}
