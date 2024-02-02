import 'package:flutter/material.dart';
import 'package:github_commit_viewer/config/constants/github_account_constants.dart';

class GithubAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GithubAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Image.asset("assets/github-dark-mode.png"),
            ),
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
          icon: const Icon(Icons.brightness_6),
          onPressed: () {},
        ),
      ],
    );
  }
}
