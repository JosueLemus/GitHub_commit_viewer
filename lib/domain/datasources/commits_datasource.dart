import 'package:github_commit_viewer/domain/entities/commit.dart';

abstract class CommitsDatasource {
  Future<List<Commit>> getCommitList(String owner, String repo, int page,
      {int perPage = 10});
}
