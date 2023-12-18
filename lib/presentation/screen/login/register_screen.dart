import 'package:flutter/material.dart';
import 'package:shop_mobile/core/extensions/size_extension.dart';
import '../../../core/styles/appbars/appbar.dart';
import '../../../core/styles/textstyles/default_text.dart';
import '../../../core/styles/textstyles/textstyles.dart';
import '../../../data/response/login/validate_otp_response.dart';
import 'component/retail_widget.dart';
import 'component/whole_sale_widget.dart';

class RegisterScreen extends StatefulWidget {
  final TextEditingController phoneController;
  ValidateOtpResponse validateOtpResponse;
  RegisterScreen({super.key,required this.phoneController,required this.validateOtpResponse});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  List<String> label = ["Retail","WholeSale"];
  late TextEditingController phoneNumberController;
  @override
  void initState() {
    phoneNumberController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: defaultAppBar(context, title: "Register Form"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: DefaultTabController(
          length: label.length,
          child: Column(
            children: [
              TabBar(
                  dividerColor: Colors.transparent,
                  //labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                  indicatorPadding: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 0,
                  indicator: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.black),
                  tabs: label.map((label) => SizedBox(
                    child: Tab(
                      child: Align(
                        alignment: Alignment.center,
                          child: DefaultText(label,style: TextStyles.bodyTextStyle,)),
                    ),
              )).toList()),
              (height*0.05).paddingHeight,
                 Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    RetailWidget(phoneController: widget.phoneController,validateOtpResponse: widget.validateOtpResponse,),
                    WholeSaleWidget(phoneController: widget.phoneController,validateOtpResponse: widget.validateOtpResponse,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
