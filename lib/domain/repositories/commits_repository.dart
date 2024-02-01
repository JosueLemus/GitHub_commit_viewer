import 'package:github_commit_viewer/domain/entities/commit.dart';

abstract class CommitsRepository {
  Future<List<Commit>> getCommitList(String owner, String repo, int page,
      {int perPage = 10});
}
