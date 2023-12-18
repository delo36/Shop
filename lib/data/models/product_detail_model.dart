import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String status;
  Data data;

  Welcome({
    required this.status,
    required this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  String productCode;
  String erpCode;
  String productName;
  int divisionId;
  String divisionName;
  int itemCategoryId;
  String itemCategoryName;
  int productCategoryId;
  String productCategoryName;
  int price;
  String imageUrl;


  Data({
    required this.productCode,
    required this.erpCode,
    required this.productName,
    required this.divisionId,
    required this.divisionName,
    required this.itemCategoryId,
    required this.itemCategoryName,
    required this.productCategoryId,
    required this.productCategoryName,
    required this.price,
    required this.imageUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    productCode: json["productCode"],
    erpCode: json["erpCode"],
    productName: json["productName"],
    divisionId: json["divisionId"],
    divisionName: json["divisionName"],
    itemCategoryId: json["itemCategoryId"],
    itemCategoryName: json["itemCategoryName"],
    productCategoryId: json["productCategoryId"],
    productCategoryName: json["productCategoryName"],
    price: json["price"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "productCode": productCode,
    "erpCode": erpCode,
    "productName": productName,
    "divisionId": divisionId,
    "divisionName": divisionName,
    "itemCategoryId": itemCategoryId,
    "itemCategoryName": itemCategoryName,
    "productCategoryId": productCategoryId,
    "productCategoryName": productCategoryName,
    "price": price,
    "imageUrl": imageUrl,
  };
}

class ProductMedia {
  int order;
  String url;

  ProductMedia({
    required this.order,
    required this.url,
  });

  factory ProductMedia.fromJson(Map<String, dynamic> json) => ProductMedia(
    order: json["order"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "order": order,
    "url": url,
  };
}
