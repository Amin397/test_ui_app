import 'package:flutter/widgets.dart';

class DashboardController extends ChangeNotifier {
  int currentPage = 0;

  void changePage({required int index}) {
    currentPage = index;
    notifyListeners();
  }
}
