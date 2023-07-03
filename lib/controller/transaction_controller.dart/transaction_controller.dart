import 'package:flutter/material.dart';
import 'package:marlo_payment_app/view/bottom_nav/bottom_nav.dart';

class TransactionController extends ChangeNotifier {
  void goBack(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const BottomNav();
        },
      ),
    );
    notifyListeners();
  }
}
