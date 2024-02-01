import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_commit_viewer/infrastructure/datasources/commit_githubapi_datasource.dart';
import 'package:github_commit_viewer/infrastructure/repositories/commit_repository_impl.dart';

final commitsRepositoryProvider = Provider((ref) {
  return CommitRepositoryImpl(CommitGithubAPIDataSource());
});
