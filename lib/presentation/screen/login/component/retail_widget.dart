import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_mobile/core/extensions/size_extension.dart';
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
import '../../../../data/response/login/validate_otp_response.dart';
import 'address_dialog_widget.dart';
import 'birthday_widget.dart';

class RetailWidget extends StatefulWidget {
  final TextEditingController phoneController;
  ValidateOtpResponse validateOtpResponse;
   RetailWidget({super.key, required this.phoneController,required this.validateOtpResponse});

  @override
  State<RetailWidget> createState() => _RetailWidgetState();
}

class _RetailWidgetState extends State<RetailWidget> {
  late TextEditingController fullNameController;
  final List<String> gender = ["Male", "Female"];
  Addresses? addresses;
  String selectedGender = '';
  late TextEditingController phoneController;
  String birthdayDate = "";
  String customerType = "Retail";
  @override
  void initState() {
    fullNameController = TextEditingController();
    phoneController = TextEditingController(text: widget.phoneController.text);
    birthdayDate = "Date of Birth";
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
              PhoneTextField(
                controller: phoneController,
                label: "",
                enable: false,
              ),
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
                }
              ),
              (height * 0.02).paddingHeight,
              _address,
              (height * 0.02).paddingHeight,
              PrimaryButton(
                onPressed: () {
                  // if(fullNameController.text.isNotEmpty && selectedGender.isNotEmpty && phoneController.text.isNotEmpty){
                  //   BlocProvider.of<RegisterCustomerBloc>(context).add(GetRegisterCustomerEvent(registerCustomerRequest: RegisterCustomerRequest(
                  //     registerVerifyToken: widget.validateOtpResponse.data?.registerVerifyToken,
                  //     customerName: fullNameController.text ?? "",
                  //     phoneNumber: phoneController.text ?? "",
                  //     gender: selectedGender ?? "",
                  //     birthdayDate:birthdayDate?? "",
                  //     customerType: customerType,
                  //     //profilePhoto: base64Encode(shopProfile!),
                  //     defaultAddress: DefaultAddress(
                  //       addresses: Addresses(
                  //         buildingNo: addresses?.buildingNo,
                  //         buildingName: addresses?.buildingName,
                  //         floor: addresses?.floor,
                  //         township: addresses?.township,
                  //         divisionState: addresses?.divisionState,
                  //         district: addresses?.district,
                  //         wardQtr: addresses?.wardQtr,
                  //       )
                  //     )
                  //   )));
                  // }
                },
                label: "Next",
              ),
            ],
          ),
        ),
      );
  }

  Widget _buildProfile() {
    return Stack(
      children: [
        (shopProfile !=null) ?
        ClipOval(
          child: Image.memory(
            Uint8List.fromList(shopProfile!),
            width: 130,
            height: 130,
            fit: BoxFit.cover,
          ),
        ):
            const CircleAssetImage(imagePath: Images.iconUser, size:130),
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

  Widget get _address => Column(
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
              style: TextStyles.bodyTextStyle.copyWith(fontWeight: FontWeight.w500),
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
  );

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
          AndroidUiSettings(toolbarTitle: 'Shop Profile', toolbarColor: Colors.black, toolbarWidgetColor: Colors.white, initAspectRatio: CropAspectRatioPreset.square, lockAspectRatio: true),
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
