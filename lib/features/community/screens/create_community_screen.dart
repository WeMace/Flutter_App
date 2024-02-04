import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wemace/core/common/loader.dart';
import 'package:wemace/core/constants/constants.dart';
import 'package:wemace/features/community/controller/community_controller.dart';

class CreateCommunityScreen extends ConsumerStatefulWidget {
  const CreateCommunityScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateCommunityScreenState();
}

class _CreateCommunityScreenState extends ConsumerState<CreateCommunityScreen> {
  final communityNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    communityNameController.dispose();
  }

  void createCommunity() {
    ref
        .read(CommunityControllerProvider.notifier)
        .createCommunity(communityNameController.text.trim(), context);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(CommunityControllerProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('Create a Community'),
          centerTitle: true,
        ),
        body: isLoading
            ? const Loader()
            : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Constants.communityLogo,
                          height: 240,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: communityNameController,
                        decoration: InputDecoration(
                          hintText: 'Community Name',
                          hintStyle: TextStyle(fontSize: 16),
                          prefixIcon: Icon(Icons.group),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: createCommunity,
                        child: const Text('Create Community!',
                            style: TextStyle(fontSize: 16)),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          // backgroundColor: Colors.purple[100]
                        ),
                      )
                    ]),
              ));
  }
}
