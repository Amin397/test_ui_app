import 'package:flutter/material.dart';
import 'package:testapp/Model/Product/product_model.dart';
import 'package:testapp/View/SingleProduct/Widgets/build_bottom_of_single_product_widget.dart';
import 'package:testapp/View/SingleProduct/Widgets/build_top_of_single_product_widget.dart';

class SingleProductScreen extends StatefulWidget {
  const SingleProductScreen(
      {super.key, required this.index, required this.product});

  final int index;
  final ProductModel product;

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        height: size!.height,
        width: size!.width,
        child: Stack(
          children: [
            BuildTopOfSingleProductWidget(
              index: widget.index,
              product: widget.product,
            ),
            BuildBottomOfSingleProductWidget(
              product: widget.product,
            ),
          ],
        ),
      ),
    );
  }
}
