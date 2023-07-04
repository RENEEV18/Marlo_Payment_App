import 'package:flutter/material.dart';
import 'package:marlo_payment_app/model/transaction_model.dart/transaction_model.dart';
import 'package:marlo_payment_app/services/transaction_services/get_transaction_service.dart';
import 'package:marlo_payment_app/view/bottom_nav/bottom_nav.dart';

class TransactionController extends ChangeNotifier {
  bool isLoading = false;
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
}
