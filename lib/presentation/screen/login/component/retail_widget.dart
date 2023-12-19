import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shop_mobile/core/extensions/size_extension.dart';
import 'package:shop_mobile/data/models/addresses_model.dart';
import 'package:shop_mobile/data/models/default_addresses_model.dart';
import 'package:shop_mobile/data/models/default_contact_model.dart';
import 'package:shop_mobile/data/models/register_customer_model.dart';
import 'package:shop_mobile/presentation/getx/register/register_controller.dart';
import 'package:shop_mobile/presentation/screen/login/component/register_phone_number_widget.dart';
import '../../../../core/styles/buttons/primary_button.dart';
import '../../../../core/styles/dropdowns/rectangle_drop_down_button.dart';
import '../../../../core/styles/images/circle_asset_image.dart';
import '../../../../core/styles/textfields/outline_textfield.dart';
import '../../../../core/styles/textfields/phone_textfield.dart';
import '../../../../core/styles/textstyles/default_text.dart';
import '../../../../core/styles/textstyles/textstyles.dart';
import '../../../../core/value/images.dart';
import '../../../../core/widget/address_format_widget.dart';
import '../../../../data/request/add_new_delivery_address_request.dart';
import '../../../../data/request/register_customer_request.dart';
import '../../../../data/response/login/validate_otp_response.dart';
import 'address_dialog_widget.dart';
import 'birthday_widget.dart';

class RetailWidget extends StatefulWidget {
  RetailWidget({
    super.key,
  });

  @override
  State<RetailWidget> createState() => _RetailWidgetState();
}

class _RetailWidgetState extends State<RetailWidget> {
  late TextEditingController fullNameController;
  final List<String> gender = ["Male", "Female"];
  //Addresses? addresses;
  String selectedGender = '';
  String birthdayDate = "";
  String customerType = "Retail";

