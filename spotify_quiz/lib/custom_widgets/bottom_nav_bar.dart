import 'package:flutter/material.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

// ignore: must_be_immutable
class CustomNavBar extends StatelessWidget {
  int selectedIndex;
  void Function(int)? onItemTapped;

  CustomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_mark),
          label: 'Quiz',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: utilities.primaryColor,
      backgroundColor: utilities.similSecondaryColor,
      unselectedItemColor: utilities.tertiaryColor.withOpacity(0.7),
      selectedIconTheme: const IconThemeData(size: 50),
      elevation: 30.0,
      onTap: onItemTapped,
    );
  }
}

// ignore: must_be_immutable
class CustomNavBarRanking extends StatelessWidget {
  int selectedIndex;
  void Function(int)? onItemTapped;

  CustomNavBarRanking({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.place),
          label: 'Local',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Global',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: utilities.primaryColor,
      backgroundColor: utilities.similSecondaryColor,
      unselectedItemColor: utilities.tertiaryColor.withOpacity(0.7),
      selectedIconTheme: const IconThemeData(size: 50),
      elevation: 30.0,
      onTap: onItemTapped,
    );
  }
}
