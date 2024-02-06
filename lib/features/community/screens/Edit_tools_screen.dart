import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class EditToolsScreen extends StatelessWidget {
  final String name;
  const EditToolsScreen({
    Key? key,
    required this.name,
  }) : super(key: key);

  void NavigateToEditCommunity(BuildContext context) {
    Routemaster.of(context).push('/edit-community/${name}');
  }

  void NavigateToAddMods(BuildContext context) {
    Routemaster.of(context).push('/add-mods/${name}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Tools'),
      ),
      body: Column(children: [
        ListTile(
          leading: const Icon(Icons.add_moderator),
          title: const Text('Add Moderators'),
          onTap: () {
            NavigateToAddMods(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Edit Community'),
          onTap: () {
            NavigateToEditCommunity(context);
          },
        )
      ]),
    );
  }
}
