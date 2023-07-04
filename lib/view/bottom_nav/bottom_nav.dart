import 'package:flutter/material.dart';
import 'package:marlo_payment_app/controller/bottom_nav_controller/bottom_nav_controller.dart';
import 'package:marlo_payment_app/utils/colors/colors.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavController>(
      builder: (context, value, child) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: value.bottonNavItems,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            iconSize: 25,
            elevation: 0,
            currentIndex: value.currentIndex,
            onTap: (data) {
              value.bottomNav(data);
            },
            selectedItemColor: AppColors.kBlue,
            selectedLabelStyle: const TextStyle(
              color: AppColors.kBlue,
            ),
            unselectedLabelStyle: TextStyle(
              color: AppColors.kBlack.withOpacity(0.4),
            ),
            unselectedItemColor: AppColors.kBlack.withOpacity(0.4),
          ),
          body: value.screens[value.currentIndex],
        );
      },
    );
  }
}
