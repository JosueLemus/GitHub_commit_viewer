import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_commit_viewer/config/theme/app_theme.dart';
import 'package:github_commit_viewer/presentation/providers/theme_provider.dart';
import 'package:github_commit_viewer/presentation/screens/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Github Commit Viewer',
      theme: appTheme.getTheme(),
      home: const HomePage(),
    );
  }
}
