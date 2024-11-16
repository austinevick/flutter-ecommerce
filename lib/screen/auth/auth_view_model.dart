import 'dart:async';

import 'package:e_commerce_app/common/navigators.dart';
import 'package:e_commerce_app/preferenceManager/preference_manager.dart';
import 'package:e_commerce_app/repository/app_repository.dart';
import 'package:e_commerce_app/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/api.dart';
import '../../common/utils.dart';

final authViewModel = ChangeNotifierProvider((ref) => AuthViewModel(ref));

class AuthViewModel extends ChangeNotifier {
  final Ref _ref;

  AuthViewModel(this._ref);

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoadingState(bool newValue) {
    _isLoading = newValue;
    notifyListeners();
  }

  AppRepository get _authRepo => _ref.read(appRepository);

  Future<void> login(String email, String password) async {
    try {
      setLoadingState(true);
      final savedEmail = await PreferenceManager.getUserEmail();
      final savedPassword = await PreferenceManager.getUserPasscode();
      if (savedEmail == email || savedPassword == password) {
        PreferenceManager.saveUserEmail(email);
        pushAndRemoveUntil(const HomeScreen());
      } else {
        simpleNotification('Invalid Credential', true);
      }
      setLoadingState(false);
    } on TimeoutException catch (_) {
      simpleNotification(timeoutMessage, true);
      setLoadingState(false);
      rethrow;
    } catch (_) {
      simpleNotification(unableToProcess, true);
      setLoadingState(false);
      rethrow;
    }
  }

  Future<void> register(String name, String email, String password) async {
    try {
      setLoadingState(true);
      final savedEmail = await PreferenceManager.getUserEmail();
      if (savedEmail == email) {
        simpleNotification('Email already exist', true);
      } else {
        PreferenceManager.saveUserEmail(email);
        PreferenceManager.saveUserName(name);
        PreferenceManager.saveUserPasscode(password);
        pushAndRemoveUntil(const HomeScreen());
      }
      setLoadingState(false);
    } on TimeoutException catch (_) {
      simpleNotification(timeoutMessage, true);
      setLoadingState(false);
      rethrow;
    } catch (_) {
      simpleNotification(unableToProcess, true);
      setLoadingState(false);
      rethrow;
    }
  }
}
