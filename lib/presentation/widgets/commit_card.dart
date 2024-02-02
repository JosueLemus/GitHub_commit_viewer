import 'package:flutter/material.dart';
import 'package:github_commit_viewer/domain/entities/commit.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommitCard extends StatelessWidget {
  final Commit commit;
  final bool isFirst;
  final bool isLast;

  const CommitCard(
      {super.key,
      required this.commit,
      required this.isFirst,
      required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isFirst ? 4 : 0),
          topRight: Radius.circular(isFirst ? 4 : 0),
          bottomLeft: Radius.circular(isLast ? 4 : 0),
          bottomRight: Radius.circular(isLast ? 4 : 0),
        ),
        border: Border.all(
          color: isLast
              ? Colors.grey.withOpacity(0.5)
              : Colors.grey.withOpacity(0.4),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    commit.message,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          commit.avatarUrl,
                          width: 16,
                          height: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(commit.author),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(
                          Icons.circle,
                          size: 6,
                        ),
                      ),
                      Text(timeago.format(commit.commitDate)),
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(commit.commitId),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Icon(
                    Icons.copy_outlined,
                    size: 16,
                  ),
                ),
                const Icon(
                  Icons.code,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