  @override
  void initState() {
    fullNameController = TextEditingController();
    birthdayDate = "Date of Birth";
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<RegisterController>(builder: (controller) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildProfile(),
              (height * 0.04).paddingHeight,
              SizedBox(
                height: 65,
                child: OutLinedTextField(
                    controller: fullNameController,
                    minLine: 1,
                    maxLine: 1,
                    label: "Full Name",
                    textInputType: TextInputType.text),
              ),
              (height * 0.02).paddingHeight,
              RegisterPhoneNumberWidget(),
              (height * 0.01).paddingHeight,
              SizedBox(
                height: 65,
                child: RectangleDropDownButton(
                    values: gender,
                    selectedValue: selectedGender,
                    label: "Gender",
                    onChange: (newValue) {
                      setState(() {
                        selectedGender = newValue!;
                      });
                    }),
              ),
              (height * 0.02).paddingHeight,
              BirthdayWidget(
                  birthdayDate: birthdayDate,
                  onDateSelected: (date) {
                    setState(() {
                      birthdayDate = date;
                    });
                  }),
              (height * 0.02).paddingHeight,
              //_address,
              (height * 0.02).paddingHeight,
              PrimaryButton(
                onPressed: () {
                  if (fullNameController.text.isNotEmpty &&
                      selectedGender.isNotEmpty &&
                      controller.phNumberController.text.isNotEmpty) {

                    AddressesModel addressModel = AddressesModel(
                        buildingNo: "260",
                        floor: "5",
                        buildingName: "string",
                        roadStreet: "ဗားကရာလမ်း",
                        wardQtr: "မြေနီကုန်းတောင်ရပ်ကွက်",
                        cityVillageGroup: "ရန်ကုန်မြို့",
                        townshipPostalCode: "013001",
                        township: "စမ်းချောင်းမြို့နယ်",
                        districtPostalCode: "013D001",
                        district: "ရန်ကုန် အနောင်တိုင်းခရိုင်",
                        divisionStatePostalCode: "013",
                        divisionState: "ရန်ကုန်တိုင်း",
                        countryRegion: "Myanmar");

                    DefaultContactModel defaultContactModel = DefaultContactModel(
                        customerNo: "LOC00001",
                        customerContactTypeId: 1,
                        department: "HQ",
                        isDefaultContact: false,
                        contactPerson: "HQ",
                        position: "Manager",
                        contactPhoneNo: controller.phNumberController.text,
                        email: "kth@gmail.com",
                        customerContactAddress: addressModel
                    );

                    DefaultAddressModel defaultAddressModel = DefaultAddressModel(
                        customerNo: "LOC00001",
                        shippingName: "Shipping Name 1",
                        contactPhoneNo: "09123",
                        addresses: addressModel
                    );

                    RegisterCustomerModel registerCustomerModel = RegisterCustomerModel(
                        registerVerifyToken: controller.token,
                        customerName: fullNameController.text ?? "",
                        phoneNumber: controller.phNumberController.text,
                        profilePhoto: "null",
                        facebookLink: "facebookLink",
                        customerType: customerType,
                        gender: selectedGender ?? "",
                        birthdayDate: birthdayDate ?? "",
                        websiteUrl: "websiteUrl",
                        businessTypeId: 1,
                        marketName: "marketName",
                        defaultContact: defaultContactModel,
                        defaultAddress: defaultAddressModel);

                    controller.registerCustomer(registerCustomerModel);


                  /*  BlocProvider.of<RegisterCustomerBloc>(context).add(
                        GetRegisterCustomerEvent(
                            registerCustomerRequest: RegisterCustomerRequest(
                                registerVerifyToken: widget.validateOtpResponse
                                    .data?.registerVerifyToken,
                                customerName: fullNameController.text ?? "",
                                phoneNumber: phoneController.text ?? "",
                                gender: selectedGender ?? "",
                                birthdayDate: birthdayDate ?? "",
                                customerType: customerType,
                                profilePhoto: base64Encode(shopProfile!),
                                defaultAddress: DefaultAddress(
                                    addresses: Addresses(
                                  buildingNo: addresses?.buildingNo,
                                  buildingName: addresses?.buildingName,
                                  floor: addresses?.floor,
                                  township: addresses?.township,
                                  divisionState: addresses?.divisionState,
                                  district: addresses?.district,
                                  wardQtr: addresses?.wardQtr,
                                )))));*/
                  }
                },
                label: "Next",
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildProfile() {
    return Stack(
      children: [
        (shopProfile != null)
            ? ClipOval(
                child: Image.memory(
                  Uint8List.fromList(shopProfile!),
                  width: 130,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              )
            : const CircleAssetImage(imagePath: Images.iconUser, size: 130),
        Positioned(
          right: 0,
          bottom: 0,
          child: InkWell(
            onTap: () {
              openCameraToTakePicture();
            },
            child: const CircleAvatar(
              backgroundColor: Color(0xfff3f3f3),
              child: Icon(
                Icons.camera_alt,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

 /* Widget get _address => Column(
        children: [
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AddressDialogWidget(
                    addresses: addresses ?? Addresses(),
                    received: (value) {
                      // addresses = value;
                      // setState(() {});
                    },
                  );
                },
              );
            },
            child: Row(
              children: [
                const Icon(Icons.add),
                DefaultText(
                  "Address",
                  style: TextStyles.bodyTextStyle
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          if (addresses != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on, size: 18),
                  Expanded(
                    child: AddressFormatWidget(
                      buildingNo: addresses?.buildingNo ?? "",
                      buildingName: addresses?.buildingName ?? "",
                      township: addresses?.township ?? "",
                      district: addresses?.district ?? "",
                      cityVillageGroup: addresses?.cityVillageGroup ?? "",
                      countryRegion: "Myanmar",
                      divisionState: addresses?.divisionState ?? "",
                      floor: addresses?.floor ?? "",
                      roadStreet: addresses?.roadStreet ?? "",
                      wardQtr: "",
                    ),
                  ),
                ],
              ),
            ),
        ],
      );*/

  List<int>? shopProfile;

  void openCameraToTakePicture() async {
    final picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      String path = photo.path;

      final cropFile = await ImageCropper().cropImage(
        sourcePath: path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 50,
        aspectRatioPresets: [CropAspectRatioPreset.square],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Shop Profile',
              toolbarColor: Colors.black,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: true),
          IOSUiSettings(
            title: 'Shop Profile',
          ),
        ],
      );
      File? image;
      if (cropFile != null) {
        image = await compressFile(File(cropFile.path));
      }
      setState(() {
        shopProfile = image?.readAsBytesSync();
      });
    }
  }

  Future<File?> compressFile(File file) async {
    final filePath = file.absolute.path;
    final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      outPath,
      quality: 25,
    );
    return result;
  }
}
