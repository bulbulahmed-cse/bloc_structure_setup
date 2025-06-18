import 'dart:async';
import 'dart:io';

import 'package:bloc_structure_setup/core/extension/extension.dart';
import 'package:bloc_structure_setup/widgets/show_dialog.dart';
import 'package:bloc_structure_setup/widgets/show_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import '../core/theme/app_colors.dart';

Future<List<File>> getImage({bool isMultiple = false, bool? onlyGallery = false,bool? onlyCamera = false,bool? frontCamera = false,double? height,double? width}) async {
  var source = await showCupertinoModalPopup(
    barrierColor: AppColors.gray.withOpacityFraction(.65),
    context: appContext,
    builder: (BuildContext context) => CupertinoActionSheet(
      actions: <Widget>[
        !(onlyGallery??false) ? Container(
          color: Theme.of(context).cardTheme.color,
          child: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context, ImageSource.camera);
            },
            child: Text(
              appLanguage().camera,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.primary),
            ),
          ),
        ):Container(),
        !(onlyCamera??false)?Container(
          color: Theme.of(context).cardTheme.color,
          child: CupertinoActionSheetAction(
            onPressed: () {
              try{
                Navigator.pop(context, ImageSource.gallery);
              }catch(e){
                debugPrint(e.toString());
              }
            },
            child: Text(appLanguage().gallery, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.primary)),
          ),
        ):Container(),
      ],
      cancelButton: Card(
        margin: EdgeInsets.zero,
        child: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(appLanguage().close, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.primary)),
        ),
      ),
    ),
  );
  if (source != null) {
    final picker = ImagePicker();
    List<File> pickedFile = [];
    try {
      if(source == ImageSource.camera || !isMultiple){
        XFile? singleFile = await picker.pickImage(source: source, imageQuality: 50 ,preferredCameraDevice: frontCamera! ? CameraDevice.front : CameraDevice.rear,maxHeight: height,maxWidth: width);
        if (singleFile != null) {
          var image =  await getImageSize(File(singleFile.path));
          pickedFile.add(image);
        }
      }else{
        var image =  await picker.pickMultiImage(imageQuality: 50,maxHeight: height,maxWidth: width);
        for (var element in image) {
          var image =  await getImageSize(File(element.path));
          pickedFile.add(image);
        }
      }
      return pickedFile;

    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  } else {
    return [];
  }
}

Future getImageSize(File image) async {
  try{
    final filePath = image.path;

    // Create output file path
    // eg:- "Volume/VM/abcd_out.jpeg"
    final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = '${splitted}_out${filePath.substring(lastIndex)}';

    XFile? result = await FlutterImageCompress.compressAndGetFile(
      filePath, outPath,
      quality: 50,
    );
    final bytes = (await File(result!.path).readAsBytes()).lengthInBytes;
    final kb = bytes / 1024;
    final mb = kb / 1024;
    if (mb > 2) {
      errorDialog(message: appLanguage().file_size_to_large_please_select_another_file);
      return null;
    } else {
      return File(result.path);
    }
  }catch(e){
    debugPrint(e.toString());
    errorMessage(message: "Error in compressing image. Please try again.");
    return null;
  }
}
