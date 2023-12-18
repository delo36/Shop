/*
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:field_app/core/styles/buttons/close_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewDialog extends StatelessWidget {
  final String imagePath;
  final PhotoViewType photoViewType;
  const PhotoViewDialog({Key? key,required this.imagePath,required this.photoViewType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if(photoViewType==PhotoViewType.assetImage)
        PhotoView(imageProvider: AssetImage(imagePath)),
        if(photoViewType==PhotoViewType.networkImage)
          PhotoView(imageProvider: CachedNetworkImageProvider(imagePath)),
        if(photoViewType==PhotoViewType.fileImage)
          PhotoView(imageProvider: FileImage(File(imagePath))),
        Positioned(
          right: 5,
          child: CloseIconButton(
            onPressed: ()=>Navigator.of(context).pop(),
          ),
        )
      ],
    );
  }
}


enum PhotoViewType {assetImage,fileImage,networkImage,}

void showPhotoViewDialog({required BuildContext context,required String imagePath,required PhotoViewType photoViewType}){
  showDialog(
    context: context,
    builder: (BuildContext context) =>PhotoViewDialog(imagePath: imagePath,photoViewType: photoViewType,),
  );
}
*/
