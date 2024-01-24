import 'package:flutter/material.dart';
import 'package:testapp/Consts/measures.dart';
import 'package:testapp/Model/Product/product_model.dart';
import 'package:testapp/Utils/widget_utils.dart';

class BuildTopOfSingleProductWidget extends StatelessWidget {
  BuildTopOfSingleProductWidget(
      {super.key, required this.index, required this.product});

  Size? size;
  int? index;
  ProductModel? product;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size!.width,
      height: size!.height * .5,
      child: Stack(
        children: [
          Hero(
            tag: 'product-image-$index',
            child: Image.asset(
              product!.image!,
              fit: BoxFit.cover,
              width: size!.width,
              height: size!.height * .5,
            ),
          ),
          _buildTitleBar(),
          _buildBackButton(
            context: context,
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton({
    required BuildContext context,
  }) {
    return Align(
      alignment: Alignment.topLeft,
      child: SafeArea(
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: paddingAll18,
            height: size!.height * .05,
            width: size!.height * .05,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: shadow(),
            ),
            padding: paddingAll2,
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new,
                color: mainColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: size!.width,
        height: size!.height * .2,
        decoration: const BoxDecoration(
          color: Colors.black38,
        ),
        padding: paddingAll16,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitlePart(),
            _buildRatePart()
          ],
        ),
      ),
    );
  }

  Widget _buildRatePart() {
    return Container(
      width: size!.width * .17,
      height: size!.height * .04,
      margin: EdgeInsets.only(
        top: size!.height * .015,
      ),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: radiusAll50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.star,
            color: Colors.white,
            size: 20.0,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            product!.rate.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTitlePart() {
    return Expanded(
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product!.title!,
              style: const TextStyle(
                fontSize: 32.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              'With ${product!.details!.first.title}',
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
