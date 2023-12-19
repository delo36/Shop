import 'addresses_model.dart';

class DefaultAddressModel {
  String customerNo;
  String shippingName;
  String contactPhoneNo;
  AddressesModel addresses;

  DefaultAddressModel({
    required this.customerNo,
    required this.shippingName,
    required this.contactPhoneNo,
    required this.addresses,
  });

  Map<String, dynamic> toJson() {
    return {
      'customerNo': customerNo,
      'shippingName': shippingName,
      'contactPhoneNo': contactPhoneNo,
      'addresses': addresses,

      // Add other fields as needed
    };
  }
}