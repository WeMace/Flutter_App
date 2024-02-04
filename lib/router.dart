// loggedOut
// loggedIn

import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wemace/features/auth/screens/login_screen.dart';
import 'package:wemace/features/community/screens/Edit_community_screen.dart';
import 'package:wemace/features/community/screens/Edit_tools_screen.dart';
import 'package:wemace/features/community/screens/community_screen.dart';
import 'package:wemace/features/community/screens/create_community_screen.dart';
import 'package:wemace/features/home/screens/home_screen.dart';

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
      ))
});
