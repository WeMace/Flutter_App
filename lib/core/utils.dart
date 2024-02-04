import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:wemace/theme/pallete.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: Pallete.blackColor, //light-mode
    ));
}

Future<FilePickerResult?> pickImage() async {
  final image = await FilePicker.platform.pickFiles(type: FileType.image);
  return image;
}
