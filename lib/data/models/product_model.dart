class ProductModel {
  String productCode;
  String erpCode;
  String productName;
  int price;
  String? imageUrl;

  ProductModel({
    required this.productCode,
    required this.erpCode,
    required this.productName,
    required this.price,
     this.imageUrl,

  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productCode: json['productCode'],
      erpCode: json['erpCode'],
      productName: json['productName'],
      price: json['price'],
      imageUrl: json['imageUrl'],

    );
  }
}
