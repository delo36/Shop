class RegisterCustomerResponseModel {
  String status;
  RegisterData data;

  RegisterCustomerResponseModel({
    required this.status,
    required this.data,
  });

  factory RegisterCustomerResponseModel.fromJson(Map<String, dynamic> json) => RegisterCustomerResponseModel(
    status: json["status"],
    data: RegisterData.fromJson(json["data"]),
  );
}

class RegisterData {
  Customer customer;
  String accessToken;

  RegisterData({
    required this.customer,
    required this.accessToken,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
    customer: json['customer'],
    accessToken: json["accessToken"],

  );

}

class Customer {
  String? customerNo;
  String? customerName;
  String? phoneNumber;
  String? websiteUrl;
  String? marketName;
  dynamic profilePhoto;
  String? facebookLink;
  String? customerType;
  String? gender;
  DateTime? birthdayDate;
  BusinessType? businessType;
  List<Contact>? contacts;

  Customer({
    required this.customerNo,
    required this.customerName,
    required this.phoneNumber,
    required this.websiteUrl,
    required this.marketName,
    required this.profilePhoto,
    required this.facebookLink,
    required this.customerType,
    required this.gender,
    required this.birthdayDate,
    required this.businessType,
    required this.contacts,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    customerNo: json['customerNo'] ?? "",
    customerName: json["customerName"] ?? "",
    phoneNumber: json['phoneNumber'] ?? "",
    websiteUrl: json["websiteUrl"] ?? "",
    marketName: json['marketName'] ?? "",
    profilePhoto: json["profilePhoto"] ?? "",
    facebookLink: json['facebookLink'] ?? "",
    customerType: json["customerType"] ?? "",
    gender: json['gender'] ?? "",
    birthdayDate: json["birthdayDate"] ?? "",
    businessType: json["businessType"] ?? "",
    contacts: json["contacts"] ?? "",
  );

}

class BusinessType {
  int? businessTypeId;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  BusinessType({
    required this.businessTypeId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });
  factory BusinessType.fromJson(Map<String, dynamic> json) => BusinessType(
    businessTypeId: json['businessTypeId'] ?? "",
    name: json["name"] ?? "",
    createdAt: json['createdAt'] ?? "",
    updatedAt: json["updatedAt"] ?? "",

  );
}

class Contact {
  int? customerContactId;
  String? customerNo;
  int? customerContactTypeId;
  String? department;
  bool? isDefaultContact;
  String? contactPerson;
  String? position;
  String? contactPhoneNo;
  String? email;
  int? customerContactAddressId;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  CustomerContactAddress? customerContactAddress;

  Contact({
    required this.customerContactId,
    required this.customerNo,
    required this.customerContactTypeId,
    required this.department,
    required this.isDefaultContact,
    required this.contactPerson,
    required this.position,
    required this.contactPhoneNo,
    required this.email,
    required this.customerContactAddressId,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.customerContactAddress,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    customerContactId: json['customerContactId'] ?? "",
    customerNo: json["customerNo"] ?? "",
    customerContactTypeId: json['customerContactTypeId'] ?? "",
    department: json["department"] ?? "",
    isDefaultContact: json['isDefaultContact'] ?? "",
    contactPerson: json["contactPerson"] ?? "",
    position: json['position'] ?? "",
    contactPhoneNo: json["contactPhoneNo"] ?? "",
    email: json['email'] ?? "",
    customerContactAddressId: json["customerContactAddressId"] ?? "",
    createdBy: json['createdBy'] ?? "",
    updatedBy: json["updatedBy"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",
    customerContactAddress: json["customerContactAddress"] ?? "",
  );

}

class CustomerContactAddress {
  int? addressId;
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
  DateTime? createdAt;
  DateTime? updatedAt;

  CustomerContactAddress({
    required this.addressId,
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
    required this.createdAt,
    required this.updatedAt,
  });

  factory CustomerContactAddress.fromJson(Map<String, dynamic> json) => CustomerContactAddress(
    addressId: json['addressId'] ?? "",
    buildingNo: json["buildingNo"] ?? "",
    floor: json['floor'] ?? "",
    buildingName: json["buildingName"] ?? "",
    roadStreet: json['roadStreet'] ?? "",
    wardQtr: json["wardQtr"] ?? "",
    cityVillageGroup: json['cityVillageGroup'] ?? "",
    townshipPostalCode: json["townshipPostalCode"]?? "",
    township: json['township'] ?? "",
    districtPostalCode: json["districtPostalCode"] ?? "",
    district: json['district'] ?? "",
    divisionStatePostalCode: json["divisionStatePostalCode"] ?? "",
    divisionState: json["divisionState"] ?? "",
    countryRegion: json["countryRegion"] ?? "",
    createdAt: json["createdAt"] ?? "",
    updatedAt: json["updatedAt"] ?? "",

  );

}
