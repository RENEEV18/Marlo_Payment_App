import 'package:flutter/material.dart';
import 'package:marlo_payment_app/controller/bottom_nav_controller/bottom_nav_controller.dart';
import 'package:marlo_payment_app/controller/home_controller/home_controller.dart';
import 'package:marlo_payment_app/view/bottom_nav/bottom_nav.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BottomNav(),
      ),
    );
  }
}
