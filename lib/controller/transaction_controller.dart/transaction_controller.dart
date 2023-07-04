import 'package:flutter/material.dart';
import 'package:marlo_payment_app/model/transaction_model.dart/transaction_model.dart';
import 'package:marlo_payment_app/services/transaction_services/get_transaction_service.dart';
import 'package:marlo_payment_app/view/bottom_nav/bottom_nav.dart';

class TransactionController extends ChangeNotifier {
  bool isLoading = false;

  List<String> images = [
    "assets/images/3909383.png",
    "assets/images/flag-round-250.png",
    "assets/images/download.png",
  ];
  List<String> filterOptions = [
    'Money in',
    'Money out',
  ];
  List<String> statusOptions = [
    'Completed',
    'Pending',
    'Cancelled',
  ];
  List<String> title = [
    'USD',
    'CAD',
    'GBP',
  ];
  List<String> subTitle = [
    'United States Dollar',
    'Canadian Dollar',
    'British Pound',
  ];

  List<bool> isStatus = [
    true,
    false,
    false,
  ];
  List<bool> ischeckStatus = [
    false,
    false,
    false,
  ];
  List<bool> isSelected = [
    true,
    false,
  ];

  List<GetTransactionModel> transactionList = [];
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

  Future<void> getTransaction(context) async {
    isLoading = true;
    notifyListeners();
    await TransactionService().getTransaction(context).then(
      (value) {
        if (value != null) {
          transactionList = value;
          notifyListeners();
          isLoading = false;
          notifyListeners();
        } else {
          isLoading = false;
          notifyListeners();
          return null;
        }
      },
    );
    isLoading = false;
    notifyListeners();
  }

  void buttonSelection(selected, index) {
    isSelected[index] = selected;
    notifyListeners();
  }

  void statusSelection(selected, index) {
    isStatus[index] = selected;
    notifyListeners();
  }

  void checkSelection(selected, index) {
    ischeckStatus[index] = selected;
    notifyListeners();
  }
}
