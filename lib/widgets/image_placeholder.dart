
import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../generated/assets.dart';

class ImagePlaceHolder extends StatelessWidget {
  final double height;
  final double? width;
  final BoxFit? fit;

  const ImagePlaceHolder({super.key, required this.height, this.width, this.fit});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray,
      child: Image.asset(
        Assets.imagesImageGallery,
        fit: fit ?? BoxFit.cover,
        height: height,
        width: width,
    ),);
  }
}

