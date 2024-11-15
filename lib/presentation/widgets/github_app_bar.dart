import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_commit_viewer/config/constants/github_account_constants.dart';
import 'package:github_commit_viewer/presentation/providers/theme_provider.dart';

class GithubAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const GithubAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, ref) {
    final isDarkmode = ref.watch(themeNotifierProvider).isDarkmode;

    return AppBar(
      title: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: isDarkmode ? Colors.white : null,
              borderRadius: BorderRadius.circular(25),
            ),
            child: isDarkmode
                ? Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Image.asset("assets/github-dark-mode.png"),
                  )
                : Image.asset("assets/github-light-mode.png"),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${GithubAccountConstants.defaultOwner}/",
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                GithubAccountConstants.defaultRepo,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
            icon: Icon(isDarkmode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkmode();
            })
      ],
    );
  }
}
