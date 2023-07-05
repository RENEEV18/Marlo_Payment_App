import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:marlo_payment_app/model/transaction_model.dart/transaction_model.dart';
import 'package:marlo_payment_app/services/transaction_services/get_transaction_service.dart';
import 'package:marlo_payment_app/view/bottom_nav/bottom_nav.dart';
import 'package:marlo_payment_app/view/transaction_screen/transaction_screen.dart';

class TransactionController extends ChangeNotifier {
  bool isLoading = false;
  bool isApplied = false;

  List<String> filterFields = [];
  List<String> finalList = [];

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
    false,
    false,
    false,
  ];
  List<bool> ischeckStatus = [
    false,
    false,
    false,
  ];
  List<bool> isSelected = [
    false,
    false,
  ];

  List<GetTransactionModel> transactionList = [];
  List<GetTransactionModel> filterList = [];

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

  void filterApplied(context) {
    filteredList();
    log(filterList.toString());
    isApplied = true;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return const TransactionScreen();
        },
      ),
    );
    notifyListeners();
    isApplied = true;
  }

  void filteredList() {
    var listFilter = transactionList.where((transaction) {
      if (isSelected[0] == true) {
        filterFields.add("Money in");
        finalList = filterFields.toSet().toList();
        return ['DEPOSIT', 'TRANSFER', 'REFUND']
            .contains(transaction.sourceType);
      } else if (isSelected[1] == true) {
        filterFields.add("Money out");
        finalList = filterFields.toSet().toList();

        return ['PAYOUT', 'CHARGE', 'PAYMENT_ATTEMPT', 'FEE']
            .contains(transaction.sourceType);
      }

      return false;
    }).where((transaction) {
      if (isStatus[1] == true) {
        filterFields.add("Pending");
        finalList = filterFields.toSet().toList();

        return transaction.status == 'PENDING';
      } else if (isStatus[0] == true) {
        filterFields.add("Completed");
        finalList = filterFields.toSet().toList();

        return transaction.status == 'SETTLED';
      } else if (isStatus[2] == true) {
        filterFields.add("Cancelled");
        finalList = filterFields.toSet().toList();

        return transaction.status == 'CANCELLED';
      }

      return false;
    }).toList();
    filterList = listFilter;
    notifyListeners();
  }

  void clear(index, context) {
    getTransaction(context);
    checkFieldsVisibility(index);
    notifyListeners();
  }

  void checkFieldsVisibility(index) {
    if (finalList.isNotEmpty) {
      finalList.removeAt(index);
      isApplied = true;
      notifyListeners();
    } else {
      isApplied = false;
      notifyListeners();
    }
  }

  void clearList() {
    filterList.clear();
    finalList.clear();
    filterFields.clear();
    isSelected = [false, false];
    isStatus = [false, false, false];
    notifyListeners();
  }

  // List<GetTransactionModel> dataFound = [];

  void search(String keyboard, context) {
    List<GetTransactionModel> results = [];
    if (keyboard.isEmpty) {
      results = transactionList;
      getTransaction(context);
      notifyListeners();
    } else {
      results = transactionList
          .where(
            (element) => element.description.toLowerCase().contains(
                  keyboard.toLowerCase().trimRight(),
                ),
          )
          .toList();
    }

    transactionList = results;
    notifyListeners();
  }
}
