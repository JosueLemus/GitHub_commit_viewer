class Commit {
  final String sha;
  final String commitId;
  final String message;
  final String author;
  final String avatarUrl;
  final DateTime commitDate;

  Commit({
    required this.sha,
    required this.commitId,
    required this.message,
    required this.author,
    required this.avatarUrl,
    required this.commitDate,
  });
}
