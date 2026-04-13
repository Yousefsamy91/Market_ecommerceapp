import 'package:flutter/material.dart';
import 'package:market_ecommerceapp/core/theme/custome_theme/bottom_navigation_bar_theme.dart';

class TBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const TBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
        ),
      ],
      backgroundColor:
      ThemeBottomNavigationBar.bottomNavBarTheme().backgroundColor,
      selectedItemColor:
      ThemeBottomNavigationBar.bottomNavBarTheme().selectedItemColor,
      unselectedItemColor:
      ThemeBottomNavigationBar.bottomNavBarTheme().unselectedItemColor,
      selectedLabelStyle:
      ThemeBottomNavigationBar.bottomNavBarTheme().selectedLabelStyle,
      unselectedLabelStyle:
      ThemeBottomNavigationBar.bottomNavBarTheme().unselectedLabelStyle,
      type: ThemeBottomNavigationBar.bottomNavBarTheme().type,
      showUnselectedLabels: true,
    );
  }
}