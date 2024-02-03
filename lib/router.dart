// loggedOut
// loggedIn

import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wemace/features/auth/screens/login_screen.dart';
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
});
