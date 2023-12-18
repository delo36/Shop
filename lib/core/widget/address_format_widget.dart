import 'package:flutter/material.dart';
import '../styles/textstyles/default_text.dart';
import '../styles/textstyles/textstyles.dart';

class AddressFormatWidget extends StatelessWidget {
  final String? buildingNo,buildingName,floor,roadStreet,wardQtr,cityVillageGroup,township,district,divisionState,countryRegion;
  const AddressFormatWidget({super.key,required this.buildingNo,required this.buildingName,required this.township,required this.district,required this.cityVillageGroup,required this.countryRegion,required this.divisionState,required this.floor,required this.roadStreet,required this.wardQtr});

  @override
  Widget build(BuildContext context) {
    return DefaultText("${floor}F ,No.$buildingNo ,$buildingName ,$roadStreet ,$township ,$district ,$divisionState ,$countryRegion", style: TextStyles.bodyTextStyle);
  }
}
