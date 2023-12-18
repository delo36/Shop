import 'package:flutter/material.dart';

import '../buttons/primary_button.dart';
import '../decorations/decorations.dart';
import '../textstyles/default_text.dart';
import '../textstyles/textstyles.dart';


AppBar defaultAppBar(BuildContext context,{required final String title}) {
  return AppBar(
    title: DefaultText(
      title,
      style: TextStyles.appBarTextStyle.copyWith(fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
  );
}
AppBar buttonAppBar(BuildContext context,{required final String title,required final String text,required final VoidCallback onPressed}){
  return AppBar(
    elevation: 0,
    title: DefaultText(
      title,
      style: TextStyles.appBarTextStyle.copyWith(fontWeight: FontWeight.w500,),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: LoginButton(onPressed: onPressed, label: "Login"),
      )
    ],
  );
}

AppBar noTitleAppBar(BuildContext context,String title,){
  return AppBar(
    leading:IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => Navigator.of(context).pop(),),
    title: DefaultText(
      title,style: TextStyles.appBarTextStyle,
    ),
    elevation: 0,
    backgroundColor: Colors.white,
  );
}

AppBar appBarWithIcons(BuildContext context, {required final String title,required final List<Widget> actions,final bool? centerTitle}) {
  return AppBar(
    title: DefaultText(
      title,
      style: TextStyles.appBarTextStyle.copyWith(fontWeight: FontWeight.bold)
    ),
    centerTitle: centerTitle ?? true,
    actions: actions,
  );
}
AppBar appBarWithSubTitle(BuildContext context, {required final String title,required final String subTitle}) {
  return AppBar(
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultText(
          title,
          style: TextStyles.appBarTextStyle,
        ),
        DefaultText(
          subTitle,
          style: TextStyles.descriptionTextStyle,
        ),
      ],
    ),
  );
}


AppBar tabsAppBar(BuildContext context, {required final String title, required final List<String> tabBarTitles}) {
  //create tabs from list
  List<Widget> tabs = [];
  for (String i in tabBarTitles) {
    tabs.add(Tab(
      child: Align(
        alignment: Alignment.center,
        child: DefaultText(i, style: TextStyles.subTitleTextStyle,),
      ),));
  }

  return AppBar(
    title: DefaultText(title,style: TextStyles.appBarTextStyle,),
    centerTitle: true,
    bottom: TabBar(
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: const EdgeInsets.symmetric(horizontal: 2.0),
        indicator:  tabDecoration(),
        tabs: tabs),
    elevation: 0,
  );
}
