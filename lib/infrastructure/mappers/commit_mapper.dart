import 'package:github_commit_viewer/domain/entities/commit.dart';
import 'package:github_commit_viewer/infrastructure/models/gihub_commit.dart';

class CommitMapper {
  static Commit commitToEntity(GithubCommit githubCommit) => Commit(
      sha: githubCommit.sha,
      commitId: githubCommit.sha.substring(0, 7),
      message: githubCommit.commit.message,
      author: githubCommit.committer.login,
      avatarUrl: githubCommit.committer.avatarUrl,
      commitDate: githubCommit.commit.committer.date);
}
