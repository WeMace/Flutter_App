import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wemace/core/common/error_text.dart';
import 'package:wemace/core/common/loader.dart';
import 'package:wemace/core/utils.dart';
import 'package:wemace/features/community/controller/community_controller.dart';
import 'package:wemace/models/community_model.dart';
import 'package:wemace/theme/pallete.dart';

class AddPostTypeScreen extends ConsumerStatefulWidget {
  final String type;
  const AddPostTypeScreen({
    Key? key,
    required this.type,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddPostTypeScreenState();
}

class _AddPostTypeScreenState extends ConsumerState<AddPostTypeScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final linkController = TextEditingController();
  File? bannerFile;
  Uint8List? bannerWebFile;
  List<Community> communities = [];
  Community? selectedCommunity;

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
    linkController.dispose();
  }

  void selectBannerImage() async {
    final res = await pickImage();

    if (res != null) {
      if (kIsWeb) {
        setState(() {
          bannerWebFile = res.files.first.bytes;
        });
      }
      setState(() {
        bannerFile = File(res.files.first.path!);
      });
    }
  }

  void sharePost() {
    showSnackBar(context, 'Please enter all the fields');
  }

  @override
  Widget build(BuildContext context) {
    final isTypeImage = widget.type == 'image';
    final isTypeText = widget.type == 'text';
    final isTypeLink = widget.type == 'link';
    final currentTheme = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Post ${widget.type}'),
        actions: [
          TextButton(
            onPressed: sharePost,
            child: const Text('Share'),
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Enter Title here',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(18),
              fillColor: currentTheme.colorScheme.background,
            ),
            maxLength: 30,
          ),
          SizedBox(height: 10),
          if (isTypeImage)
            GestureDetector(
              onTap: selectBannerImage,
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(10),
                dashPattern: [10, 4],
                strokeCap: StrokeCap.round,
                color: currentTheme.textTheme.bodyMedium!.color!,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: bannerWebFile != null
                      ? Image.memory(bannerWebFile!)
                      : bannerFile != null
                          ? Image.file(bannerFile!)
                          : Center(
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: 40,
                              ),
                            ),
                ),
              ),
            ),
          if (isTypeText)
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Enter Description here',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(18),
                fillColor: currentTheme.colorScheme.background,
              ),
              maxLines: 5,
            ),
          if (isTypeLink)
            TextField(
              controller: linkController,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Enter link here',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(18),
                fillColor: currentTheme.colorScheme.background,
              ),
            ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Select Community',
            ),
          ),
          ref.watch(userCommunitiesProvider).when(
                data: (data) {
                  communities = data;

                  if (data.isEmpty) {
                    return SizedBox();
                  }

                  return DropdownButton(
                    value: selectedCommunity ?? data[0],
                    items: data
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name),
                          ),
                        )
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedCommunity = val;
                      });
                    },
                  );
                },
                error: (error, stackTrace) => ErrorText(
                  error: error.toString(),
                ),
                loading: () => Loader(),
              ),
        ],
      ),
    );
  }
}
