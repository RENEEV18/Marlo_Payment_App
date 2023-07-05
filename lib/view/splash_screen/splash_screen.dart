import 'package:flutter/material.dart';
import 'package:marlo_payment_app/controller/splash_controller/splash_controller.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      ((timeStamp) {
        Provider.of<SplashController>(context, listen: false)
            .splashTimer(context);
      }),
    );
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
              child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
              "assets/images/download.jpeg",
            ),
          )),
        ),
      ),
    );
  }
}
