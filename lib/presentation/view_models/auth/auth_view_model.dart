import 'package:flutter/material.dart';
import 'package:insync_flutter/data/repository/auth/AuthRepository.dart';
import 'package:insync_flutter/domain/data_repo_interface/auth/auth_interface.dart';

class AuthViewModel extends ChangeNotifier{

  final AuthInterface _authRepo;

  AuthViewModel({required AuthRepository authRepo}): _authRepo = authRepo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _primaryEmail;
  String? get primaryEmail => _primaryEmail;

  // Perform Google Sign in
  Future<void> signInWithGoogle() async {
    _isLoading = true;
    notifyListeners();

    try{
      await _authRepo.googleSignIn();
      _isLoading = false;
      notifyListeners();
    }catch(error){
      _isLoading = false;
      notifyListeners();
    }
  }
}