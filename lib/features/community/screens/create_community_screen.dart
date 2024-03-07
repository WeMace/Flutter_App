import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wemace/core/common/loader.dart';
import 'package:wemace/core/constants/constants.dart';
import 'package:wemace/features/community/controller/community_controller.dart';
import 'package:wemace/responsive/responsive.dart';
import 'package:wemace/theme/pallete.dart';

class CreateCommunityScreen extends ConsumerStatefulWidget {
  const CreateCommunityScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateCommunityScreenState();
}

class _CreateCommunityScreenState extends ConsumerState<CreateCommunityScreen> {
  final communityNameController = TextEditingController();
  final communityBioController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    communityNameController.dispose();
    communityBioController.dispose();
  }

  void createCommunity() {
    ref
        .read(communityControllerProvider.notifier)
        .createCommunity(communityNameController.text.trim(), context);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(communityControllerProvider);
    final currentTheme = ref.watch(themeNotifierProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('Create a Community'),
          centerTitle: true,
        ),
        body: isLoading
            ? const Loader()
            : SingleChildScrollView(
                child: Responsive(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 650,
                                decoration: BoxDecoration(
                                  color: Pallete.secondaryColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 60,
                                left: 120,
                                right: 120,
                                child: CircleAvatar(
                                  radius: 48,
                                  backgroundImage:
                                      NetworkImage(Constants.avatarDefault),
                                ),
                              ),
                              Positioned(
                                top: 200,
                                left: 20,
                                right: 20,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: Pallete.surfaceColor,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: TextField(
                                    controller: communityNameController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Community Name',
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.group,
                                        color: Colors.grey,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 275,
                                left: 20,
                                right: 20,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: Pallete.surfaceColor,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: TextField(
                                    controller: communityBioController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Community Bio',
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.task_alt,
                                        color: Colors.grey,
                                      ),
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      border: InputBorder.none,
                                    ),
                                    // maxLines: 3,
                                    maxLength: 50,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 375,
                                left: 20,
                                right: 20,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Pallete.surfaceColor,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  height: 120,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 11,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            // Handle tap on profile avatar
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(12),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: NetworkImage(
                                                      Constants.avatarDefault),
                                                ),
                                                Text(
                                                  'Profile Name',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 550,
                                left: 80,
                                right: 80,
                                child: ElevatedButton(
                                  onPressed: createCommunity,
                                  child: const Text('Create',
                                      style: TextStyle(fontSize: 16)),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize:
                                        const Size(double.infinity, 50),
                                    backgroundColor: Pallete.primaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]),
                  ),
                ),
              ));
  }
}
