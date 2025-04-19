import 'package:flutter/material.dart';

class BottomNavigationBarProvider extends ChangeNotifier{
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  updateIndex(index){
    _currentIndex = index;
    notifyListeners();
  }
}