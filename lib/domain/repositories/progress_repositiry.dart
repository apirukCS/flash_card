import 'package:flash_card/data/models/user_progress_model.dart';

abstract class ProgressRepository {
  Future<UserProgressModel?> getProgressByVocabulary(int vocabularyId);
  Future<void> updateProgress(UserProgressModel progress);
  Future<double> getLevelProgress(int levelId);
  Future<Map<String, dynamic>> getUserStats();
  Future<int> getCurrentStreak();
}
