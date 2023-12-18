import 'package:flutter/material.dart';
import 'package:shop_mobile/core/extensions/size_extension.dart';
import '../../../../core/styles/buttons/primary_button.dart';
import '../../../../core/styles/dropdowns/rectangle_drop_down_button.dart';
import '../../../../core/styles/textfields/outline_textfield.dart';
import '../../../../core/styles/textstyles/default_text.dart';
import '../../../../core/styles/textstyles/textstyles.dart';
import '../../../../data/request/add_new_delivery_address_request.dart';

class AddressDialogWidget extends StatefulWidget {
  final Addresses addresses;
  final Function(Addresses) received;
  const AddressDialogWidget(
      {super.key, required this.addresses, required this.received});

  @override
  State<AddressDialogWidget> createState() => _AddressDialogWidgetState();
}

class _AddressDialogWidgetState extends State<AddressDialogWidget> {
  List<String> division = ["Yangon", "Mandalay", "Myaing", "Pakokku", "Magway"];
  List<String> district = [
    "Yangon(North)",
    "Yangon(East)",
    "Yangon(South)",
    "Yangon(West)"
  ];
  List<String> township = [
    "Insein",
    "Mingaladon",
    "Hmawbi",
    "Hlegu",
    "Htantabin",
    "ShwePyiThar"
  ];
  List<String> city = ["Yangon/ShwePyiThar"];
  List<String> ward = [];
  String selectedDivision = "";
  String selectedDistrict = "";
  String selectedTownship = "";
  String selectedCity = "";
  String selectedWard = "";
  late TextEditingController roadController;
  late TextEditingController buildingController;
  late TextEditingController buildingNoController;
  late TextEditingController floorController;
  @override
  void initState() {
    roadController = TextEditingController();
    buildingController = TextEditingController();
    buildingNoController = TextEditingController();
    floorController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: SizedBox(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultText("Add Your Address",
                            style: TextStyles.titleTextStyle
                                .copyWith(fontWeight: FontWeight.w500)),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.clear)),
                      ],
                    ),
                    (height * 0.03).paddingHeight,
                    SizedBox(
                      height: 65,
                      child: RectangleDropDownButton(
                          values: division,
                          selectedValue: selectedDivision,
                          label: "Division/State",
                          onChange: (newValue) {
                            selectedDivision = newValue!;
                          }),
                    ),
                    (height * 0.005).paddingHeight,
                    SizedBox(
                      height: 65,
                      child: RectangleDropDownButton(
                          values: district,
                          selectedValue: selectedDistrict,
                          label: "District",
                          onChange: (newValue) {
                            selectedDistrict = newValue!;
                          }),
                    ),
                    (height * 0.005).paddingHeight,
                    SizedBox(
                      height: 65,
                      child: RectangleDropDownButton(
                          values: township,
                          selectedValue: selectedTownship,
                          label: "Township",
                          onChange: (newValue) {
                            selectedTownship = newValue!;
                          }),
                    ),
                    (height * 0.005).paddingHeight,
                    SizedBox(
                      height: 65,
                      child: RectangleDropDownButton(
                          values: city,
                          selectedValue: selectedCity,
                          label: "City Village Group",
                          onChange: (newValue) {
                            selectedCity = newValue!;
                          }),
                    ),
                    (height * 0.005).paddingHeight,
                    SizedBox(
                      height: 65,
                      child: RectangleDropDownButton(
                          values: ward,
                          selectedValue: selectedWard,
                          label: "Ward/Qtr",
                          onChange: (newValue) {
                            selectedWard = newValue!;
                          }),
                    ),
                    (height * 0.005).paddingHeight,
                    SizedBox(
                      height: 65,
                      child: OutLinedTextField(
                          minLine: 1,
                          maxLine: 1,
                          controller: roadController,
                          label: "Road/Street",
                          textInputType: TextInputType.text),
                    ),
                    (height * 0.005).paddingHeight,
                    SizedBox(
                      height: 65,
                      child: OutLinedTextField(
                          minLine: 1,
                          maxLine: 1,
                          controller: buildingController,
                          label: "Building Name",
                          textInputType: TextInputType.text),
                    ),
                    (height * 0.005).paddingHeight,
                    SizedBox(
                      height: 65,
                      child: OutLinedTextField(
                          minLine: 1,
                          maxLine: 1,
                          controller: buildingNoController,
                          label: "Building No",
                          textInputType: TextInputType.text),
                    ),
                    (height * 0.005).paddingHeight,
                    SizedBox(
                      height: 65,
                      child: OutLinedTextField(
                          maxLine: 1,
                          minLine: 1,
                          controller: floorController,
                          label: "Floor",
                          textInputType: TextInputType.text),
                    ),
                    (height * 0.005).paddingHeight,
                    SizedBox(
                        height: 65,
                        child: PrimaryButton(
                            onPressed: () {
                              Addresses newAddress = Addresses(
                                buildingNo: buildingNoController.text,
                                buildingName: buildingController.text,
                                floor: floorController.text,
                                roadStreet: roadController.text,
                                wardQtr: selectedWard,
                                cityVillageGroup: selectedCity,
                                township: selectedTownship,
                                district: selectedDistrict,
                                divisionState: selectedDivision,
                              );

                              widget.received(newAddress);
                              Navigator.pop(context);
                            },
                            label: "Save"))
                  ],
                ),
              ),
            ),
          ),
        );
  }
}
