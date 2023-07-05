import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marlo_payment_app/controller/bottom_nav_controller/bottom_nav_controller.dart';
import 'package:marlo_payment_app/controller/home_controller/home_controller.dart';
import 'package:marlo_payment_app/controller/splash_controller/splash_controller.dart';
import 'package:marlo_payment_app/controller/token_controller/token_controller.dart';
import 'package:marlo_payment_app/controller/transaction_controller.dart/transaction_controller.dart';
import 'package:marlo_payment_app/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNavController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionController(),
        ),
        ChangeNotifierProvider(
          create: (context) => TokenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SplashController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
