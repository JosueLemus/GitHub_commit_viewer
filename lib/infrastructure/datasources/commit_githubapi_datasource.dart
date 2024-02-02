import 'dart:convert';

import 'package:github_commit_viewer/domain/datasources/commits_datasource.dart';
import 'package:github_commit_viewer/domain/entities/commit.dart';
import 'package:github_commit_viewer/infrastructure/mappers/commit_mapper.dart';
import 'package:github_commit_viewer/infrastructure/models/gihub_commit.dart';
import 'package:http/http.dart' as http;

class CommitGithubAPIDataSource extends CommitsDatasource {
  @override
  Future<List<Commit>> getCommitList(String owner, String repo, int page,
      {int perPage = 10}) async {
    try {
      final queryParameters = {'page': '$page', 'per_page': '$perPage'};
      final url = Uri.https(
          "api.github.com", '/repos/$owner/$repo/commits', queryParameters);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final githubAPIResponse = GithubCommit.fromJsonList(json);
        final List<Commit> commits = githubAPIResponse
            .map((commit) => CommitMapper.commitToEntity(commit))
            .toList();
        return commits;
      } else {
        throw Exception('HTTP request error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('HTTP request error');
    }
  }
}
