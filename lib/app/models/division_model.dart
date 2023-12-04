class DivisionModel {
  int divisionId;
  String divisionName;

  DivisionModel({
    required this.divisionId,
    required this.divisionName,
  });

  factory DivisionModel.fromJson(Map<String, dynamic> json) {
    return DivisionModel(
      divisionId: json['divisionId'],
      divisionName: json['divisionName'],
    );
  }
}
