import 'package:alison_task/view/static_pages.dart';
import 'package:alison_task/view/swan_home_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenController extends ChangeNotifier {
  int selectedIndex = 0;

  changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> screens = [
    const SwanHomeScreen(),
    const StaticPages(title: 'Brand'),
    const StaticPages(title: 'Best Items'),
    const StaticPages(title: 'Categories'),
    const StaticPages(title: 'Account'),
  ];
}
