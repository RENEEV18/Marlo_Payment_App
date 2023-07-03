import 'package:flutter/material.dart';
import 'package:marlo_payment_app/view/chat_screen/chat_screen.dart';
import 'package:marlo_payment_app/view/contract_screen/contract_screen.dart';
import 'package:marlo_payment_app/view/home_screen/home_screen.dart';
import 'package:marlo_payment_app/view/loans_screen/loans_screen.dart';
import 'package:marlo_payment_app/view/teams_screen/teams_screen.dart';

class BottomNavController extends ChangeNotifier {
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottonNavItems = [
    const BottomNavigationBarItem(
      label: "Home",
      icon: Icon(
        Icons.home_outlined,
      ),
    ),
    const BottomNavigationBarItem(
      label: "Loans",
      icon: Icon(
        Icons.wallet_outlined,
      ),
    ),
    const BottomNavigationBarItem(
      label: "Contracts",
      icon: Icon(
        Icons.description_outlined,
      ),
    ),
    const BottomNavigationBarItem(
      label: "Teams",
      icon: Icon(
        Icons.groups_outlined,
      ),
    ),
    const BottomNavigationBarItem(
      label: "Chat",
      icon: Icon(
        Icons.chat_bubble_outline_rounded,
      ),
    ),
  ];

  List<Widget> screens = [
    const HomeScreen(),
    const LoanScreen(),
    const ContractScreen(),
    const TeamsScreen(),
    const ChatScreen(),
  ];

  void bottomNav(int value) {
    currentIndex = value;
    notifyListeners();
  }
}
