
import 'default_addresses_model.dart';
import 'default_contact_model.dart';

class RegisterCustomerModel {
  String registerVerifyToken;
  String customerName;
  String phoneNumber;
  dynamic profilePhoto;
  String facebookLink;
  String customerType;
  String gender;
  String birthdayDate;
  String websiteUrl;
  int businessTypeId;
  String marketName;
  DefaultContactModel defaultContact;
  DefaultAddressModel defaultAddress;

  RegisterCustomerModel({
    required this.registerVerifyToken,
    required this.customerName,
    required this.phoneNumber,
    required this.profilePhoto,
    required this.facebookLink,
    required this.customerType,
    required this.gender,
    required this.birthdayDate,
    required this.websiteUrl,
    required this.businessTypeId,
    required this.marketName,
    required this.defaultContact,
    required this.defaultAddress,
  });

}






