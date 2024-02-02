import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_commit_viewer/config/constants/github_account_constants.dart';
import 'package:github_commit_viewer/domain/entities/commit.dart';
import 'package:github_commit_viewer/presentation/providers/commits_repository_provider.dart';

final commitsProvider =
    StateNotifierProvider<CommitsNotifier, List<Commit>>((ref) {
  final fetchMoreCommits = ref.watch(commitsRepositoryProvider).getCommitList;
  return CommitsNotifier(
    fetchMoreCommits: fetchMoreCommits,
    owner: GithubAccountConstants.defaultOwner,
    repo: GithubAccountConstants.defaultRepo,
  );
});

typedef CommitCallback = Future<List<Commit>>
    Function(String owner, String repo, int page, {int perPage});

class CommitsNotifier extends StateNotifier<List<Commit>> {
  int currentPage = 0;
  bool isLoading = false;
  CommitCallback fetchMoreCommits;
  String owner;
  String repo;

  CommitsNotifier({
    required this.fetchMoreCommits,
    required this.owner,
    required this.repo,
  }) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    currentPage++;
    final List<Commit> commits = await fetchMoreCommits(
        owner, repo, currentPage,
        perPage: GithubAccountConstants.commitsPerPage);
    state = [...state, ...commits];

    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }

  Future<void> reloadData() async {
    currentPage = 0;
    isLoading = false;
    state = [];
  }
}
