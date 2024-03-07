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
        // appBar: AppBar(
        //   title: const Text('Add Post'),
        //   centerTitle: true,
        // ),
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () => navigateToType(context, 'Image'),
            style: ElevatedButton.styleFrom(
              elevation: 24,
              minimumSize: Size(300, cardHeightWidth),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: SizedBox(
              height: cardHeightWidth,
              child: Icon(
                Icons.image_outlined,
                size: iconSize,
                color: Pallete.onSecondaryColor,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => navigateToType(context, 'Text'),
            style: ElevatedButton.styleFrom(
              elevation: 24,
              minimumSize: Size(300, cardHeightWidth),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: SizedBox(
              height: cardHeightWidth,
              child: Icon(
                Icons.text_fields_outlined,
                size: iconSize,
                color: Pallete.onSecondaryColor,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => navigateToType(context, 'Link'),
            style: ElevatedButton.styleFrom(
              elevation: 24,
              minimumSize: Size(300, cardHeightWidth),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: SizedBox(
              height: cardHeightWidth,
              child: Icon(
                Icons.link_outlined,
                size: iconSize,
                color: Pallete.onSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
