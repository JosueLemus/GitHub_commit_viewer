class GithubCommit {
  String sha;
  String nodeId;
  CommitData commit;
  CommitAuthor? committer;

  GithubCommit({
    required this.sha,
    required this.nodeId,
    required this.commit,
    required this.committer,
  });

  factory GithubCommit.fromJson(Map<String, dynamic> json) => GithubCommit(
        sha: json["sha"],
        nodeId: json["node_id"],
        commit: CommitData.fromJson(json["commit"]),
        committer: json["committer"] == null
            ? null
            : CommitAuthor.fromJson(json["committer"]),
      );

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "node_id": nodeId,
        "commit": commit.toJson(),
        "committer": committer?.toJson(),
      };

  static List<GithubCommit> fromJsonList(List<dynamic> json) {
    final complaints = json.map((data) => GithubCommit.fromJson(data)).toList();
    return complaints;
  }
}

class CommitAuthor {
  String login;
  int id;
  String avatarUrl;

  CommitAuthor({
    required this.login,
    required this.id,
    required this.avatarUrl,
  });

  factory CommitAuthor.fromJson(Map<String, dynamic> json) => CommitAuthor(
        login: json["login"],
        id: json["id"],
        avatarUrl: json["avatar_url"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "avatar_url": avatarUrl,
      };
}

class CommitData {
  CommitAuthorClass author;
  CommitAuthorClass committer;
  String message;
  String url;
  int commentCount;

  CommitData({
    required this.author,
    required this.committer,
    required this.message,
    required this.url,
    required this.commentCount,
  });

  factory CommitData.fromJson(Map<String, dynamic> json) => CommitData(
        author: CommitAuthorClass.fromJson(json["author"]),
        committer: CommitAuthorClass.fromJson(json["committer"]),
        message: json["message"],
        url: json["url"],
        commentCount: json["comment_count"],
      );

  Map<String, dynamic> toJson() => {
        "author": author.toJson(),
        "committer": committer.toJson(),
        "message": message,
        "url": url,
        "comment_count": commentCount,
      };
}

class CommitAuthorClass {
  String name;
  String email;
  DateTime date;

  CommitAuthorClass({
    required this.name,
    required this.email,
    required this.date,
  });

  factory CommitAuthorClass.fromJson(Map<String, dynamic> json) =>
      CommitAuthorClass(
        name: json["name"],
        email: json["email"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "date": date.toIso8601String(),
      };
}

class Parent {
  String sha;
  String url;
  String htmlUrl;

  Parent({
    required this.sha,
    required this.url,
    required this.htmlUrl,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        sha: json["sha"],
        url: json["url"],
        htmlUrl: json["html_url"],
      );

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "url": url,
        "html_url": htmlUrl,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
