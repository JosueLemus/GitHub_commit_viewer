import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_commit_viewer/domain/entities/commit.dart';
import 'package:github_commit_viewer/presentation/providers/commits_repository_provider.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<CommitsNotifier, List<Commit>>((ref) {
  final fetchMoreCommits = ref.watch(commitsRepositoryProvider).getCommitList;
  return CommitsNotifier(
    fetchMoreCommits: fetchMoreCommits,
    owner: 'JosueLemus',
    repo: 'bomberos_ya',
  );
});

typedef CommitCallback = Future<List<Commit>> Function(
    String owner, String repo, int page);

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
    final List<Commit> commits =
        await fetchMoreCommits(owner, repo, currentPage);
    state = [...state, ...commits];

    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
