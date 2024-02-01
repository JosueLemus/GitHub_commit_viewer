import 'package:github_commit_viewer/domain/datasources/commits_datasource.dart';
import 'package:github_commit_viewer/domain/entities/commit.dart';
import 'package:github_commit_viewer/domain/repositories/commits_repository.dart';

class CommitRepositoryImpl extends CommitsRepository {
  final CommitsDatasource datasource;
  CommitRepositoryImpl(this.datasource);

  @override
  Future<List<Commit>> getCommitList(String owner, String repo, int page,
      {int perPage = 10}) {
    return datasource.getCommitList(owner, repo, page, perPage: perPage);
  }
}
