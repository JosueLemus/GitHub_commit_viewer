import 'package:flutter/material.dart';
import 'package:github_commit_viewer/presentation/widgets/commits_list.dart';
import 'package:github_commit_viewer/presentation/widgets/github_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GithubAppBar(),
      body: CommitsList(),
    );
  }
}
