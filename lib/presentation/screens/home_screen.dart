import 'package:flutter/material.dart';
import 'package:github_commit_viewer/presentation/widgets/commits_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Commits'),
      ),
      body: CommitsList(),
    );
  }
}
