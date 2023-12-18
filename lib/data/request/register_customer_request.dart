class RegisterCustomerRequest {
  RegisterCustomerRequest({
      this.registerVerifyToken, 
      this.customerName, 
      this.phoneNumber, 
      this.profilePhoto, 
      this.facebookLink, 
      this.customerType, 
      this.gender, 
      this.birthdayDate, 
      this.websiteUrl, 
      this.businessTypeId, 
      this.marketName, 
      this.defaultContact, 
      this.defaultAddress, 
      this.customerPhotos,});

  RegisterCustomerRequest.fromJson(dynamic json) {
    registerVerifyToken = json['register_verify_token'];
    customerName = json['customerName'];
    phoneNumber = json['phoneNumber'];
    profilePhoto = json['profilePhoto'];
    facebookLink = json['facebookLink'];
    customerType = json['customerType'];
    gender = json['Gender'];
    birthdayDate = json['BirthdayDate'];
    websiteUrl = json['websiteUrl'];
    businessTypeId = json['businessTypeId'];
    marketName = json['marketName'];
    defaultContact = json['defaultContact'] != null ? DefaultContact.fromJson(json['defaultContact']) : null;
    defaultAddress = json['defaultAddress'] != null ? DefaultAddress.fromJson(json['defaultAddress']) : null;
    if (json['customerPhotos'] != null) {
      customerPhotos = [];
      json['customerPhotos'].forEach((v) {
        customerPhotos?.add(CustomerPhotos.fromJson(v));
      });
    }
  }
  String? registerVerifyToken;
  String? customerName;
  String? phoneNumber;
  String? profilePhoto;
  String? facebookLink;
  String? customerType;
  String? gender;
  String? birthdayDate;
  String? websiteUrl;
  num? businessTypeId;
  String? marketName;
  DefaultContact? defaultContact;
  DefaultAddress? defaultAddress;
  List<CustomerPhotos>? customerPhotos;
RegisterCustomerRequest copyWith({  String? registerVerifyToken,
  String? customerName,
  String? phoneNumber,
  String? profilePhoto,
  String? facebookLink,
  String? customerType,
  String? gender,
  String? birthdayDate,
  String? websiteUrl,
  num? businessTypeId,
  String? marketName,
  DefaultContact? defaultContact,
  DefaultAddress? defaultAddress,
  List<CustomerPhotos>? customerPhotos,
}) => RegisterCustomerRequest(  registerVerifyToken: registerVerifyToken ?? this.registerVerifyToken,
  customerName: customerName ?? this.customerName,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  profilePhoto: profilePhoto ?? this.profilePhoto,
  facebookLink: facebookLink ?? this.facebookLink,
  customerType: customerType ?? this.customerType,
  gender: gender ?? this.gender,
  birthdayDate: birthdayDate ?? this.birthdayDate,
  websiteUrl: websiteUrl ?? this.websiteUrl,
  businessTypeId: businessTypeId ?? this.businessTypeId,
  marketName: marketName ?? this.marketName,
  defaultContact: defaultContact ?? this.defaultContact,
  defaultAddress: defaultAddress ?? this.defaultAddress,
  customerPhotos: customerPhotos ?? this.customerPhotos,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['register_verify_token'] = registerVerifyToken;
    map['customerName'] = customerName;
    map['phoneNumber'] = phoneNumber;
    map['profilePhoto'] = profilePhoto;
    map['facebookLink'] = facebookLink;
    map['customerType'] = customerType;
    map['Gender'] = gender;
    map['BirthdayDate'] = birthdayDate;
    map['websiteUrl'] = websiteUrl;
    map['businessTypeId'] = businessTypeId;
    map['marketName'] = marketName;
    if (defaultContact != null) {
      map['defaultContact'] = defaultContact?.toJson();
    }
    if (defaultAddress != null) {
      map['defaultAddress'] = defaultAddress?.toJson();
    }
    if (customerPhotos != null) {
      map['customerPhotos'] = customerPhotos?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CustomerPhotos {
  CustomerPhotos({
      this.filename,});

  CustomerPhotos.fromJson(dynamic json) {
    filename = json['filename'];
  }
  String? filename;
CustomerPhotos copyWith({  String? filename,
}) => CustomerPhotos(  filename: filename ?? this.filename,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['filename'] = filename;
    return map;
  }

}

class DefaultAddress {
  DefaultAddress({
      this.customerNo, 
      this.shippingName, 
      this.contactPhoneNo, 
      this.addresses,});

  DefaultAddress.fromJson(dynamic json) {
    customerNo = json['customerNo'];
    shippingName = json['shippingName'];
    contactPhoneNo = json['contactPhoneNo'];
    addresses = json['addresses'] != null ? Addresses.fromJson(json['addresses']) : null;
  }
  String? customerNo;
  String? shippingName;
  String? contactPhoneNo;
  Addresses? addresses;
DefaultAddress copyWith({  String? customerNo,
  String? shippingName,
  String? contactPhoneNo,
  Addresses? addresses,
}) => DefaultAddress(  customerNo: customerNo ?? this.customerNo,
  shippingName: shippingName ?? this.shippingName,
  contactPhoneNo: contactPhoneNo ?? this.contactPhoneNo,
  addresses: addresses ?? this.addresses,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerNo'] = customerNo;
    map['shippingName'] = shippingName;
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

class DefaultContact {
  DefaultContact({
      this.customerNo, 
      this.customerContactTypeId, 
      this.department, 
      this.isDefaultContact, 
      this.contactPerson, 
      this.position, 
      this.contactPhoneNo, 
      this.email, 
      this.customerContactAddress,});

  DefaultContact.fromJson(dynamic json) {
    customerNo = json['customerNo'];
    customerContactTypeId = json['customerContactTypeId'];
    department = json['department'];
    isDefaultContact = json['isDefaultContact'];
    contactPerson = json['contactPerson'];
    position = json['position'];
    contactPhoneNo = json['contactPhoneNo'];
    email = json['email'];
    customerContactAddress = json['customerContactAddress'] != null ? CustomerContactAddress.fromJson(json['customerContactAddress']) : null;
  }
  String? customerNo;
  num? customerContactTypeId;
  String? department;
  bool? isDefaultContact;
  String? contactPerson;
  String? position;
  String? contactPhoneNo;
  String? email;
  CustomerContactAddress? customerContactAddress;
DefaultContact copyWith({  String? customerNo,
  num? customerContactTypeId,
  String? department,
  bool? isDefaultContact,
  String? contactPerson,
  String? position,
  String? contactPhoneNo,
  String? email,
  CustomerContactAddress? customerContactAddress,
}) => DefaultContact(  customerNo: customerNo ?? this.customerNo,
  customerContactTypeId: customerContactTypeId ?? this.customerContactTypeId,
  department: department ?? this.department,
  isDefaultContact: isDefaultContact ?? this.isDefaultContact,
  contactPerson: contactPerson ?? this.contactPerson,
  position: position ?? this.position,
  contactPhoneNo: contactPhoneNo ?? this.contactPhoneNo,
  email: email ?? this.email,
  customerContactAddress: customerContactAddress ?? this.customerContactAddress,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerNo'] = customerNo;
    map['customerContactTypeId'] = customerContactTypeId;
    map['department'] = department;
    map['isDefaultContact'] = isDefaultContact;
    map['contactPerson'] = contactPerson;
    map['position'] = position;
    map['contactPhoneNo'] = contactPhoneNo;
    map['email'] = email;
    if (customerContactAddress != null) {
      map['customerContactAddress'] = customerContactAddress?.toJson();
    }
    return map;
  }

}

class CustomerContactAddress {
  CustomerContactAddress({
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

  CustomerContactAddress.fromJson(dynamic json) {
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
CustomerContactAddress copyWith({  String? buildingNo,
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
}) => CustomerContactAddress(  buildingNo: buildingNo ?? this.buildingNo,
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