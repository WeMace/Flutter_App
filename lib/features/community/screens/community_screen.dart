import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wemace/core/common/error_text.dart';
import 'package:wemace/core/common/loader.dart';
import 'package:wemace/core/common/post_card.dart';
import 'package:wemace/features/auth/controller/auth_controller.dart';
import 'package:wemace/features/community/controller/community_controller.dart';
import 'package:wemace/models/community_model.dart';

class CommunityScreen extends ConsumerWidget {
  final String name;
  const CommunityScreen({super.key, required this.name});

  void NavigateToEditTools(BuildContext context) {
    Routemaster.of(context).push('/edit-tools/${name}');
  }

  void joinCommunity(WidgetRef ref, Community community, BuildContext context) {
    ref
        .read(communityControllerProvider.notifier)
        .joinCommunity(community, context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    return Scaffold(
      body: ref.watch(getCommunityByNameProvider(name)).when(
            data: (community) => NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: 150,
                    floating: true,
                    snap: true,
                    flexibleSpace: Stack(children: [
                      Positioned.fill(
                        child: Image.network(
                          community.banner,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ]),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.all(16),
                    sliver: SliverList(
                        delegate: SliverChildListDelegate([
                      Align(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(community.avatar),
                          radius: 32,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${community.name}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          community.mods.contains(user.uid)
                              ? OutlinedButton(
                                  onPressed: () {
                                    NavigateToEditTools(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25)),
                                  child: const Text(
                                    'Edit',
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.orange),
                                  ))
                              : OutlinedButton(
                                  onPressed: () =>
                                      joinCommunity(ref, community, context),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25)),
                                  child: community.members.contains(user.uid)
                                      ? Text(
                                          'leave',
                                          style: const TextStyle(
                                              fontSize: 16, color: Colors.red),
                                        )
                                      : Text(
                                          'Join',
                                          style: const TextStyle(
                                              fontSize: 16, color: Colors.blue),
                                        ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('${community.members.length} Members'),
                      )
                    ])),
                  ),
                ];
              },
              body: ref.watch(getCommunityPostsProvider(name)).when(
                    data: (data) {
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          final post = data[index];
                          return PostCard(post: post);
                        },
                      );
                    },
                    error: (error, stackTrace) {
                      return ErrorText(error: error.toString());
                    },
                    loading: () => const Loader(),
                  ),
            ),
            error: (error, stackTrace) => ErrorText(error: error.toString()),
            loading: () => const Loader(),
          ),
    );
  }
}
