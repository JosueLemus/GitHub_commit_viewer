import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_commit_viewer/config/theme/app_theme.dart';

final isDarkmodeProvider = StateProvider((ref) => false);

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkmode() {
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }
}
