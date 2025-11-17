import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../irrelevantcrap/app_theme.dart';
import '../irrelevantcrap/app_router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  //basic riverpod app frmework
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Kanye Quotes',
      theme: blackTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
