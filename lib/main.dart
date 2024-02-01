import 'package:flutter/material.dart';
import 'package:github_commit_viewer/config/theme/app_theme.dart';
import 'package:github_commit_viewer/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Github Commit Viewer',
      theme: AppTheme().getTheme(),
      home: const HomePage(),
    );
  }
}
