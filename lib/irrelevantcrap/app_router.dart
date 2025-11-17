import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../baneofmyexistence/auth_provider.dart';
import '../theactualapp/about_page.dart';
import '../theactualapp/home_page.dart';
import '../theactualapp/login_page.dart';

//regular gorouter stuff
final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(
    authProvider,
  ); //watches authprovider im too tired to write more details

  return GoRouter(
    initialLocation: '/',

    redirect: (BuildContext context, GoRouterState state) {
      //uses streams to allow or block acces to /

      final isLoggedIn = authState != null;
      final isLoggingIn = state.matchedLocation == '/login';

      if (isLoggingIn && isLoggedIn) {
        return '/';
      }
      if (!isLoggingIn && !isLoggedIn) {
        return '/login';
      }
      return null;
    },

    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(path: '/about', builder: (context, state) => const AboutPage()),
    ],
  );
});
