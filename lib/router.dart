// loggedOut
// loggedIn

import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wemace/features/auth/screens/login_screen.dart';
import 'package:wemace/features/community/screens/Edit_community_screen.dart';
import 'package:wemace/features/community/screens/Edit_tools_screen.dart';
import 'package:wemace/features/community/screens/add_mods_screen.dart';
import 'package:wemace/features/community/screens/community_screen.dart';
import 'package:wemace/features/community/screens/create_community_screen.dart';
import 'package:wemace/features/home/screens/home_screen.dart';
import 'package:wemace/features/post/screens/add_post_type_screen.dart';
import 'package:wemace/features/userprofile/screens/edit_profile_screen.dart';
import 'package:wemace/features/userprofile/screens/user_profile_screen.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(
        child: LoginScreen(),
      ),
});

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(
        child: HomeScreen(),
      ),
  '/create-community': (_) =>
      const MaterialPage(child: CreateCommunityScreen()),
  '/r/:name': (route) => MaterialPage(
          child: CommunityScreen(
        name: route.pathParameters['name']!,
      )),
  '/edit-tools/:name': (routeData) => MaterialPage(
          child: EditToolsScreen(
        name: routeData.pathParameters['name']!,
      )),
  '/edit-community/:name': (routeData) => MaterialPage(
          child: EditCommunityScreen(
        name: routeData.pathParameters['name']!,
      )),
  '/add-mods/:name': (routeData) => MaterialPage(
          child: AddModsScreen(
        name: routeData.pathParameters['name']!,
      )),
  '/u/:uid': (routeData) => MaterialPage(
          child: UserProfileScreen(
        uid: routeData.pathParameters['uid']!,
      )),
  '/edit-profile/:uid': (routeData) => MaterialPage(
          child: EditProfileScreen(
        uid: routeData.pathParameters['uid']!,
      )),
  '/add-post/:type': (routeData) => MaterialPage(
        child: AddPostTypeScreen(
          type: routeData.pathParameters['type']!,
        ),
      ),
});
