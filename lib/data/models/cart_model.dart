import 'package:shop_mobile/data/models/product_model.dart';

class CartModel {
  int id;
  String productCode;
  int quantity;
  ProductModel product;

  CartModel({
    required this.id,
    required this.productCode,
    required this.quantity,
    required this.product,

  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      productCode: json['productCode'],
      quantity: json['quantity'],
      product: ProductModel.fromJson(json["product"]),

    );
  }
}
