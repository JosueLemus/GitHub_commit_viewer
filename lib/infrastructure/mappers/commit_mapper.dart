import 'package:github_commit_viewer/domain/entities/commit.dart';
import 'package:github_commit_viewer/infrastructure/models/gihub_commit.dart';

class CommitMapper {
  static Commit commitToEntity(GithubCommit githubCommit) => Commit(
      sha: githubCommit.sha,
      commitId: githubCommit.sha.substring(0, 7),
      message: githubCommit.commit.message,
      author: githubCommit.commit.author.name,
      avatarUrl: githubCommit.committer?.avatarUrl ??
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
      commitDate: githubCommit.commit.committer.date);
}
