import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class SplashProvider extends ChangeNotifier {
  bool _splashClosed = false;
  User? _currentUser;

  bool get splashClosed => _splashClosed;
  User? get currentUser => _currentUser;

  closeSplash(User? user) {
    _splashClosed = true;
    _currentUser = user;
    notifyListeners();
  }
}
