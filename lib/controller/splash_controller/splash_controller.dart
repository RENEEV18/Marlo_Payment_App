import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:marlo_payment_app/view/bottom_nav/bottom_nav.dart';

class SplashController extends ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  String? signinCheck;

  void splashTimer(context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const BottomNav();
          },
        ),
      );
    });
  }
}
