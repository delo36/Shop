class AuthMeResponse {
  AuthMeResponse({
      this.customerNo, 
      this.customerName, 
      this.phoneNumber, 
      this.websiteUrl, 
      this.marketName, 
      this.profilePhoto, 
      this.facebookLink, 
      this.customerType, 
      this.gender, 
      this.birthdayDate, 
      this.businessType, 
      this.customerPhotos, 
      this.contacts,});

  AuthMeResponse.fromJson(dynamic json) {
    customerNo = json['customerNo'];
    customerName = json['customerName'];
    phoneNumber = json['phoneNumber'];
    websiteUrl = json['websiteUrl'];
    marketName = json['marketName'];
    profilePhoto = json['profilePhoto'];
    facebookLink = json['facebookLink'];
    customerType = json['customerType'];
    gender = json['Gender'];
    birthdayDate = json['BirthdayDate'];
    businessType = json['businessType'] != null ? BusinessType.fromJson(json['businessType']) : null;
    if (json['customerPhotos'] != null) {
      customerPhotos = [];
      json['customerPhotos'].forEach((v) {
        customerPhotos?.add(CustomerPhotos.fromJson(v));
      });
    }
    if (json['contacts'] != null) {
      contacts = [];
      json['contacts'].forEach((v) {
        contacts?.add(Contacts.fromJson(v));
      });
    }
  }
  String? customerNo;
  String? customerName;
  String? phoneNumber;
  String? websiteUrl;
  String? marketName;
  String? profilePhoto;
  String? facebookLink;
  String? customerType;
  String? gender;
  String? birthdayDate;
  BusinessType? businessType;
  List<CustomerPhotos>? customerPhotos;
  List<Contacts>? contacts;
AuthMeResponse copyWith({  String? customerNo,
  String? customerName,
  String? phoneNumber,
  String? websiteUrl,
  String? marketName,
  String? profilePhoto,
  String? facebookLink,
  String? customerType,
  String? gender,
  String? birthdayDate,
  BusinessType? businessType,
  List<CustomerPhotos>? customerPhotos,
  List<Contacts>? contacts,
}) => AuthMeResponse(  customerNo: customerNo ?? this.customerNo,
  customerName: customerName ?? this.customerName,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  websiteUrl: websiteUrl ?? this.websiteUrl,
  marketName: marketName ?? this.marketName,
  profilePhoto: profilePhoto ?? this.profilePhoto,
  facebookLink: facebookLink ?? this.facebookLink,
  customerType: customerType ?? this.customerType,
  gender: gender ?? this.gender,
  birthdayDate: birthdayDate ?? this.birthdayDate,
  businessType: businessType ?? this.businessType,
  customerPhotos: customerPhotos ?? this.customerPhotos,
  contacts: contacts ?? this.contacts,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerNo'] = customerNo;
    map['customerName'] = customerName;
    map['phoneNumber'] = phoneNumber;
    map['websiteUrl'] = websiteUrl;
    map['marketName'] = marketName;
    map['profilePhoto'] = profilePhoto;
    map['facebookLink'] = facebookLink;
    map['customerType'] = customerType;
    map['Gender'] = gender;
    map['BirthdayDate'] = birthdayDate;
    if (businessType != null) {
      map['businessType'] = businessType?.toJson();
    }
    if (customerPhotos != null) {
      map['customerPhotos'] = customerPhotos?.map((v) => v.toJson()).toList();
    }
    if (contacts != null) {
      map['contacts'] = contacts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Contacts {
  Contacts({
      this.customerContactId, 
      this.customerNo, 
      this.customerContactTypeId, 
      this.department, 
      this.isDefaultContact, 
      this.contactPerson, 
      this.position, 
      this.contactPhoneNo, 
      this.email, 
      this.customerContactAddressId, 
      this.createdBy, 
      this.updatedBy, 
      this.createdAt, 
      this.updatedAt, 
      this.customerContactAddress,});

  Contacts.fromJson(dynamic json) {
    customerContactId = json['customerContactId'];
    customerNo = json['customerNo'];
    customerContactTypeId = json['customerContactTypeId'];
    department = json['department'];
    isDefaultContact = json['isDefaultContact'];
    contactPerson = json['contactPerson'];
    position = json['position'];
    contactPhoneNo = json['contactPhoneNo'];
    email = json['email'];
    customerContactAddressId = json['customerContactAddressId'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    customerContactAddress = json['customerContactAddress'] != null ? CustomerContactAddress.fromJson(json['customerContactAddress']) : null;
  }
  num? customerContactId;
  String? customerNo;
  num? customerContactTypeId;
  String? department;
  bool? isDefaultContact;
  String? contactPerson;
  String? position;
  String? contactPhoneNo;
  String? email;
  num? customerContactAddressId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  CustomerContactAddress? customerContactAddress;
Contacts copyWith({  num? customerContactId,
  String? customerNo,
  num? customerContactTypeId,
  String? department,
  bool? isDefaultContact,
  String? contactPerson,
  String? position,
  String? contactPhoneNo,
  String? email,
  num? customerContactAddressId,
  dynamic createdBy,
  dynamic updatedBy,
  String? createdAt,
  String? updatedAt,
  CustomerContactAddress? customerContactAddress,
}) => Contacts(  customerContactId: customerContactId ?? this.customerContactId,
  customerNo: customerNo ?? this.customerNo,
  customerContactTypeId: customerContactTypeId ?? this.customerContactTypeId,
  department: department ?? this.department,
  isDefaultContact: isDefaultContact ?? this.isDefaultContact,
  contactPerson: contactPerson ?? this.contactPerson,
  position: position ?? this.position,
  contactPhoneNo: contactPhoneNo ?? this.contactPhoneNo,
  email: email ?? this.email,
  customerContactAddressId: customerContactAddressId ?? this.customerContactAddressId,
  createdBy: createdBy ?? this.createdBy,
  updatedBy: updatedBy ?? this.updatedBy,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  customerContactAddress: customerContactAddress ?? this.customerContactAddress,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerContactId'] = customerContactId;
    map['customerNo'] = customerNo;
    map['customerContactTypeId'] = customerContactTypeId;
    map['department'] = department;
    map['isDefaultContact'] = isDefaultContact;
    map['contactPerson'] = contactPerson;
    map['position'] = position;
    map['contactPhoneNo'] = contactPhoneNo;
    map['email'] = email;
    map['customerContactAddressId'] = customerContactAddressId;
    map['createdBy'] = createdBy;
    map['updatedBy'] = updatedBy;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (customerContactAddress != null) {
      map['customerContactAddress'] = customerContactAddress?.toJson();
    }
    return map;
  }

}

class CustomerContactAddress {
  CustomerContactAddress({
      this.addressId, 
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
      this.countryRegion, 
      this.createdAt, 
      this.updatedAt,});

  CustomerContactAddress.fromJson(dynamic json) {
    addressId = json['addressId'];
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
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  num? addressId;
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
  String? createdAt;
  String? updatedAt;
CustomerContactAddress copyWith({  num? addressId,
  String? buildingNo,
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
  String? createdAt,
  String? updatedAt,
}) => CustomerContactAddress(  addressId: addressId ?? this.addressId,
  buildingNo: buildingNo ?? this.buildingNo,
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
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['addressId'] = addressId;
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
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}

class CustomerPhotos {
  CustomerPhotos({
      this.customerPhotoId, 
      this.filename, 
      this.customerNo, 
      this.createdAt, 
      this.updatedAt,});

  CustomerPhotos.fromJson(dynamic json) {
    customerPhotoId = json['customerPhotoId'];
    filename = json['filename'];
    customerNo = json['customerNo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  num? customerPhotoId;
  String? filename;
  String? customerNo;
  String? createdAt;
  String? updatedAt;
CustomerPhotos copyWith({  num? customerPhotoId,
  String? filename,
  String? customerNo,
  String? createdAt,
  String? updatedAt,
}) => CustomerPhotos(  customerPhotoId: customerPhotoId ?? this.customerPhotoId,
  filename: filename ?? this.filename,
  customerNo: customerNo ?? this.customerNo,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerPhotoId'] = customerPhotoId;
    map['filename'] = filename;
    map['customerNo'] = customerNo;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}

class BusinessType {
  BusinessType({
      this.businessTypeId, 
      this.name, 
      this.createdAt, 
      this.updatedAt,});

  BusinessType.fromJson(dynamic json) {
    businessTypeId = json['businessTypeId'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  num? businessTypeId;
  String? name;
  String? createdAt;
  String? updatedAt;
BusinessType copyWith({  num? businessTypeId,
  String? name,
  String? createdAt,
  String? updatedAt,
}) => BusinessType(  businessTypeId: businessTypeId ?? this.businessTypeId,
  name: name ?? this.name,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['businessTypeId'] = businessTypeId;
    map['name'] = name;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}