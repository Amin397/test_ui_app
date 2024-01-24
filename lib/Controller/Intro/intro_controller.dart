import 'package:flutter/material.dart';
import 'package:testapp/View/Dashboard/dashboard_screen.dart';

class IntroController with ChangeNotifier {
  void goToHome({
    required BuildContext context,
  }) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardScreen(),
      ),
    );
  }
}
