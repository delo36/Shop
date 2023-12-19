import 'package:shop_mobile/data/models/addresses_model.dart';

class DefaultContactModel {
  String customerNo;
  int customerContactTypeId;
  String department;
  bool isDefaultContact;
  String contactPerson;
  String position;
  String contactPhoneNo;
  String email;
  AddressesModel customerContactAddress;

  DefaultContactModel({
    required this.customerNo,
    required this.customerContactTypeId,
    required this.department,
    required this.isDefaultContact,
    required this.contactPerson,
    required this.position,
    required this.contactPhoneNo,
    required this.email,
    required this.customerContactAddress,
  });

  Map<String, dynamic> toJson() {
    return {
      'customerNo': customerNo,
      'customerContactTypeId': customerContactTypeId,
      'department': department,
      'isDefaultContact': isDefaultContact,
      'contactPerson': contactPerson,
      'position': position,
      'contactPhoneNo': contactPhoneNo,
      'email': email,
      'customerContactAddress': customerContactAddress,
    };
  }
}