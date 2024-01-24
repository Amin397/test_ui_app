import 'package:flutter/material.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Text(
          'Cart',
          style: TextStyle(
            fontSize: 48.0,
          ),
        ),
      ),
    );
  }
}
