class AddressesModel {
  String buildingNo;
  String floor;
  String buildingName;
  String roadStreet;
  String wardQtr;
  String cityVillageGroup;
  String townshipPostalCode;
  String township;
  String districtPostalCode;
  String district;
  String divisionStatePostalCode;
  String divisionState;
  String countryRegion;

  AddressesModel({
    required this.buildingNo,
    required this.floor,
    required this.buildingName,
    required this.roadStreet,
    required this.wardQtr,
    required this.cityVillageGroup,
    required this.townshipPostalCode,
    required this.township,
    required this.districtPostalCode,
    required this.district,
    required this.divisionStatePostalCode,
    required this.divisionState,
    required this.countryRegion,
  });

  Map<String, dynamic> toJson() {
    return {
      'buildingNo': buildingNo,
      'floor': floor,
      'buildingName': buildingName,
      'roadStreet': roadStreet,
      'wardQtr': wardQtr,
      'cityVillageGroup': cityVillageGroup,
      'townshipPostalCode': townshipPostalCode,
      'township': township,
      'districtPostalCode': districtPostalCode,
      'district': district,
      'divisionStatePostalCode': divisionStatePostalCode,
      'divisionState': divisionState,
      'countryRegion': countryRegion,
    };
  }
}
