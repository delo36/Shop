import 'package:flutter/material.dart';

Decoration backgroundImageDecoration({required String image}) {
  return BoxDecoration(
      image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover,)
  );
}

Decoration tabDecoration() {
  return const BoxDecoration(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      //color: screenBackgroundColor
  );
}


Decoration statusDecoration(Color color) {
  return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      color: color
  );
}

Decoration transportationProgressIconBackground(Color color){
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(100)
  );
}

Decoration normalBorderRadiusDecoration(){
  return BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(5));
}

Decoration ovalBorderRadiusDecoration(){
  return BoxDecoration(
      border: Border.all(width: 1,color: Colors.grey),
      borderRadius: BorderRadius.circular(50)
  );
}

