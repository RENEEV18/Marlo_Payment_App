import 'package:flutter/material.dart';
import 'package:marlo_payment_app/utils/colors/colors.dart';
import 'package:marlo_payment_app/view/transaction_screen/transaction_screen.dart';

class HomeController extends ChangeNotifier {
  List<String> values = [
    "15,256,486.00",
    "14,897,421.60",
    "18,587,421.60",
    "15,256,486.00",
    "14,897,421.60",
  ];
  List<String> images = [
    "assets/images/download.png",
    "assets/images/3909383.png",
    "assets/images/flag-round-250.png",
    "assets/images/Germany.png",
    "assets/images/flag-round-250 (1).png",
  ];
  List<String> names = [
    "British pound",
    "US dollar",
    "Canadian",
    "Euro(Germany)",
    "Euro(Ireland)",
  ];
  List<String> data = [
    "Verify your business document",
    "Verify your identity\n",
    "Verify your business document",
    "Verify your identity\n",
  ];
  List<IconData> icons = [
    Icons.document_scanner_outlined,
    Icons.phone_android_outlined,
    Icons.document_scanner_outlined,
    Icons.phone_android_outlined,
  ];

  List<List<Color>> gradientList = const [
    [
      Color.fromARGB(255, 248, 244, 250),
      Color.fromARGB(255, 244, 235, 250),
      Color.fromARGB(255, 223, 191, 248),
    ],
    [
      AppColors.kWhite,
      Color.fromARGB(255, 247, 225, 231),
      Color.fromARGB(255, 252, 189, 199),
    ],
    [
      Color.fromARGB(255, 248, 244, 250),
      Color.fromARGB(255, 244, 235, 250),
      Color.fromARGB(255, 223, 191, 248),
    ],
    [
      AppColors.kWhite,
      Color.fromARGB(255, 247, 225, 231),
      Color.fromARGB(255, 252, 189, 199),
    ],
  ];

  List<Color> backgroundColor = [
    Color.fromARGB(255, 228, 198, 250),
    Color.fromARGB(255, 252, 211, 217),
    const Color.fromARGB(255, 216, 174, 248),
    const Color.fromARGB(255, 252, 189, 199),
  ];
  List<Color> iconColor = [
    const Color.fromARGB(255, 189, 109, 250),
    const Color.fromARGB(255, 252, 156, 46),
    const Color.fromARGB(255, 189, 109, 250),
    const Color.fromARGB(255, 252, 156, 46),
  ];

  List<IconData> iconsTrans = [
    Icons.arrow_outward,
    Icons.arrow_outward,
    Icons.account_balance,
    Icons.currency_rupee,
    Icons.arrow_outward,
    Icons.arrow_outward,
    Icons.account_balance,
    Icons.arrow_outward,
    Icons.arrow_outward,
    Icons.currency_rupee,
  ];
  void toTransaction(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const TransactionScreen();
        },
      ),
    );
    notifyListeners();
  }
}
