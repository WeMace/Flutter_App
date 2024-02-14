import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wemace/core/common/error_text.dart';
import 'package:wemace/core/common/loader.dart';
import 'package:wemace/core/constants/constants.dart';
import 'package:wemace/core/utils.dart';
import 'package:wemace/features/community/controller/community_controller.dart';
import 'package:wemace/models/community_model.dart';
import 'package:wemace/responsive/responsive.dart';
import 'package:wemace/theme/pallete.dart';

class EditCommunityScreen extends ConsumerStatefulWidget {
  final String name;
  const EditCommunityScreen({super.key, required this.name});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditCommunityScreenState();
}

class _EditCommunityScreenState extends ConsumerState<EditCommunityScreen> {
  File? bannerFile;
  File? avatarFile;
  Uint8List? bannerWebFile;
  Uint8List? avatarWebFile;

  void selectBannerImage() async {
    final res = await pickImage();
    if (res != null) {
      if (kIsWeb) {
        setState(() {
          bannerWebFile = res.files.first.bytes;
        });
      } else {
        setState(() {
          bannerFile = File(res.files.first.path!);
        });
      }
    }
  }

  void selectAvatarImage() async {
    final res = await pickImage();
    if (res != null) {
      if (kIsWeb) {
        setState(() {
          avatarWebFile = res.files.first.bytes;
        });
      } else {
        setState(() {
          avatarFile = File(res.files.first.path!);
        });
      }
    }
  }

  void save(Community community) {
    ref.read(communityControllerProvider.notifier).editCommunity(
          avatarFile: avatarFile,
          bannerFile: bannerFile,
          context: context,
          community: community,
          avatarWebFile: avatarWebFile,
          bannerWebFile: bannerWebFile,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(communityControllerProvider);
    final currentTheme = ref.watch(themeNotifierProvider);
    return ref.watch(getCommunityByNameProvider(widget.name)).when(
          data: (community) => Scaffold(
            backgroundColor: currentTheme.colorScheme.background,
            appBar: AppBar(
              title: const Text('Edit Community'),
              centerTitle: false,
              actions: [
                TextButton(
                  onPressed: () => save(community),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
            body: isLoading
                ? const Loader()
                : Responsive(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(children: [
                        SizedBox(
                          height: 200,
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: selectBannerImage,
                                child: DottedBorder(
                                  padding: EdgeInsets.all(8),
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(10),
                                  dashPattern: const [12, 4],
                                  strokeCap: StrokeCap.round,
                                  color:
                                      currentTheme.textTheme.bodyMedium!.color!,
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
                                            : community.banner.isEmpty ||
                                                    community.banner ==
                                                        Constants.bannerDefault
                                                ? const Center(
                                                    child: Icon(
                                                      Icons.camera_alt_outlined,
                                                      size: 48,
                                                      color: Colors.purple,
                                                    ),
                                                  )
                                                : Image.network(
                                                    community.banner),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 20,
                                child: GestureDetector(
                                  onTap: selectAvatarImage,
                                  child: avatarWebFile != null
                                      ? Image.memory(avatarWebFile!)
                                      : avatarFile != null
                                          ? CircleAvatar(
                                              backgroundImage:
                                                  MemoryImage(avatarWebFile!),
                                              radius: 32,
                                            )
                                          : avatarFile != null
                                              ? CircleAvatar(
                                                  backgroundImage:
                                                      FileImage(avatarFile!),
                                                  radius: 32,
                                                )
                                              : CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      community.avatar),
                                                  radius: 32,
                                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
          ),
          error: (error, StackTrace) => ErrorText(error: error.toString()),
          loading: () {
            return const Loader();
          },
        );
  }
}
