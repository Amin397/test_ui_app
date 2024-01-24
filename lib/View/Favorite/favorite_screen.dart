import 'package:flutter/material.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Text(
          'Favorite',
          style: TextStyle(
            fontSize: 48.0,
          ),
        ),
      ),
    );
  }
}
