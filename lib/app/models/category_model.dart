class CategoryModel {
  int itemCategoryId;
  String itemCategoryName;
  int divisionId;
  String? imageUrl;

  CategoryModel({
    required this.itemCategoryId,
    required this.itemCategoryName,
    required this.divisionId,
    this.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      itemCategoryId: json['itemCategoryId'],
      itemCategoryName: json['itemCategoryName'],
      divisionId: json['divisionId'],
      imageUrl: json['imageUrl'],
    );
  }
}
