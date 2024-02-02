import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_commit_viewer/presentation/providers/commit_providers.dart';

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

  void getCommitList() {
    ref.read(commitsProvider.notifier).loadNextPage();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      getCommitList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final commitsList = ref.watch(commitsProvider);

    if (commitsList.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return NotificationListener<ScrollEndNotification>(
      onNotification: (notification) {
        _scrollListener();
        return true;
      },
      child: ListView.builder(
        controller: _scrollController,
        itemCount: commitsList.length,
        itemBuilder: (context, index) {
          return Text(commitsList[index].message);
        },
      ),
    );
  }
}
