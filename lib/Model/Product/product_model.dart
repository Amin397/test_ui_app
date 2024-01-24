class ProductModel {
  int? id;
  int? price;
  double? rate;
  String? title;
  String? description;
  String? image;
  List<ProductSizeModel>? sizeModel;
  List<ProductDetailModel>? details;

  ProductModel(
      {required this.id,
      required this.price,
      required this.rate,
      required this.title,
      required this.description,
      required this.image,
      required this.sizeModel,
      required this.details});
}

class ProductSizeModel {
  int? id;
  String? title;
  bool isSelected;

  ProductSizeModel({
    required this.id,
    required this.title,
    required this.isSelected,
  });
}

class ProductDetailModel {
  int? id;
  String? title;
  String? image;

  ProductDetailModel({
    required this.id,
    required this.title,
    this.image,
  });
}
