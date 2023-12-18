import 'package:shop_mobile/data/models/variant_model.dart';

class ProductModel {
  String productCode;
  String erpCode;
  String productName;
  int price;
  String? imageUrl;
  List<VariantModel> variants;


  ProductModel({
    required this.productCode,
    required this.erpCode,
    required this.productName,
    required this.price,
     this.imageUrl,
    required this.variants
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productCode: json['productCode'],
      erpCode: json['erpCode'],
      productName: json['productName'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      variants: List<VariantModel>.from(json["variants"].map((x) => VariantModel.fromJson(x))),
    );
  }
}
