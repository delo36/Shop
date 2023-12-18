class ProductCategoryModel {
  int productCategoryId;
  String productCategoryName;
  int itemCategoryId;
  String? imageUrl;

  ProductCategoryModel({
    required this.productCategoryId,
    required this.productCategoryName,
    required this.itemCategoryId,
    this.imageUrl,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel(
      productCategoryId: json['productCategoryId'],
      productCategoryName: json['productCategoryName'],
      itemCategoryId: json['itemCategoryId'],
      imageUrl: json['imageUrl'],
    );
  }
}
