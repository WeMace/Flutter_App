import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wemace/theme/pallete.dart';

class AddPostScreen extends ConsumerWidget {
  const AddPostScreen({Key? key});

  void navigateToType(BuildContext context, String type) {
    Routemaster.of(context).push('/add-post/$type');
  }

  void navigateToHome(BuildContext context) {
    Routemaster.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final currentTheme = ref.watch(themeNotifierProvider);
    final cardHeightWidth = kIsWeb ? 200.0 : 150.0;
    final iconSize = kIsWeb ? 80.0 : 60.0;

    return Scaffold(
        appBar: AppBar(
          title: Text('Add Post'),
          actions: [],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () => navigateToType(context, 'Image'),
                child: Card(
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  color: Pallete.secondaryColor,
                  elevation: 16,
                  child: SizedBox(
                    height: cardHeightWidth,
                    child: Icon(
                      Icons.image_outlined,
                      size: iconSize,
                      color: Pallete.onSecondaryColor,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => navigateToType(context, 'Text'),
                child: Card(
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  color: Pallete.secondaryColor,
                  elevation: 16,
                  child: SizedBox(
                    height: cardHeightWidth,
                    child: Icon(
                      Icons.text_fields_outlined,
                      size: iconSize,
                      color: Pallete.onSecondaryColor,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => navigateToType(context, 'Link'),
                child: Card(
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  color: Pallete.secondaryColor,
                  elevation: 16,
                  child: SizedBox(
                    height: cardHeightWidth,
                    child: Icon(
                      Icons.link_outlined,
                      size: iconSize,
                      color: Pallete.onSecondaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
