import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Text(
          'Profile',
          style: TextStyle(
            fontSize: 48.0,
          ),
        ),
      ),
    );
  }
}
