import 'package:flutter/material.dart';
class CircleAssetImage extends StatelessWidget {
  final String imagePath;
  final double size;
  const CircleAssetImage({super.key,required this.imagePath,required this.size});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: Image.asset(imagePath, height: size,width: size,fit: BoxFit.cover)
    );
  }
}
