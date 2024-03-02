import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wemace/theme/pallete.dart';

class Loader extends ConsumerWidget {
  const Loader({Key? key}) : super(key: key);

  Widget build(BuildContext context, WidgetRef ref) {
    // final currentTheme = ref.watch(themeNotifierProvider);
    return Center(
      child: CircularProgressIndicator(
        // valueColor: AlwaysStoppedAnimation<Color>(currentTheme.dividerColor),
        strokeWidth: 3,
      ),
    );
  }
}
