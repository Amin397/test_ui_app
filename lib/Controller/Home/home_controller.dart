import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/Model/Category/category_model.dart';
import 'package:testapp/Model/Product/product_model.dart';
import 'package:testapp/View/SingleProduct/single_product_screen.dart';

class HomeController extends ChangeNotifier {
  TextEditingController searchTextController = TextEditingController();

  List<CategoryModel> categoryList = [
    CategoryModel(
      id: 0,
      isSelected: true,
      title: 'Cappuccino',
      icon: 'assets/images/icons/img2.png',
    ),
    CategoryModel(
      id: 1,
      isSelected: false,
      title: 'Cold Brew',
      icon: 'assets/images/icons/img3.png',
    ),
    CategoryModel(
      id: 2,
      isSelected: false,
      title: 'Espresso',
      icon: 'assets/images/icons/img1.png',
    ),
    CategoryModel(
      id: 0,
      isSelected: false,
      title: 'Cappuccino',
      icon: 'assets/images/icons/img2.png',
    ),
  ];

  List<ProductModel> productList = [
    ProductModel(
      id: 0,
      title: 'Cappuccino',
      image: 'assets/images/product3.jpg',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit. ',
      price: 45,
      rate: 4.5,
      sizeModel: [
        ProductSizeModel(
          id: 0,
          title: 'Small',
          isSelected: true,
        ),
        ProductSizeModel(
          id: 1,
          title: 'Medium',
          isSelected: false,
        ),
        ProductSizeModel(
          id: 2,
          title: 'Large',
          isSelected: false,
        ),
      ],
      details: [
        ProductDetailModel(
          id: 0,
          title: 'Coffee',
          image: 'assets/images/icons/coffee.png',
        ),
        ProductDetailModel(
          id: 1,
          title: 'Chocolate',
          image: 'assets/images/icons/chocolate.png',
        ),
        ProductDetailModel(
          id: 2,
          title: 'Medium Roasted',
        ),
      ],
    ),
    ProductModel(
      id: 0,
      title: 'Cappuccino',
      image: 'assets/images/product2.jpg',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit. ',
      price: 50,
      rate: 4.5,
      sizeModel: [
        ProductSizeModel(
          id: 0,
          title: 'Small',
          isSelected: true,
        ),
        ProductSizeModel(
          id: 1,
          title: 'Medium',
          isSelected: false,
        ),
        ProductSizeModel(
          id: 2,
          title: 'Large',
          isSelected: false,
        ),
      ],
      details: [
        ProductDetailModel(
          id: 0,
          title: 'Coffee',
          image: 'assets/images/icons/coffee.png',
        ),
        ProductDetailModel(
          id: 1,
          title: 'Chocolate',
          image: 'assets/images/icons/chocolate.png',
        ),
        ProductDetailModel(
          id: 2,
          title: 'Medium Roasted',
        ),
      ],
    ),
  ];

  void selectCategory({required CategoryModel category}) {
    for (var o in categoryList) {
      o.isSelected = false;
    }
    category.isSelected = true;
    notifyListeners();
  }

  void goToSingleScreen({
    required ProductModel product,
    required int index,
    required BuildContext context,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SingleProductScreen(
          index: index,
          product: product,
        ),
      ),
    );
    // Navigator.
  }
}
