import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:testapp/Consts/measures.dart';
import 'package:testapp/Model/Product/product_model.dart';
import 'package:testapp/Utils/widget_utils.dart';

class BuildBottomOfSingleProductWidget extends StatelessWidget {
  BuildBottomOfSingleProductWidget({super.key, required this.product});

  Size? size;
  ProductModel? product;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: size!.width,
        height: size!.height * .6,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: shadow(),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(50),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: size!.width * .05,
          vertical: size!.height * .03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            animationConfig(
              widget: _buildProductDetailPart(),
              index: 3,
            ),
            SizedBox(
              height: size!.height * .03,
            ),
            animationConfig(
              widget: const Text(
                'Coffee Size',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              index: 3,
            ),
            animationConfig(
              widget: _buildSizePart(),
              index: 4,
            ),
            SizedBox(
              height: size!.height * .03,
            ),
            animationConfig(
              widget: const Text(
                'About',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              index: 4,
            ),
            SizedBox(
              height: size!.height * .02,
            ),
            animationConfig(
              widget: Text(
                product!.description!,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              index: 5,
            ),
            SizedBox(
              height: size!.height * .05,
            ),
            Expanded(
              child: animationConfig(
                widget: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: radiusAll50,
                    color: mainColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                      const Padding(
                        padding: paddingSymmetricV16,
                        child: VerticalDivider(
                          color: Colors.white38,
                        ),
                      ),
                      Text(
                        '${product!.price} K',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      )
                    ],
                  ),
                ),
                index: 5,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProductDetailPart() {
    return Container(
      width: size!.width,
      height: size!.height * .07,
      padding: paddingSymmetricH16,
      decoration: BoxDecoration(
        borderRadius: radiusAll50,
        color: const Color(0XFFA6A6AA).withOpacity(.21),
      ),
      child: ListView.separated(
        itemCount: product!.details!.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          ProductDetailModel detail = product!.details![index];
          return Padding(
            padding: paddingSymmetricH8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (detail.image is String) Image.asset(detail.image!),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  detail.title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: paddingSymmetricV8,
            child: VerticalDivider(
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }

  Widget _buildSizePart() {
    return Container(
      margin: paddingSymmetricV8,
      width: size!.width,
      height: size!.height * .07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSizeItem(
            productSize: product!.sizeModel!.first,
          ),
          _buildSizeItem(
            productSize: product!.sizeModel![1],
          ),
          _buildSizeItem(
            productSize: product!.sizeModel!.last,
          ),
        ],
      ),
    );
  }

  Widget _buildSizeItem({required ProductSizeModel productSize}) {
    return Container(
      width: size!.width * .25,
      margin: paddingSymmetricV8,
      height: double.maxFinite,
      decoration: BoxDecoration(
        color: (productSize.isSelected) ? mainColor : Colors.white,
        borderRadius: radiusAll50,
        boxShadow: shadow(),
      ),
      child: Center(
        child: Text(
          productSize.title!,
          style: TextStyle(
            color: (productSize.isSelected) ? Colors.white : Colors.black,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
