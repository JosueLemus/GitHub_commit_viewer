import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String githubKey = dotenv.env['GITHUB_AUTH_TOKEN'] ?? "NO API KEY";
}
