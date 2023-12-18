class VariantModel {
  String variantCode;
  String? imageUrl;
  int? count;


  VariantModel({
    required this.variantCode,
    this.imageUrl,
    this.count
  });

  factory VariantModel.fromJson(Map<String, dynamic> json) {
    return VariantModel(
      variantCode: json['variantCode'],
      imageUrl: json['imageUrl'],
      count: json['count'] ?? 0,
    );
  }
}
