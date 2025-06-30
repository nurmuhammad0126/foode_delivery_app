import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({Key? key, required this.navigationShell}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = navigationShell.currentIndex;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          navigationShell, // Bu GoRouter orqali keladigan branch'lar
          Positioned(
            bottom: 15,
            left: 20,
            right: 20,
            child: _buildFloatingBottomNav(currentIndex, navigationShell),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingBottomNav(
    int selectedIndex,
    StatefulNavigationShell navShell,
  ) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(Icons.home, 0, "Home", selectedIndex, navShell),
          _buildNavItem(
            Icons.shopping_bag_outlined,
            1,
            "Order",
            selectedIndex,
            navShell,
          ),
          _buildNavItem(
            Icons.chat_bubble_outline,
            2,
            "Messages",
            selectedIndex,
            navShell,
          ),
          _buildNavItem(
            Icons.person_outline,
            3,
            "Profile",
            selectedIndex,
            navShell,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    int index,
    String label,
    int selectedIndex,
    StatefulNavigationShell navShell,
  ) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        navShell.goBranch(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary100 : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primary : Colors.grey[400],
              size: 24,
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
