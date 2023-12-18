class AddNewDeliveryAddressRequest {
  AddNewDeliveryAddressRequest({
      this.shippingName, 
      this.latitude, 
      this.longitude, 
      this.contactPhoneNo, 
      this.addresses,});

  AddNewDeliveryAddressRequest.fromJson(dynamic json) {
    shippingName = json['shippingName'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    contactPhoneNo = json['contactPhoneNo'];
    addresses = json['addresses'] != null ? Addresses.fromJson(json['addresses']) : null;
  }
  String? shippingName;
  num? latitude;
  num? longitude;
  String? contactPhoneNo;
  Addresses? addresses;
AddNewDeliveryAddressRequest copyWith({  String? shippingName,
  num? latitude,
  num? longitude,
  String? contactPhoneNo,
  Addresses? addresses,
}) => AddNewDeliveryAddressRequest(  shippingName: shippingName ?? this.shippingName,
  latitude: latitude ?? this.latitude,
  longitude: longitude ?? this.longitude,
  contactPhoneNo: contactPhoneNo ?? this.contactPhoneNo,
  addresses: addresses ?? this.addresses,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['shippingName'] = shippingName;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['contactPhoneNo'] = contactPhoneNo;
    if (addresses != null) {
      map['addresses'] = addresses?.toJson();
    }
    return map;
  }

}

class Addresses {
  Addresses({
      this.buildingNo, 
      this.floor, 
      this.buildingName, 
      this.roadStreet, 
      this.wardQtr, 
      this.cityVillageGroup, 
      this.townshipPostalCode, 
      this.township, 
      this.districtPostalCode, 
      this.district, 
      this.divisionStatePostalCode, 
      this.divisionState, 
      this.countryRegion,});

  Addresses.fromJson(dynamic json) {
    buildingNo = json['buildingNo'];
    floor = json['floor'];
    buildingName = json['buildingName'];
    roadStreet = json['roadStreet'];
    wardQtr = json['wardQtr'];
    cityVillageGroup = json['cityVillageGroup'];
    townshipPostalCode = json['townshipPostalCode'];
    township = json['township'];
    districtPostalCode = json['districtPostalCode'];
    district = json['district'];
    divisionStatePostalCode = json['divisionStatePostalCode'];
    divisionState = json['divisionState'];
    countryRegion = json['countryRegion'];
  }
  String? buildingNo;
  String? floor;
  String? buildingName;
  String? roadStreet;
  String? wardQtr;
  String? cityVillageGroup;
  String? townshipPostalCode;
  String? township;
  String? districtPostalCode;
  String? district;
  String? divisionStatePostalCode;
  String? divisionState;
  String? countryRegion;
Addresses copyWith({  String? buildingNo,
  String? floor,
  String? buildingName,
  String? roadStreet,
  String? wardQtr,
  String? cityVillageGroup,
  String? townshipPostalCode,
  String? township,
  String? districtPostalCode,
  String? district,
  String? divisionStatePostalCode,
  String? divisionState,
  String? countryRegion,
}) => Addresses(  buildingNo: buildingNo ?? this.buildingNo,
  floor: floor ?? this.floor,
  buildingName: buildingName ?? this.buildingName,
  roadStreet: roadStreet ?? this.roadStreet,
  wardQtr: wardQtr ?? this.wardQtr,
  cityVillageGroup: cityVillageGroup ?? this.cityVillageGroup,
  townshipPostalCode: townshipPostalCode ?? this.townshipPostalCode,
  township: township ?? this.township,
  districtPostalCode: districtPostalCode ?? this.districtPostalCode,
  district: district ?? this.district,
  divisionStatePostalCode: divisionStatePostalCode ?? this.divisionStatePostalCode,
  divisionState: divisionState ?? this.divisionState,
  countryRegion: countryRegion ?? this.countryRegion,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['buildingNo'] = buildingNo;
    map['floor'] = floor;
    map['buildingName'] = buildingName;
    map['roadStreet'] = roadStreet;
    map['wardQtr'] = wardQtr;
    map['cityVillageGroup'] = cityVillageGroup;
    map['townshipPostalCode'] = townshipPostalCode;
    map['township'] = township;
    map['districtPostalCode'] = districtPostalCode;
    map['district'] = district;
    map['divisionStatePostalCode'] = divisionStatePostalCode;
    map['divisionState'] = divisionState;
    map['countryRegion'] = countryRegion;
    return map;
  }

}