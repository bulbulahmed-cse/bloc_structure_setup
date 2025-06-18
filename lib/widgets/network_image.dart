import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../generated/assets.dart';
import 'image_placeholder.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const CustomNetworkImage({super.key, this.fit, this.height, required this.url, this.width});

  @override
  Widget build(BuildContext context) {
    return url.isEmpty
        ? Image.asset(
            Assets.imagesEmpty,
            height: height ?? 100.w,
            width: width ?? 100.w,
            fit: fit ?? BoxFit.cover,
          )
        : CachedNetworkImage(
            imageUrl: url,
            height: height ?? 100.w,
            width: width ?? 100.w,
            fit: fit ?? BoxFit.cover,
            placeholder: (c, s) => Skeletonizer(child: ImagePlaceHolder(height: height ?? 100.w)),
            errorWidget: (c, s, o) => ImagePlaceHolder(height: height ?? 100.w),
          );
  }
}
