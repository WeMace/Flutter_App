import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wemace/core/common/error_text.dart';
import 'package:wemace/core/common/loader.dart';
import 'package:wemace/features/community/controller/community_controller.dart';
import 'package:wemace/theme/pallete.dart';

class SearchCommunityDelegate extends SearchDelegate {
  final WidgetRef ref;
  SearchCommunityDelegate(this.ref);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Divider();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ref.watch(searchCommunityProvider(query)).when(
            data: (communities) => ListView.builder(
              itemCount: communities.length,
              itemBuilder: (BuildContext context, int index) {
                final community = communities[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(community.avatar),
                    radius: 24,
                  ),
                  title: Text(
                    community.name,
                  ),
                  onTap: () => navigateToCommunity(context, community.name),
                );
              },
            ),
            error: (error, StackTrace) => ErrorText(
              error: error.toString(),
            ),
            loading: () => const Loader(),
          ),
    );
  }

  void navigateToCommunity(BuildContext context, String communityName) {
    Routemaster.of(context).push('/r/${communityName}');
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    // final currentTheme = ref.watch(themeNotifierProvider);
    final theme = Theme.of(context);
    return theme.copyWith(
      textTheme: TextTheme(
        bodyLarge: const TextStyle(color: Colors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
        // hintStyle: TextStyle(color: currentTheme.dividerColor),
        filled: true,
        fillColor: Colors.white70,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
