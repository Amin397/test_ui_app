import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/Consts/measures.dart';
import 'package:testapp/Controller/Home/home_controller.dart';
import 'package:testapp/Model/Product/product_model.dart';

class BuildProductListWidget extends StatelessWidget {
  BuildProductListWidget({super.key});

  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size!.height * .28,
      width: size!.width,
      child: Consumer<HomeController>(
        builder: (context, HomeController controller, child) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: controller.productList.length,
            itemBuilder: (BuildContext context, int index) {
              ProductModel product = controller.productList[index];
              return InkWell(
                onTap: () {
                  controller.goToSingleScreen(
                    product: product,
                    index: index,
                    context:context,
                  );
                },
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: size!.width * .45,
                  height: double.maxFinite,
                  margin: paddingAll12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: shadow(),
                    borderRadius: radiusAll16,
                  ),
                  child: Column(
                    children: [
                      Flexible(
                        flex: 4,
                        child: Container(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          margin: paddingAll6,
                          child: ClipRRect(
                            borderRadius: radiusAll12,
                            child: Hero(
                              tag: 'product-image-$index',
                              child: Image.asset(
                                product.image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          padding: paddingSymmetricH8,
                          child: Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        product.title!,
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Text(
                                        'with ${product.details!.first.title!}',
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        '${product.price} K',
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.add_circle_rounded,
                                color: mainColor,
                                size: 45.0,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
