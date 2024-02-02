import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_commit_viewer/config/helpers/date_helper.dart';
import 'package:github_commit_viewer/presentation/providers/commit_providers.dart';
import 'package:github_commit_viewer/presentation/widgets/commit_card.dart';

class CommitsList extends ConsumerStatefulWidget {
  const CommitsList({Key? key}) : super(key: key);

  @override
  CommitsListState createState() => CommitsListState();
}

class CommitsListState extends ConsumerState<CommitsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    getCommitList();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _refreshData() async {
    ref.read(commitsProvider.notifier).reloadData();
    getCommitList();
  }

  void getCommitList() {
    ref.read(commitsProvider.notifier).loadNextPage();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      getCommitList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final commitsList = ref.watch(commitsProvider);
    final isLoading = ref.watch(commitsProvider.notifier).isLoading;
    if (commitsList.isEmpty) {
      if (isLoading) {
        return Center(
            child: Image.asset(
          "assets/git_loading.gif",
          width: 100,
          height: 100,
        ));
      } else {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("NO DATA FOUND"),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _refreshData,
                child: const Text("Retry"),
              ),
            ],
          ),
        );
      }
    }

    return NotificationListener<ScrollEndNotification>(
      onNotification: (notification) {
        _scrollListener();
        return true;
      },
      child: RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: commitsList.length,
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 32),
          itemBuilder: (context, index) {
            final commit = commitsList[index];
            bool isSameDate = true;
            bool isLastInSection = false;
            final DateTime date = commit.commitDate;
            if (index == 0) {
              isSameDate = false;
            } else {
              final DateTime prevDate = commitsList[index - 1].commitDate;
              isSameDate = date.isSameDate(prevDate);
            }
            if (index + 2 > commitsList.length) {
              isLastInSection = true;
            } else {
              final DateTime nextDate = commitsList[index + 1].commitDate;
              isLastInSection = !date.isSameDate(nextDate);
            }

            if (index == 0 || !isSameDate) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.adjust,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text("Commits on ${date.formatDate()}"),
                      ],
                    ),
                  ),
                  CommitCard(
                      commit: commit, isFirst: true, isLast: isLastInSection),
                ],
              );
            } else {
              return CommitCard(
                  commit: commit, isFirst: false, isLast: isLastInSection);
            }
          },
        ),
      ),
    );
  }
}
